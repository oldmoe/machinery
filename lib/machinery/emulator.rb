require 'machinery/arch'

module Machinery
  ##
  # An emulator for a machine architecture.
  #
  # @see http://en.wikipedia.org/wiki/Emulator
  class Emulator
    include Architecture

    alias_method :__eval__,  :instance_eval
    alias_method :__class__, :class
    undef_method *(instance_methods - %w(__id__ __send__ __class__ __eval__ instance_eval inspect))

    def initialize(options = {}, &block) # :yield: self
      @options = options
      __eval__(&block) if block_given?
    end

    ##
    # An unsupported architecture was specified.
    class UnsupportedArchitecture < NotImplementedError; end

    ##
    # An unsupported instruction was encountered.
    class UnsupportedInstruction < NotImplementedError
      def initialize(instruction = nil)
        if !instruction && (caller(3)[0] =~ /\A(.*?):(\d+):in `([^']+)'/ rescue nil)
          instruction = $3.to_sym
        end
        super instruction.to_s
      end
    end

    ##
    # An invalid instruction was encountered.
    class InvalidInstruction < NoMethodError; end

    protected

      def self.architecture(arch)
        include arch
      end

      def self.instructions(isets = {})
        isets = {isets => :emulate} unless isets.is_a?(Hash)
        isets.each do |iset, action|
          include iset
          iset.constants.each do |const|
            if (insn = iset.const_get(const)).respond_to?(:instruction_name)
              define_instruction(insn.instruction_name, insn, action)
            end
          end
        end
      end

      def self.define_instruction(name, insn = nil, action = :emulate)
        insn = const_get(name.to_s.upcase) unless insn
        define_method(name.to_s.downcase) do |*operands|
          insn.new(*operands).__send__(action, self)
        end
      end

      def load_instruction_set!(arch, model)
        begin
          require "machinery/emulator/#{arch}/#{model}"
        rescue LoadError
          raise UnsupportedArchitecture.new("unknown or unsupported #{arch} model '#{model}'")
        end
      end
  end
end
