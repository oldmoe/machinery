require 'machinery/emulator/x86/80186'

module Machinery class Emulator
  ##
  # An emulator for the Intel 80286 microprocessor.
  #
  # @see http://en.wikipedia.org/wiki/Intel_80286
  # @see http://en.wikipedia.org/wiki/X86_instruction_listings#Added_with_80286
  module X86_80286 include X86_80186
    def arpl(*operands)
      raise UnsupportedInstruction # TODO
    end

    def clts(*operands)
      raise UnsupportedInstruction # TODO
    end

    def lar(*operands)
      raise UnsupportedInstruction # TODO
    end

    def lgdt(*operands)
      raise UnsupportedInstruction # TODO
    end

    def lidt(*operands)
      raise UnsupportedInstruction # TODO
    end

    def lldt(*operands)
      raise UnsupportedInstruction # TODO
    end

    def lmsw(*operands)
      raise UnsupportedInstruction # TODO
    end

    # @see http://en.wikipedia.org/wiki/LOADALL
    def loadall(*operands)
      raise UnsupportedInstruction # TODO
    end

    def lsl(*operands)
      raise UnsupportedInstruction # TODO
    end

    # @see http://en.wikipedia.org/wiki/Load_Task_Register
    def ltr(*operands)
      raise UnsupportedInstruction # TODO
    end

    def sgdt(*operands)
      raise UnsupportedInstruction # TODO
    end

    def sidt(*operands)
      raise UnsupportedInstruction # TODO
    end

    def sldt(*operands)
      raise UnsupportedInstruction # TODO
    end

    def smsw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def str(*operands)
      raise UnsupportedInstruction # TODO
    end

    def verr(*operands)
      raise UnsupportedInstruction # TODO
    end

    def verw(*operands)
      raise UnsupportedInstruction # TODO
    end
  end
end end
