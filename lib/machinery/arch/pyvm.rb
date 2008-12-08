require 'machinery/arch'

module Machinery module Architecture

  ##
  # The Python 2.6 virtual machine architecture.
  module PythonVM extend StackMachine
    stack :stack

    ##
    # The Python virtual machine's opcodes.
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
    class Instruction < Architecture::Instruction
      stack_name :stack

      def self.inherited(subclass)
        begin
          subclass.opcode(Opcodes.const_get(subclass.instruction_name))
        rescue NameError => e
          raise NameError.new("missing opcode constant for instruction #{subclass.instruction_name}")
        end
      end
    end

    ##
    # The Python virtual machine's instruction set.
    #
    # @see http://docs.python.org/lib/bytecodes.html
    # @see http://docs.python.org/library/dis.html#bytecodes
    module Instructions extend Architecture::InstructionSet(Instruction)

      ##
      # Indicates end-of-code to the compiler; not used by the interpreter.
      class STOP_CODE < Instruction()
        emulate do raise InvalidInstruction end
      end

      ##
      # Removes the top-of-stack (TOS) item.
      class POP_TOP < Instruction()
        effect  [:a] => []
        emulate do stack.pop end
      end

      ##
      # Swaps the two top-most stack items.
      class ROT_TWO < Instruction()
        effect  [:a, :b] => [:b, :a]
      end

      ##
      # Lifts second and third stack item one position up, moves top down to position three.
      class ROT_THREE < Instruction()
        effect  [:a, :b, :c] => [:c, :a, :b]
      end

      ##
      # Duplicates the reference on top of the stack.
      class DUP_TOP < Instruction()
        effect  [:a] => [:a, :a]
      end

      ##
      # Lifts second, third and fourth stack item one position up, moves top down to position four.
      class ROT_FOUR < Instruction()
        effect  [:a, :b, :c, :d] => [:d, :a, :b, :c]
      end

      ##
      # Do nothing code. Used as a placeholder by the bytecode optimizer.
      class NOP < Instruction()
        emulate do Thread.pass end
      end

      ##
      # Implements <tt>TOS = +TOS</tt>.
      class UNARY_POSITIVE < Instruction()
        effect  [:a] => [:b] # TODO
      end

      ##
      # Implements <tt>TOS = -TOS</tt>.
      class UNARY_NEGATIVE < Instruction()
        effect  [:a] => [:b] # TODO
      end

      ##
      # Implements <tt>TOS = not TOS</tt>.
      class UNARY_NOT < Instruction()
        effect  [:a] => [:b] # TODO
      end

      ##
      # Implements <tt>TOS = `TOS`</tt>.
      class UNARY_CONVERT < Instruction()
        effect  [:a] => [:b] # TODO
      end

      ##
      # Implements <tt>TOS = ~TOS</tt>.
      class UNARY_INVERT < Instruction()
        effect  [:a] => [:b] # TODO
      end

      ##
      # Calls <tt>list.append(TOS1, TOS)</tt>. Used to implement list comprehensions.
      class LIST_APPEND < Instruction()
        effect  [:a, :b] => [] # TODO
      end

      ##
      # Implements <tt>TOS = TOS1 ** TOS</tt>.
      class BINARY_POWER < Instruction()
        effect  [:a, :b] => [:"**".to_proc]
      end

      ##
      # Implements <tt>TOS = TOS1 * TOS</tt>.
      class BINARY_MULTIPLY < Instruction()
        effect  [:a, :b] => [:*.to_proc]
      end

      ##
      # Implements <tt>TOS = TOS1 / TOS</tt> when <tt>from __future__ import division</tt> is not in effect.
      class BINARY_DIVIDE < Instruction()
        effect  [:a, :b] => [:"/".to_proc]
      end

      ##
      # Implements <tt>TOS = TOS1 % TOS</tt>.
      class BINARY_MODULO < Instruction()
        effect  [:a, :b] => [:"%".to_proc]
      end

      ##
      # Implements <tt>TOS = TOS1 + TOS</tt>.
      class BINARY_ADD < Instruction()
        effect  [:a, :b] => [:+.to_proc]
      end

      ##
      # Implements <tt>TOS = TOS1 - TOS</tt>.
      class BINARY_SUBTRACT < Instruction()
        effect  [:a, :b] => [:"-".to_proc]
      end

      ##
      # Implements <tt>TOS = TOS1[TOS]</tt>.
      class BINARY_SUBSCR < Instruction()
        effect  [:a, :b] => [:[].to_proc]
      end

      ##
      # Implements <tt>TOS = TOS1 // TOS</tt>.
      class BINARY_FLOOR_DIVIDE < Instruction()
        effect  [:a, :b] => [:c] # TODO
      end

      ##
      # Implements <tt>TOS = TOS1 / TOS</tt> when <tt>from __future__ import division</tt> is in effect.
      class BINARY_TRUE_DIVIDE < Instruction()
        effect  [:a, :b] => [:"/".to_proc]
      end

      ##
      # Implements in-place <tt>TOS = TOS1 // TOS</tt>.
      class INPLACE_FLOOR_DIVIDE < Instruction()
        effect  [:a, :b] => [:c] # TODO
      end

      ##
      # Implements in-place <tt>TOS = TOS1 / TOS</tt> when <tt>from __future__ import division</tt> is in effect.
      class INPLACE_TRUE_DIVIDE < Instruction()
        effect  [:a, :b] => [:"/".to_proc]
      end

      ##
      # Alias for <tt>SLICE+0</tt>.
      class SLICE < Instruction()
        # TODO
      end

      ##
      # Implements <tt>TOS = TOS[:]</tt>.
      class SLICE_0 < SLICE; end

      ##
      # Implements <tt>TOS = TOS1[TOS:]</tt>.
      class SLICE_1 < Instruction()
        # TODO
      end

      ##
      # Implements <tt>TOS = TOS1[:TOS]</tt>.
      class SLICE_2 < Instruction()
        # TODO
      end

      ##
      # Implements <tt>TOS = TOS2[TOS1:TOS]</tt>.
      class SLICE_3 < Instruction()
        # TODO
      end

      ##
      # Alias for <tt>STORE_SLICE+0</tt>.
      class STORE_SLICE < Instruction()
        # TODO
      end

      ##
      # Implements <tt>TOS[:] = TOS1</tt>.
      class STORE_SLICE_0 < STORE_SLICE; end

      ##
      # Implements <tt>TOS1[TOS:] = TOS2</tt>.
      class STORE_SLICE_1 < Instruction()
        # TODO
      end

      ##
      # Implements <tt>TOS1[:TOS] = TOS2</tt>.
      class STORE_SLICE_2 < Instruction()
        # TODO
      end

      ##
      # Implements <tt>TOS2[TOS1:TOS] = TOS3</tt>.
      class STORE_SLICE_3 < Instruction()
        # TODO
      end

      ##
      # Alias for <tt>DELETE_SLICE+0</tt>.
      class DELETE_SLICE < Instruction()
        # TODO
      end

      ##
      # Implements <tt>del TOS[:]</tt>.
      class DELETE_SLICE_0 < DELETE_SLICE; end

      ##
      # Implements <tt>del TOS1[TOS:]</tt>.
      class DELETE_SLICE_1 < Instruction()
        # TODO
      end

      ##
      # Implements <tt>del TOS1[:TOS]</tt>.
      class DELETE_SLICE_2 < Instruction()
        # TODO
      end

      ##
      # Implements <tt>del TOS2[TOS1:TOS]</tt>.
      class DELETE_SLICE_3 < Instruction()
        # TODO
      end

      ##
      # Store a key and value pair in a dictionary. Pops the key and value while leaving the dictionary on the stack.
      class STORE_MAP < Instruction()
        # TODO
      end

      ##
      # Implements in-place <tt>TOS = TOS1 + TOS</tt>.
      class INPLACE_ADD < Instruction()
        effect  [:a, :b] => [:+.to_proc]
      end

      ##
      # Implements in-place <tt>TOS = TOS1 - TOS</tt>.
      class INPLACE_SUBTRACT < Instruction()
        effect  [:a, :b] => [:"-".to_proc]
      end

      ##
      # Implements in-place <tt>TOS = TOS1 * TOS</tt>.
      class INPLACE_MULTIPLY < Instruction()
        effect  [:a, :b] => [:*.to_proc]
      end

      ##
      # Implements in-place <tt>TOS = TOS1 / TOS</tt> when <tt>from __future__ import division</tt> is not in effect.
      class INPLACE_DIVIDE < Instruction()
        effect  [:a, :b] => [:"/".to_proc]
      end

      ##
      # Implements in-place <tt>TOS = TOS1 % TOS.</tt>
      class INPLACE_MODULO < Instruction()
        effect  [:a, :b] => [:"%".to_proc]
      end

      ##
      # Implements <tt>TOS1[TOS] = TOS2</tt>.
      class STORE_SUBSCR < Instruction()
        # TODO
      end

      ##
      # Implements <tt>del TOS1[TOS]</tt>.
      class DELETE_SUBSCR < Instruction()
        # TODO
      end

      ##
      # Implements <tt>TOS = TOS1 << TOS</tt>.
      class BINARY_LSHIFT < Instruction()
        effect  [:a, :b] => [:<<.to_proc]
      end

      ##
      # Implements <tt>TOS = TOS1 >> TOS</tt>.
      class BINARY_RSHIFT < Instruction()
        effect  [:a, :b] => [:>>.to_proc]
      end

      ##
      # Implements <tt>TOS = TOS1 & TOS</tt>.
      class BINARY_AND < Instruction()
        effect  [:a, :b] => [:"&".to_proc]
      end

      ##
      # Implements <tt>TOS = TOS1 ^ TOS</tt>.
      class BINARY_XOR < Instruction()
        effect  [:a, :b] => [:"^".to_proc]
      end

      ##
      # Implements <tt>TOS = TOS1 | TOS</tt>.
      class BINARY_OR < Instruction()
        effect  [:a, :b] => [:"|".to_proc]
      end

      ##
      # Implements in-place <tt>TOS = TOS1 ** TOS</tt>.
      class INPLACE_POWER < Instruction()
        effect  [:a, :b] => [:"**".to_proc]
      end

      ##
      # Implements <tt>TOS = iter(TOS)</tt>.
      class GET_ITER < Instruction()
        # TODO
      end

      ##
      # Implements the expression statement for the interactive mode. TOS is removed from the stack and printed. In non-interactive mode, an expression statement is terminated with <tt>POP_STACK</tt>.
      class PRINT_EXPR < Instruction()
        effect  [:a] => []
        emulate do puts stack.pop end
      end

      ##
      # Prints TOS to the file-like object bound to <tt>sys.stdout</tt>. There is one such instruction for each item in the <tt>print</tt> statement.
      class PRINT_ITEM < Instruction()
        effect  [:a] => []
        # TODO
      end

      ##
      # Prints a new line on <tt>sys.stdout</tt>. This is generated as the last operation of a <tt>print</tt> statement, unless the statement ends with a comma.
      class PRINT_NEWLINE < Instruction()
        emulate do puts end
      end

      ##
      # Like <tt>PRINT_ITEM</tt>, but prints the item second from TOS to the file-like object at TOS. This is used by the extended <tt>print</tt> statement.
      class PRINT_ITEM_TO < Instruction()
        # TODO
      end

      ##
      # Like <tt>PRINT_NEWLINE</tt>, but prints the new line on the file-like object on the TOS. This is used by the extended <tt>print</tt> statement.
      class PRINT_NEWLINE_TO < Instruction()
        # TODO
      end

      ##
      # Implements in-place <tt>TOS = TOS1 << TOS</tt>.
      class INPLACE_LSHIFT < Instruction()
        effect  [:a, :b] => [:<<.to_proc]
      end

      ##
      # Implements in-place <tt>TOS = TOS1 >> TOS</tt>.
      class INPLACE_RSHIFT < Instruction()
        effect  [:a, :b] => [:>>.to_proc]
      end

      ##
      # Implements in-place <tt>TOS = TOS1 & TOS</tt>.
      class INPLACE_AND < Instruction()
        effect  [:a, :b] => [:"&".to_proc]
      end

      ##
      # Implements in-place <tt>TOS = TOS1 ^ TOS</tt>.
      class INPLACE_XOR < Instruction()
        effect  [:a, :b] => [:"^".to_proc]
      end

      ##
      # Implements in-place <tt>TOS = TOS1 | TOS</tt>.
      class INPLACE_OR < Instruction()
        effect  [:a, :b] => [:"|".to_proc]
      end

      ##
      # Terminates a loop due to a <tt>break</tt> statement.
      class BREAK_LOOP < Instruction()
        # TODO
      end

      ##
      # Cleans up the stack when a <tt>with</tt> statement block exits. On top of the stack are 1-3 values indicating how/why the <tt>finally</tt> clause was entered.
      class WITH_CLEANUP < Instruction()
        # TODO
      end

      ##
      # Pushes a reference to the locals of the current scope on the stack. This is used in the code for a class definition: after the class body is evaluated, the locals are passed to the class definition.
      class LOAD_LOCALS < Instruction()
        # TODO
      end

      ##
      # Returns with TOS to the caller of the function.
      class RETURN_VALUE < Instruction()
        effect  [:a] => []
        # TODO
      end

      ##
      # Loads all symbols not starting with <tt>'_'</tt> directly from the module TOS to the local namespace. The module is popped after loading all names. This opcode implements <tt>from module import *</tt>.
      class IMPORT_STAR < Instruction()
        # TODO
      end

      ##
      # Implements <tt>exec TOS2,TOS1,TOS</tt>. The compiler fills missing optional parameters with <tt>None</tt>.
      class EXEC_STMT < Instruction()
        # TODO
      end

      ##
      # Pops TOS and yields it from a generator.
      class YIELD_VALUE < Instruction()
        effect  [:a] => []
        # TODO
      end

      ##
      # Removes one block from the block stack. Per frame, there is a stack of blocks, denoting nested loops, <tt>try</tt> statements, and such.
      class POP_BLOCK < Instruction()
        # TODO
      end

      ##
      # Terminates a <tt>finally</tt> clause. The interpreter recalls whether the exception has to be re-raised, or whether the function returns, and continues with the outer-next block.
      class END_FINALLY < Instruction()
        # TODO
      end

      ##
      # Creates a new class object. TOS is the methods dictionary, TOS1 the tuple of the names of the base classes, and TOS2 the class name.
      class BUILD_CLASS < Instruction()
        # TODO
      end

      ##
      # Implements <tt>name = TOS</tt>. <em>namei</em> is the index of <em>name</em> in the attribute <tt>co_names</tt> of the code object. The compiler tries to use <tt>STORE_FAST</tt> or <tt>STORE_GLOBAL</tt> if possible.
      class STORE_NAME < Instruction(:namei)
        # TODO
      end

      ##
      # Implements <tt>del name</tt>, where <em>namei</em> is the index into <tt>co_names</tt> attribute of the code object.
      class DELETE_NAME < Instruction(:namei)
        # TODO
      end

      ##
      # Unpacks TOS into <em>count</em> individual values, which are put onto the stack right-to-left.
      class UNPACK_SEQUENCE < Instruction(:count)
        # TODO
      end

      ##
      # TOS is an iterator. Call its <tt>next()</tt> method. If this yields a new value, push it on the stack (leaving the iterator below it). If the iterator indicates it is exhausted TOS is popped, and the bytecode counter is incremented by <em>delta</em>.
      class FOR_ITER < Instruction(:delta)
        # TODO
      end

      ##
      # Implements <tt>TOS.name = TOS1</tt>, where <em>namei</em> is the index of <em>name</em> in <tt>co_names</tt>.
      class STORE_ATTR < Instruction(:namei)
        # TODO
      end

      ##
      # Implements <tt>del TOS.name</tt>, using <em>namei</em> as index into <tt>co_names</tt>.
      class DELETE_ATTR < Instruction(:namei)
        # TODO
      end

      ##
      # Works as <tt>STORE_NAME</tt>, but stores the name as a global.
      class STORE_GLOBAL < Instruction(:namei)
        # TODO
      end

      ##
      # Works as <tt>DELETE_NAME</tt>, but deletes a global name.
      class DELETE_GLOBAL < Instruction(:namei)
        # TODO
      end

      ##
      # Duplicate <em>count</em> items, keeping them in the same order. Due to implementation limits, <em>count</em> should be between 1 and 5 inclusive.
      class DUP_TOPX < Instruction(:count)
        # TODO
      end

      ##
      # Pushes <tt>co_consts[consti]</tt> onto the stack.
      class LOAD_CONST < Instruction(:consti)
        effect  [] => [:a]
        emulate do |consti| stack.push(codeobject.consts[consti]) end
        encode  do |const|  emit(opcode, block.const(const), 0) end
      end

      ##
      # Pushes the value associated with <tt>co_names[namei]</tt> onto the stack.
      class LOAD_NAME < Instruction(:namei)
        # TODO
      end

      ##
      # Creates a tuple consuming <em>count</em> items from the stack, and pushes the resulting tuple onto the stack.
      class BUILD_TUPLE < Instruction(:count)
        # TODO
      end

      ##
      # Works as <tt>BUILD_TUPLE</tt>, but creates a list.
      class BUILD_LIST < Instruction(:count)
        # TODO
      end

      ##
      # Pushes a new dictionary object onto the stack. The dictionary is pre-sized to hold <em>count</em> entries.
      class BUILD_MAP < Instruction(:count)
        # TODO
      end

      ##
      # Replaces TOS with <tt>getattr(TOS, co_names[namei])</tt>.
      class LOAD_ATTR < Instruction(:namei)
        # TODO
      end

      ##
      # Performs a Boolean operation. The operation name can be found in <tt>cmp_op[opname]</tt>.
      class COMPARE_OP < Instruction(:opname)
        # TODO
      end

      ##
      # Imports the module <tt>co_names[namei]</tt>. TOS and TOS1 are popped and provide the <em>fromlist</em> and <em>level</em> arguments of <tt>__import__()</tt>. The module object is pushed onto the stack. The current namespace is not affected: for a proper <tt>import</tt> statement, a subsequent <tt>STORE_FAST</tt> instruction modifies the namespace.
      class IMPORT_NAME < Instruction(:namei)
        # TODO
      end

      ##
      # Loads the attribute <tt>co_names[namei]</tt> from the module found in TOS. The resulting object is pushed onto the stack, to be subsequently stored by a <tt>STORE_FAST</tt> instruction.
      class IMPORT_FROM < Instruction(:namei)
        # TODO
      end

      ##
      # Increments bytecode counter by <em>delta</em>.
      class JUMP_FORWARD < Instruction(:delta)
        # TODO
      end

      ##
      # If TOS is false, increment the bytecode counter by <em>delta</em>. TOS is not changed.
      class JUMP_IF_FALSE < Instruction(:delta)
        # TODO
      end

      ##
      # If TOS is true, increment the bytecode counter by <em>delta</em>. TOS is left on the stack.
      class JUMP_IF_TRUE < Instruction(:delta)
        # TODO
      end

      ##
      # Set bytecode counter to <em>target</em>.
      class JUMP_ABSOLUTE < Instruction(:target)
        # TODO
      end

      ##
      # Loads the global named <tt>co_names[namei]</tt> onto the stack.
      class LOAD_GLOBAL < Instruction(:namei)
        # TODO
      end

      ##
      # Continues a loop due to a <tt>continue</tt> statement. <em>target</em> is the address to jump to (which should be a <tt>FOR_ITER</tt> instruction).
      class CONTINUE_LOOP < Instruction(:target)
        # TODO
      end

      ##
      # Pushes a block for a loop onto the block stack. The block spans from the current instruction with a size of <em>delta</em> bytes.
      class SETUP_LOOP < Instruction(:delta)
        # TODO
      end

      ##
      # Pushes a try block from a <tt>try-except</tt> clause onto the block stack. <em>delta</em> points to the first <tt>except</tt> block.
      class SETUP_EXCEPT < Instruction(:delta)
        # TODO
      end

      ##
      # Pushes a try block from a <tt>try-except</tt> clause onto the block stack. <em>delta</em> points to the <tt>finally</tt> block.
      class SETUP_FINALLY < Instruction(:delta)
        # TODO
      end

      ##
      # Pushes a reference to the local <tt>co_varnames[var_num]</tt> onto the stack.
      class LOAD_FAST < Instruction(:var_num)
        # TODO
      end

      ##
      # Stores TOS into the local <tt>co_varnames[var_num]</tt>.
      class STORE_FAST < Instruction(:var_num)
        # TODO
      end

      ##
      # Deletes local <tt>co_varnames[var_num]</tt>.
      class DELETE_FAST < Instruction(:var_num)
        # TODO
      end

      ##
      # Raises an exception. <em>argc</em> indicates the number of parameters to the <tt>raise</tt> statement, ranging from 0 to 3. The handler will find the traceback as TOS2, the parameter as TOS1, and the exception as TOS.
      class RAISE_VARARGS < Instruction(:argc)
        # TODO
      end

      ##
      # Calls a function. The low byte of <em>argc</em> indicates the number of positional parameters, the high byte the number of keyword parameters. On the stack, the opcode finds the keyword parameters first. For each keyword argument, the value is on top of the key. Below the keyword parameters, the positional parameters are on the stack, with the right-most parameter on top. Below the parameters, the function object to call is on the stack. Pops all function arguments, and the function itself off the stack, and pushes the return value.
      class CALL_FUNCTION < Instruction(:argc)
        # TODO
      end

      ##
      # Pushes a new function object on the stack. TOS is the code associated with the function. The function object is defined to have <em>argc</em> default parameters, which are found below TOS.
      class MAKE_FUNCTION < Instruction(:argc)
        # TODO
      end

      ##
      # Pushes a slice object on the stack. <em>argc</em> must be 2 or 3. If it is 2, <tt>slice(TOS1, TOS)</tt> is pushed; if it is 3, <tt>slice(TOS2, TOS1, TOS)</tt> is pushed. See the <tt>slice()</tt> built-in function for more information.
      class BUILD_SLICE < Instruction(:argc)
        # TODO
      end

      ##
      # Creates a new function object, sets its <em>func_closure</em> slot, and pushes it on the stack. TOS is the code associated with the function, TOS1 the tuple containing cells for the closure's free variables. The function also has <em>argc</em> default parameters, which are found below the cells.
      class MAKE_CLOSURE < Instruction(:argc)
        # TODO
      end

      ##
      # Pushes a reference to the cell contained in slot <em>i</em> of the cell and free variable storage. The name of the variable is <tt>co_cellvars[i]</tt> if <em>i</em> is less than the length of <em>co_cellvars</em>. Otherwise it is <tt>co_freevars[i - len(co_cellvars)]</tt>.
      class LOAD_CLOSURE < Instruction(:i)
        # TODO
      end

      ##
      # Loads the cell contained in slot <em>i</em> of the cell and free variable storage. Pushes a reference to the object the cell contains on the stack.
      class LOAD_DEREF < Instruction(:i)
        # TODO
      end

      ##
      # Stores TOS into the cell contained in slot <em>i</em> of the cell and free variable storage.
      class STORE_DEREF < Instruction(:i)
        # TODO
      end

      ##
      # Calls a function. <em>argc</em> is interpreted as in <tt>CALL_FUNCTION</tt>. The top element on the stack contains the variable argument list, followed by keyword and positional arguments.
      class CALL_FUNCTION_VAR < Instruction(:argc)
        # TODO
      end

      ##
      # Calls a function. <em>argc</em> is interpreted as in <tt>CALL_FUNCTION</tt>. The top element on the stack contains the keyword arguments dictionary, followed by explicit keyword and positional arguments.
      class CALL_FUNCTION_KW < Instruction(:argc)
        # TODO
      end

      ##
      # Calls a function. <em>argc</em> is interpreted as in <tt>CALL_FUNCTION</tt>. The top element on the stack contains the keyword arguments dictionary, followed by the variable-arguments tuple, followed by explicit keyword and positional arguments.
      class CALL_FUNCTION_VAR_KW < Instruction(:argc)
        # TODO
      end

      ##
      # Prefixes any opcode which has an argument too big to fit into the default two bytes. <em>ext</em> holds two additional bytes which, taken together with the subsequent opcode's argument, comprise a four-byte argument, <em>ext</em> being the two most-significant bytes.
      class EXTENDED_ARG < Instruction(:ext)
        # TODO
      end
    end
  end

end end
