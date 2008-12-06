module Machinery
  ##
  # Machine components and architectures.
  #
  # @see http://en.wikipedia.org/wiki/Computer_architecture
  module Architecture

    ##
    # A machine instruction.
    #
    # @see http://en.wikipedia.org/wiki/Instruction_(computer_science)
    class Instruction
      attr_accessor :opcode, :operands

      def initialize(opcode, *operands)
        @opcode, @operands = opcode, operands
      end

      def operands?
        !operands.empty?
      end

      def operand_count
        operands.length
      end

      def to_sxp() to_a end

      def to_a
        #[opcode.to_i, *operands.map(&:to_i)]
        [opcode, *operands]
      end

      def to_s
        #to_a.pack('c*')
        (opcode.to_s + ' ' + operands.map(&:to_s).join(', ')).strip
      end

      def each_byte(&block)
        to_s.each_byte(&block)
      end

      def marshal_load(dumped)
        raise NotImplementedError.new
      end

      def marshal_dump()
        write(out = StringIO.new).string
      end

      def write(out)
        out << to_s
      end

      def inspect
        "#<#{self.class}(#{to_s})>"
      end
    end

    ##
    # A machine register.
    #
    # @see http://en.wikipedia.org/wiki/Processor_register
    class Register
      attr_accessor :name, :value

      def initialize(name, value = nil)
        @name, @value = name.to_sym, value
      end

      def to_sxp() name end
      def to_s()   name.to_s end

      def inspect
        "#<#{self.class}(#{to_s})>"
      end
    end

    ##
    # A machine stack.
    #
    # @see http://en.wikipedia.org/wiki/Stack_(data_structure)
    class Stack
      attr_accessor :name, :elements

      def initialize(name, *elements)
        @name, @elements = name.to_sym, elements.flatten
      end

      def push(*args)
        @element.push(*args)
      end

      def pop
        @elements.pop
      end
    end

    ##
    # A stack machine architecture.
    #
    # @see http://en.wikipedia.org/wiki/Stack_machine
    # @see http://www.ece.cmu.edu/~koopman/stack_computers/
    module StackMachine
      @@stack_effects = {}

      def stack(name, options = {})
        stack = Stack.new(name = name.to_sym)
        define_method(name) { stack }
      end

      def defop(opname, stack_effects = {}, &block)
        @@stack_effects ||= {}
        @@stack_effects[opname.to_sym] = stack_effects.first

        if block_given?
          # The given block will need to explicitly emit any additions to
          # the output instruction stream.
          define_method(opname.to_sym, &block)
        else
          # This assumes that the module defines a constant named
          # identically to the opname (but uppercase), with the constant's
          # value being the opcode to emit. This is mostly useful for
          # zero-operand instructions with simple stack effects.
          class_eval("def #{opname}(); emit(#{opname.to_s.upcase}); end")
        end
      end
    end

    ##
    # A register machine architecture.
    #
    # @see http://en.wikipedia.org/wiki/Register_machine
    module RegisterMachine
      def register(name, options = {})
        register = Register.new(name = name.to_sym)
        define_method(name) { register }
      end
    end
  end
end
