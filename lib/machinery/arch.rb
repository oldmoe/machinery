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

      ##
      # Returns the instruction name.
      def self.instruction_name()
        (@@instructions[self][:name] rescue nil) || name.split('::').last.to_sym
      end

      ##
      # Defines or retrieve the opcode.
      def self.opcode(opcode = nil)
        if opcode
          self.opcode = opcode
          define_method(:initialize) do |*operands|
            @opcode, @operands = opcode, operands
          end
        else
          @@instructions[self][:opcode]
        end
      end

      ##
      # Defines an operand.
      def self.operand(name, index = 0, options = {})
        (self.operands ||= []) << name
        define_method(name)        { operands[index] }
        define_method(:"#{name}=") { |value| operands[index] = value }
      end

      ##
      # Returns the names of the instruction's operands, if any.
      def self.operands
        (@@instructions[self][:operands] rescue nil) || []
      end

      ##
      # Defines an encoder block.
      def self.encode(&block)
        self.encoder = block
      end

      def self.encoder()
        opcode = opcode
        action(:encoder) { emit opcode }
      end

      ##
      # Defines a decoder block.
      def self.decode(&block)
        self.decoder = block
      end

      def self.decoder()
        action(:decoder)
      end

      # (Requires a StackMachine)
      def self.effect(diagram = {})
        before, after = diagram.first
        emulate { stack.shuffle(before, after) } # note implicit stack accessor
      end

      ##
      # Defines an emulator block.
      def self.emulate(&block)
        self.emulator = block
      end

      def self.emulator()
        action(:emulator)
      end

      ##
      # Defines a translator block.
      def self.translate(&block)
        self.translator = block
      end

      def self.translator()
        action(:translator)
      end

      ##
      # Defines cycle timings for this instruction.
      def self.cycles(cycles)
        self.cycles = cycles
        define_method(:cycles) { cycles }
      end

      def self.[](*args) #:nodoc:
        @@operands = args
        self
      end

      def initialize(opcode, *operands)
        @opcode, @operands = opcode, operands
      end

      def operands?()
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

      protected
        @@instructions = {}
        @@operands = []

        def self.inherited(subclass)
          unless @@operands.empty?
            @@operands.each_with_index { |operand, index| subclass.operand(operand, index) }
            @@operands = []
          end
        end

        def self.method_missing(symbol, *args, &block)
          if symbol.to_s =~ /^([^=]+)=$/
            @@instructions[self] ||= {}
            @@instructions[self][$1.to_sym] = args.first
          else
            super
          end
        end

        def self.action(action, error = Emulator::UnsupportedInstruction, &block) #:nodoc:
          name = instruction_name
          @@instructions[self][action] rescue (block_given? ? block : lambda { |*args| raise error.new(name) })
        end

    end

    ##
    # A parameterized machine instruction.
    def self.Instruction(*operands) #:nodoc:
      Instruction[*operands]
    end

    ##
    # A machine instruction set.
    module InstructionSet
      def Instruction(*operands) #:nodoc:
        Instruction[*operands]
      end
    end

    ##
    # A parameterized machine instruction set.
    def self.InstructionSet(klass = Instruction) #:nodoc:
      if klass === Instruction
        InstructionSet
      else
        InstructionSet.clone.module_eval do
          define_method(:Instruction) { |*operands| klass[*operands] }; self
        end
      end
    end

    ##
    # A machine's RAM or ROM.
    class Memory
      # TODO
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
        @elements.push(*args)
      end

      def pop
        @elements.pop
      end

      def shuffle(before, after)
        bindings, values = {}, []

        before.reverse.each do |name|
          values << (bindings[name] = pop)
        end

        after.each do |name|
          if name.is_a?(Proc)
            push name.call(*values.reverse)
          else
            push bindings[name]
          end
        end
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
