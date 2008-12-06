require 'machine/arch'

module Machinery
  ##
  # An emulator for a machine architecture.
  #
  # @see http://en.wikipedia.org/wiki/Emulator
  class Emulator

    ##
    # An invalid instruction was encountered.
    class InvalidInstruction < NoMethodError; end

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
  end
end
