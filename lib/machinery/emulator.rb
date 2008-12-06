require 'machinery/arch'

module Machinery
  ##
  # An emulator for a machine architecture.
  #
  # @see http://en.wikipedia.org/wiki/Emulator
  class Emulator

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

      def load_instruction_set!(arch, model)
        begin
          require "machinery/emulator/#{arch}/#{model}"
        rescue LoadError
          raise UnsupportedArchitecture.new("unknown or unsupported #{arch} model '#{model}'")
        end
      end
  end
end
