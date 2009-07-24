require 'machinery/format'

module Machinery module LLVM
  ##
  # The LLVM bitcode (.bc file) format.
  #
  # @see http://llvm.org/docs/BitCodeFormat.html
  class Bitcode < Machinery::Format::BinaryFormat

    ##
    # @see include/llvm/Bitcode/BitCodes.h
    module StandardWidths
      BlockIDWidth               =  8 # We use VBR-8 for block IDs.
      CodeLenWidth               =  4 # Codelen are VBR-4.
      BlockSizeWidth             = 32 # BlockSize up to 2^32 32-bit words = 32GB per block.
    end

    ##
    # The standard abbrev namespace always has a way to exit a block, enter
    # a nested block, define abbrevs, and define an unabbreviated record.
    #
    # @see include/llvm/Bitcode/BitCodes.h
    module FixedAbbrevIDs
      END_BLOCK                  =  0 # Must be zero to guarantee termination for broken bitcode.
      ENTER_SUBBLOCK             =  1

      # DEFINE_ABBREV - Defines an abbrev for the current block. It consists
      # of a vbr5 for # operand infos. Each operand info is emitted with a
      # single bit to indicate if it is a literal encoding. If so, the value is
      # emitted with a vbr8. If not, the encoding is emitted as 3 bits followed
      # by the info value as a vbr5 if needed.
      DEFINE_ABBREV              =  2

      # UNABBREV_RECORDs are emitted with a vbr6 for the record code, followed by
      # a vbr6 for the # operands, followed by vbr6's for each operand.
      UNABBREV_RECORD            =  3

      # This is not a code, this is a marker for the first abbrev assignment.
      FIRST_APPLICATION_ABBREV   =  4
    end

    ##
    # All bitcode files can optionally include a BLOCKINFO block, which
    # contains metadata about other blocks in the file.
    #
    # @see include/llvm/Bitcode/BitCodes.h
    module StandardBlockIDs
      # BLOCKINFO_BLOCK is used to define metadata about blocks, for example,
      # standard abbrevs that should be available to all blocks of a specified
      # ID.
      BLOCKINFO_BLOCK_ID         =  0
      FIRST_APPLICATION_BLOCKID  =  8 # Block IDs 1-7 are reserved for future expansion.
    end

    ##
    # The BLOCKINFO block contains metadata about user-defined blocks.
    #
    # @see include/llvm/Bitcode/BitCodes.h
    module BlockInfoCodes
      BLOCKINFO_CODE_SETBID      =  1 # SETBID: [blockid#]
    end

    ##
    # The only top-level block type defined is for a module.
    #
    # @see include/llvm/Bitcode/LLVMBitCodes.h
    module BlockIDs include StandardBlockIDs
      # Blocks
      MODULE_BLOCK_ID            = FIRST_APPLICATION_BLOCKID
      # Module sub-block IDs.
      PARAMATTR_BLOCK_ID         = MODULE_BLOCK_ID + 1
      TYPE_BLOCK_ID              = PARAMATTR_BLOCK_ID + 1
      CONSTANTS_BLOCK_ID         = TYPE_BLOCK_ID + 1
      FUNCTION_BLOCK_ID          = CONSTANTS_BLOCK_ID + 1
      TYPE_SYMTAB_BLOCK_ID       = FUNCTION_BLOCK_ID + 1
      VALUE_SYMTAB_BLOCK_ID      = TYPE_SYMTAB_BLOCK_ID + 1
    end

    ##
    # MODULE blocks have a number of optional fields and subblocks.
    #
    # @see include/llvm/Bitcode/LLVMBitCodes.h
    module ModuleCodes
      MODULE_CODE_VERSION        = 1  # VERSION:     [version#]
      MODULE_CODE_TRIPLE         = 2  # TRIPLE:      [strchr x N]
      MODULE_CODE_DATALAYOUT     = 3  # DATALAYOUT:  [strchr x N]
      MODULE_CODE_ASM            = 4  # ASM:         [strchr x N]
      MODULE_CODE_SECTIONNAME    = 5  # SECTIONNAME: [strchr x N]
      MODULE_CODE_DEPLIB         = 6  # DEPLIB:      [strchr x N]
      MODULE_CODE_GLOBALVAR      = 7  # GLOBALVAR: [pointer type, isconst, initid, linkage, alignment, section, visibility, threadlocal]
      MODULE_CODE_FUNCTION       = 8  # FUNCTION:  [type, callingconv, isproto, linkage, paramattrs, alignment, section, visibility]
      MODULE_CODE_ALIAS          = 9  # ALIAS: [alias type, aliasee val#, linkage]
      MODULE_CODE_PURGEVALS      = 10 # MODULE_CODE_PURGEVALS: [numvals]
      MODULE_CODE_GCNAME         = 11 # GCNAME: [strchr x N]
    end

    ##
    # PARAMATTR blocks have code for defining a parameter attribute set.
    #
    # @see include/llvm/Bitcode/LLVMBitCodes.h
    module AttributeCodes
      PARAMATTR_CODE_ENTRY       =  1 # ENTRY: [paramidx0, attr0, paramidx1, attr1...]
    end

    ##
    # TYPE blocks have codes for each type primitive they use.
    #
    # @see include/llvm/Bitcode/LLVMBitCodes.h
    module TypeCodes
      TYPE_CODE_NUMENTRY         =  1 # NUMENTRY: [numentries]
      TYPE_CODE_VOID             =  2 # VOID
      TYPE_CODE_FLOAT            =  3 # FLOAT
      TYPE_CODE_DOUBLE           =  4 # DOUBLE
      TYPE_CODE_LABEL            =  5 # LABEL
      TYPE_CODE_OPAQUE           =  6 # OPAQUE
      TYPE_CODE_INTEGER          =  7 # INTEGER: [width]
      TYPE_CODE_POINTER          =  8 # POINTER: [pointee type]
      TYPE_CODE_FUNCTION         =  9 # FUNCTION: [vararg, retty, paramty x N]
      TYPE_CODE_STRUCT           = 10 # STRUCT: [ispacked, eltty x N]
      TYPE_CODE_ARRAY            = 11 # ARRAY: [numelts, eltty]
      TYPE_CODE_VECTOR           = 12 # VECTOR: [numelts, eltty]
      TYPE_CODE_X86_FP80         = 13 # X86 LONG DOUBLE
      TYPE_CODE_FP128            = 14 # LONG DOUBLE (112 bit mantissa)
      TYPE_CODE_PPC_FP128        = 15 # PPC LONG DOUBLE (2 doubles)
      # Any other type code is assumed to be an unknown type.
    end

    ##
    # The type symbol table only has one code (TST_ENTRY_CODE).
    #
    # @see include/llvm/Bitcode/LLVMBitCodes.h
    module TypeSymtabCodes
      TST_CODE_ENTRY             =  1 # TST_ENTRY: [typeid, namechar x N]
    end

    ##
    # The value symbol table only has one code (VST_ENTRY_CODE).
    #
    # @see include/llvm/Bitcode/LLVMBitCodes.h
    module ValueSymtabCodes
      VST_CODE_ENTRY             =  1 # VST_ENTRY: [valid, namechar x N]
      VST_CODE_BBENTRY           =  2 # VST_BBENTRY: [bbid, namechar x N]
    end

    ##
    # The constants block (CONSTANTS_BLOCK_ID) describes emission for each
    # constant and maintains an implicit current type value.
    #
    # @see include/llvm/Bitcode/LLVMBitCodes.h
    module ConstantsCodes
      CST_CODE_SETTYPE           =  1 # SETTYPE:       [typeid]
      CST_CODE_NULL              =  2 # NULL
      CST_CODE_UNDEF             =  3 # UNDEF
      CST_CODE_INTEGER           =  4 # INTEGER:       [intval]
      CST_CODE_WIDE_INTEGER      =  5 # WIDE_INTEGER:  [n x intval]
      CST_CODE_FLOAT             =  6 # FLOAT:         [fpval]
      CST_CODE_AGGREGATE         =  7 # AGGREGATE:     [n x value number]
      CST_CODE_STRING            =  8 # STRING:        [values]
      CST_CODE_CSTRING           =  9 # CSTRING:       [values]
      CST_CODE_CE_BINOP          = 10 # CE_BINOP:      [opcode, opval, opval]
      CST_CODE_CE_CAST           = 11 # CE_CAST:       [opcode, opty, opval]
      CST_CODE_CE_GEP            = 12 # CE_GEP:        [n x operands]
      CST_CODE_CE_SELECT         = 13 # CE_SELECT:     [opval, opval, opval]
      CST_CODE_CE_EXTRACTELT     = 14 # CE_EXTRACTELT: [opty, opval, opval]
      CST_CODE_CE_INSERTELT      = 15 # CE_INSERTELT:  [opval, opval, opval]
      CST_CODE_CE_SHUFFLEVEC     = 16 # CE_SHUFFLEVEC: [opval, opval, opval]
      CST_CODE_CE_CMP            = 17 # CE_CMP:        [opty, opval, opval, pred]
      CST_CODE_INLINEASM         = 18 # INLINEASM:     [sideeffect, asmstr, conststr]
    end

    ##
    # These are values used in the bitcode files to encode which cast a
    # CST_CODE_CE_CAST refers to. The values of these enums have no fixed
    # relation to the LLVM IR enum values. Changing these will break
    # compatibility with old files.
    #
    # @see include/llvm/Bitcode/LLVMBitCodes.h
    module CastOpcodes
      CAST_TRUNC                 =  0
      CAST_ZEXT                  =  1
      CAST_SEXT                  =  2
      CAST_FPTOUI                =  3
      CAST_FPTOSI                =  4
      CAST_UITOFP                =  5
      CAST_SITOFP                =  6
      CAST_FPTRUNC               =  7
      CAST_FPEXT                 =  8
      CAST_PTRTOINT              =  9
      CAST_INTTOPTR              = 10
      CAST_BITCAST               = 11
    end

    ##
    # These are values used in the bitcode files to encode which binop a
    # CST_CODE_CE_BINOP refers to. The values of these enums have
    # no fixed relation to the LLVM IR enum values. Changing these will
    # break compatibility with old files.
    #
    # @see include/llvm/Bitcode/LLVMBitCodes.h
    module BinaryOpcodes
      BINOP_ADD                  =  0
      BINOP_SUB                  =  1
      BINOP_MUL                  =  2
      BINOP_UDIV                 =  3
      BINOP_SDIV                 =  4 # overloaded for FP
      BINOP_UREM                 =  5
      BINOP_SREM                 =  6 # overloaded for FP
      BINOP_SHL                  =  7
      BINOP_LSHR                 =  8
      BINOP_ASHR                 =  9
      BINOP_AND                  = 10
      BINOP_OR                   = 11
      BINOP_XOR                  = 12
    end

    ##
    # The function body block (FUNCTION_BLOCK_ID) describes function bodies.
    # It can contain a constant block (CONSTANTS_BLOCK_ID).
    #
    # @see include/llvm/Bitcode/LLVMBitCodes.h
    module FunctionCodes
      FUNC_CODE_DECLAREBLOCKS    =  1 # DECLAREBLOCKS: [n]
      FUNC_CODE_INST_BINOP       =  2 # BINOP:      [opcode, ty, opval, opval]
      FUNC_CODE_INST_CAST        =  3 # CAST:       [opcode, ty, opty, opval]
      FUNC_CODE_INST_GEP         =  4 # GEP:        [n x operands]
      FUNC_CODE_INST_SELECT      =  5 # SELECT:     [ty, opval, opval, opval]
      FUNC_CODE_INST_EXTRACTELT  =  6 # EXTRACTELT: [opty, opval, opval]
      FUNC_CODE_INST_INSERTELT   =  7 # INSERTELT:  [ty, opval, opval, opval]
      FUNC_CODE_INST_SHUFFLEVEC  =  8 # SHUFFLEVEC: [ty, opval, opval, opval]
      FUNC_CODE_INST_CMP         =  9 # CMP:        [opty, opval, opval, pred]
      FUNC_CODE_INST_RET         = 10 # RET:        [opty, opval<both optional>]
      FUNC_CODE_INST_BR          = 11 # BR:         [bb#, bb#, cond] or [bb#]
      FUNC_CODE_INST_SWITCH      = 12 # SWITCH:     [opty, opval, n, n x ops]
      FUNC_CODE_INST_INVOKE      = 13 # INVOKE:     [attr, fnty, op0, op1, ...]
      FUNC_CODE_INST_UNWIND      = 14 # UNWIND
      FUNC_CODE_INST_UNREACHABLE = 15 # UNREACHABLE
      FUNC_CODE_INST_PHI         = 16 # PHI:        [ty, val0, bb0, ...]
      FUNC_CODE_INST_MALLOC      = 17 # MALLOC:     [instty, op, align]
      FUNC_CODE_INST_FREE        = 18 # FREE:       [opty, op]
      FUNC_CODE_INST_ALLOCA      = 19 # ALLOCA:     [instty, op, align]
      FUNC_CODE_INST_LOAD        = 20 # LOAD:       [opty, op, align, vol]
      FUNC_CODE_INST_STORE       = 21 # STORE:      [valty, val, ptr, align, vol]
      FUNC_CODE_INST_CALL        = 22 # CALL:       [attr, fnty, fnid, args...]
      FUNC_CODE_INST_VAARG       = 23 # VAARG:      [valistty, valist, instty]
      FUNC_CODE_INST_STORE2      = 24 # STORE:      [ptrty, ptr, val, align, vol]
      FUNC_CODE_INST_GETRESULT   = 25 # GETRESULT:  [ty, opval, n]
      FUNC_CODE_INST_EXTRACTVAL  = 26 # EXTRACTVAL: [n x operands]
      FUNC_CODE_INST_INSERTVAL   = 27 # INSERTVAL:  [n x operands]
      FUNC_CODE_INST_CMP2        = 28 # CMP2:       [opty, opval, opval, pred]
      FUNC_CODE_INST_VSELECT     = 29 # VSELECT:    [ty, opval, opval, predty, pred]
    end

    ##
    # Enum values for the bitcode format and for LLVM IR bitcode files.
    module Codes
      # @see include/llvm/Bitcode/BitCodes.h
      include StandardWidths, FixedAbbrevIDs, StandardBlockIDs, BlockInfoCodes

      # @see include/llvm/Bitcode/LLVMBitCodes.h
      include BlockIDs, ModuleCodes, AttributeCodes, TypeCodes
      include TypeSymtabCodes, ValueSymtabCodes, ConstantsCodes
      include CastOpcodes, BinaryOpcodes, FunctionCodes
    end
  end
end end
