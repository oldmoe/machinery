require 'machinery/arch'

module Machinery module Architecture

  ##
  # The Python 2.6 virtual machine architecture.
  module PythonVM extend StackMachine

    ##
    # The Python virtual machine opcodes.
    #
    # @see bin/pyc-opcodes.py
    # @see doc/pyc/opcodes-2.6.txt
    module Opcodes
      STOP_CODE            = 0x00 # 000
      POP_TOP              = 0x01 # 001
      ROT_TWO              = 0x02 # 002
      ROT_THREE            = 0x03 # 003
      DUP_TOP              = 0x04 # 004
      ROT_FOUR             = 0x05 # 005
      NOP                  = 0x09 # 009
      UNARY_POSITIVE       = 0x0A # 010
      UNARY_NEGATIVE       = 0x0B # 011
      UNARY_NOT            = 0x0C # 012
      UNARY_CONVERT        = 0x0D # 013
      UNARY_INVERT         = 0x0F # 015
      LIST_APPEND          = 0x12 # 018
      BINARY_POWER         = 0x13 # 019
      BINARY_MULTIPLY      = 0x14 # 020
      BINARY_DIVIDE        = 0x15 # 021
      BINARY_MODULO        = 0x16 # 022
      BINARY_ADD           = 0x17 # 023
      BINARY_SUBTRACT      = 0x18 # 024
      BINARY_SUBSCR        = 0x19 # 025
      BINARY_FLOOR_DIVIDE  = 0x1A # 026
      BINARY_TRUE_DIVIDE   = 0x1B # 027
      INPLACE_FLOOR_DIVIDE = 0x1C # 028
      INPLACE_TRUE_DIVIDE  = 0x1D # 029
      SLICE                = 0x1E # 030
      SLICE_0              = 0x1E # 030 # SLICE+0
      SLICE_1              = 0x1F # 031 # SLICE+1
      SLICE_2              = 0x20 # 032 # SLICE+2
      SLICE_3              = 0x21 # 033 # SLICE+3
      STORE_SLICE          = 0x28 # 040
      STORE_SLICE_0        = 0x28 # 040 # STORE_SLICE+0
      STORE_SLICE_1        = 0x29 # 041 # STORE_SLICE+1
      STORE_SLICE_2        = 0x2A # 042 # STORE_SLICE+2
      STORE_SLICE_3        = 0x2B # 043 # STORE_SLICE+3
      DELETE_SLICE         = 0x32 # 050
      DELETE_SLICE_0       = 0x32 # 050 # DELETE_SLICE+0
      DELETE_SLICE_1       = 0x33 # 051 # DELETE_SLICE+1
      DELETE_SLICE_2       = 0x34 # 052 # DELETE_SLICE+2
      DELETE_SLICE_3       = 0x35 # 053 # DELETE_SLICE+3
      STORE_MAP            = 0x36 # 054
      INPLACE_ADD          = 0x37 # 055
      INPLACE_SUBTRACT     = 0x38 # 056
      INPLACE_MULTIPLY     = 0x39 # 057
      INPLACE_DIVIDE       = 0x3A # 058
      INPLACE_MODULO       = 0x3B # 059
      STORE_SUBSCR         = 0x3C # 060
      DELETE_SUBSCR        = 0x3D # 061
      BINARY_LSHIFT        = 0x3E # 062
      BINARY_RSHIFT        = 0x3F # 063
      BINARY_AND           = 0x40 # 064
      BINARY_XOR           = 0x41 # 065
      BINARY_OR            = 0x42 # 066
      INPLACE_POWER        = 0x43 # 067
      GET_ITER             = 0x44 # 068
      PRINT_EXPR           = 0x46 # 070
      PRINT_ITEM           = 0x47 # 071
      PRINT_NEWLINE        = 0x48 # 072
      PRINT_ITEM_TO        = 0x49 # 073
      PRINT_NEWLINE_TO     = 0x4A # 074
      INPLACE_LSHIFT       = 0x4B # 075
      INPLACE_RSHIFT       = 0x4C # 076
      INPLACE_AND          = 0x4D # 077
      INPLACE_XOR          = 0x4E # 078
      INPLACE_OR           = 0x4F # 079
      BREAK_LOOP           = 0x50 # 080
      WITH_CLEANUP         = 0x51 # 081
      LOAD_LOCALS          = 0x52 # 082
      RETURN_VALUE         = 0x53 # 083
      IMPORT_STAR          = 0x54 # 084
      EXEC_STMT            = 0x55 # 085
      YIELD_VALUE          = 0x56 # 086
      POP_BLOCK            = 0x57 # 087
      END_FINALLY          = 0x58 # 088
      BUILD_CLASS          = 0x59 # 089
      STORE_NAME           = 0x5A # 090
      DELETE_NAME          = 0x5B # 091
      UNPACK_SEQUENCE      = 0x5C # 092
      FOR_ITER             = 0x5D # 093
      STORE_ATTR           = 0x5F # 095
      DELETE_ATTR          = 0x60 # 096
      STORE_GLOBAL         = 0x61 # 097
      DELETE_GLOBAL        = 0x62 # 098
      DUP_TOPX             = 0x63 # 099
      LOAD_CONST           = 0x64 # 100
      LOAD_NAME            = 0x65 # 101
      BUILD_TUPLE          = 0x66 # 102
      BUILD_LIST           = 0x67 # 103
      BUILD_MAP            = 0x68 # 104
      LOAD_ATTR            = 0x69 # 105
      COMPARE_OP           = 0x6A # 106
      IMPORT_NAME          = 0x6B # 107
      IMPORT_FROM          = 0x6C # 108
      JUMP_FORWARD         = 0x6E # 110
      JUMP_IF_FALSE        = 0x6F # 111
      JUMP_IF_TRUE         = 0x70 # 112
      JUMP_ABSOLUTE        = 0x71 # 113
      LOAD_GLOBAL          = 0x74 # 116
      CONTINUE_LOOP        = 0x77 # 119
      SETUP_LOOP           = 0x78 # 120
      SETUP_EXCEPT         = 0x79 # 121
      SETUP_FINALLY        = 0x7A # 122
      LOAD_FAST            = 0x7C # 124
      STORE_FAST           = 0x7D # 125
      DELETE_FAST          = 0x7E # 126
      RAISE_VARARGS        = 0x82 # 130
      CALL_FUNCTION        = 0x83 # 131
      MAKE_FUNCTION        = 0x84 # 132
      BUILD_SLICE          = 0x85 # 133
      MAKE_CLOSURE         = 0x86 # 134
      LOAD_CLOSURE         = 0x87 # 135
      LOAD_DEREF           = 0x88 # 136
      STORE_DEREF          = 0x89 # 137
      CALL_FUNCTION_VAR    = 0x8C # 140
      CALL_FUNCTION_KW     = 0x8D # 141
      CALL_FUNCTION_VAR_KW = 0x8E # 142
      EXTENDED_ARG         = 0x8F # 143
    end

    ##
    # A Python virtual machine instruction.
    class Instruction < Machinery::Architecture::Instruction
      def self.inherited(subclass)
        if const = Opcodes.const_get(subclass.name.split('::').last)
          subclass.opcode(const)
        end
      end

      def self.effect(diagram = {})
        # TODO
      end
    end

    ##
    # The Python virtual machine instruction set.
    module Instructions
      class STOP_CODE < Instruction; end
      class POP_TOP < Instruction; end
      class ROT_TWO < Instruction; end
      class ROT_THREE < Instruction; end
      class DUP_TOP < Instruction; end
      class ROT_FOUR < Instruction; end
      class NOP < Instruction; end
      class UNARY_POSITIVE < Instruction; end
      class UNARY_NEGATIVE < Instruction; end
      class UNARY_NOT < Instruction; end
      class UNARY_CONVERT < Instruction; end
      class UNARY_INVERT < Instruction; end
      class LIST_APPEND < Instruction; end
      class BINARY_POWER < Instruction; end
      class BINARY_MULTIPLY < Instruction; end
      class BINARY_DIVIDE < Instruction; end
      class BINARY_MODULO < Instruction; end
      class BINARY_ADD < Instruction; end
      class BINARY_SUBTRACT < Instruction; end
      class BINARY_SUBSCR < Instruction; end
      class BINARY_FLOOR_DIVIDE < Instruction; end
      class BINARY_TRUE_DIVIDE < Instruction; end
      class INPLACE_FLOOR_DIVIDE < Instruction; end
      class INPLACE_TRUE_DIVIDE < Instruction; end
      class SLICE < Instruction; end
      class SLICE_0 < Instruction; end
      class SLICE_1 < Instruction; end
      class SLICE_2 < Instruction; end
      class SLICE_3 < Instruction; end
      class STORE_SLICE < Instruction; end
      class STORE_SLICE_0 < Instruction; end
      class STORE_SLICE_1 < Instruction; end
      class STORE_SLICE_2 < Instruction; end
      class STORE_SLICE_3 < Instruction; end
      class DELETE_SLICE < Instruction; end
      class DELETE_SLICE_0 < Instruction; end
      class DELETE_SLICE_1 < Instruction; end
      class DELETE_SLICE_2 < Instruction; end
      class DELETE_SLICE_3 < Instruction; end
      class STORE_MAP < Instruction; end
      class INPLACE_ADD < Instruction; end
      class INPLACE_SUBTRACT < Instruction; end
      class INPLACE_MULTIPLY < Instruction; end
      class INPLACE_DIVIDE < Instruction; end
      class INPLACE_MODULO < Instruction; end
      class STORE_SUBSCR < Instruction; end
      class DELETE_SUBSCR < Instruction; end
      class BINARY_LSHIFT < Instruction; end
      class BINARY_RSHIFT < Instruction; end
      class BINARY_AND < Instruction; end
      class BINARY_XOR < Instruction; end
      class BINARY_OR < Instruction; end
      class INPLACE_POWER < Instruction; end
      class GET_ITER < Instruction; end
      class PRINT_EXPR < Instruction; end
      class PRINT_ITEM < Instruction; end
      class PRINT_NEWLINE < Instruction; end
      class PRINT_ITEM_TO < Instruction; end
      class PRINT_NEWLINE_TO < Instruction; end
      class INPLACE_LSHIFT < Instruction; end
      class INPLACE_RSHIFT < Instruction; end
      class INPLACE_AND < Instruction; end
      class INPLACE_XOR < Instruction; end
      class INPLACE_OR < Instruction; end
      class BREAK_LOOP < Instruction; end
      class WITH_CLEANUP < Instruction; end
      class LOAD_LOCALS < Instruction; end
      class RETURN_VALUE < Instruction; end
      class IMPORT_STAR < Instruction; end
      class EXEC_STMT < Instruction; end
      class YIELD_VALUE < Instruction; end
      class POP_BLOCK < Instruction; end
      class END_FINALLY < Instruction; end
      class BUILD_CLASS < Instruction; end
      class STORE_NAME < Instruction; end
      class DELETE_NAME < Instruction; end
      class UNPACK_SEQUENCE < Instruction; end
      class FOR_ITER < Instruction; end
      class STORE_ATTR < Instruction; end
      class DELETE_ATTR < Instruction; end
      class STORE_GLOBAL < Instruction; end
      class DELETE_GLOBAL < Instruction; end
      class DUP_TOPX < Instruction; end
      class LOAD_CONST < Instruction; end
      class LOAD_NAME < Instruction; end
      class BUILD_TUPLE < Instruction; end
      class BUILD_LIST < Instruction; end
      class BUILD_MAP < Instruction; end
      class LOAD_ATTR < Instruction; end
      class COMPARE_OP < Instruction; end
      class IMPORT_NAME < Instruction; end
      class IMPORT_FROM < Instruction; end
      class JUMP_FORWARD < Instruction; end
      class JUMP_IF_FALSE < Instruction; end
      class JUMP_IF_TRUE < Instruction; end
      class JUMP_ABSOLUTE < Instruction; end
      class LOAD_GLOBAL < Instruction; end
      class CONTINUE_LOOP < Instruction; end
      class SETUP_LOOP < Instruction; end
      class SETUP_EXCEPT < Instruction; end
      class SETUP_FINALLY < Instruction; end
      class LOAD_FAST < Instruction; end
      class STORE_FAST < Instruction; end
      class DELETE_FAST < Instruction; end
      class RAISE_VARARGS < Instruction; end
      class CALL_FUNCTION < Instruction; end
      class MAKE_FUNCTION < Instruction; end
      class BUILD_SLICE < Instruction; end
      class MAKE_CLOSURE < Instruction; end
      class LOAD_CLOSURE < Instruction; end
      class LOAD_DEREF < Instruction; end
      class STORE_DEREF < Instruction; end
      class CALL_FUNCTION_VAR < Instruction; end
      class CALL_FUNCTION_KW < Instruction; end
      class CALL_FUNCTION_VAR_KW < Instruction; end
      class EXTENDED_ARG < Instruction; end
    end
  end

end end
