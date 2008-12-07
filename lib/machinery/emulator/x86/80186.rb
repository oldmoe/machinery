require 'machinery/emulator/x86/8086'

module Machinery class Emulator
  ##
  # An emulator for the Intel 80186/80188 microprocessor.
  #
  # @see http://en.wikipedia.org/wiki/Intel_80186
  # @see http://en.wikipedia.org/wiki/Intel_80188
  # @see http://en.wikipedia.org/wiki/X86_instruction_listings#Added_with_80186.2F80188
  module X86_80186 include X86_8086
    def bound(*operands)
      raise UnsupportedInstruction # TODO
    end

    def enter(*operands)
      raise UnsupportedInstruction # TODO
    end

    def ins(*operands)
      raise UnsupportedInstruction # TODO
    end

    def leave()
      raise UnsupportedInstruction # TODO
    end

    def outs()
      raise UnsupportedInstruction # TODO
    end

    def popa()
      raise UnsupportedInstruction # TODO
    end

    def pusha()
      raise UnsupportedInstruction # TODO
    end
  end
end end
