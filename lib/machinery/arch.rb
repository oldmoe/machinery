module Machinery
  module Architecture

    ##
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

      def to_a  
        [opcode.to_i, *operands.map(&:to_i)]     
      end

      def to_s               
        to_a.pack('c*')
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
    end

    ##
    module StackMachine
      @@stack_effects = {}

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
    module RegisterMachine end
  end
end
