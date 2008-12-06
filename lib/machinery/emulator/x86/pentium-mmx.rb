require 'machinery/emulator/x86/pentium'

module Machinery class Emulator
  ##
  # An emulator for the Intel Pentium MMX (i586) microprocessor.
  #
  # @see http://en.wikipedia.org/wiki/Pentium
  # @see http://en.wikipedia.org/wiki/MMX_(instruction_set)
  # @see http://en.wikipedia.org/wiki/X86_instruction_listings#Added_with_Pentium_MMX
  # @see http://en.wikipedia.org/wiki/X86_instruction_listings#MMX_instructions
  module X86_PentiumMMX include X86_Pentium
    def emms(*operands)
      raise UnsupportedInstruction # TODO
    end

    def movd(*operands)
      raise UnsupportedInstruction # TODO
    end

    def movq(*operands)
      raise UnsupportedInstruction # TODO
    end

    def packssdw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def packsswb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def packuswb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def paddb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def paddd(*operands)
      raise UnsupportedInstruction # TODO
    end

    def paddsb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def paddsw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def paddusb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def paddusw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def paddw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pand(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pandn(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pcmpeqb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pcmpeqd(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pcmpeqw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pcmpgtb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pcmpgtd(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pcmpgtw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pmaddwd(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pmulhw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pmullw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def por(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pslld(*operands)
      raise UnsupportedInstruction # TODO
    end

    def psllq(*operands)
      raise UnsupportedInstruction # TODO
    end

    def psllw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def psrad(*operands)
      raise UnsupportedInstruction # TODO
    end

    def psraw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def psrld(*operands)
      raise UnsupportedInstruction # TODO
    end

    def psrlq(*operands)
      raise UnsupportedInstruction # TODO
    end

    def psrlw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def psubb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def psubd(*operands)
      raise UnsupportedInstruction # TODO
    end

    def psubsb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def psubsw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def psubusb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def psubusw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def psubw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def punpckhbw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def punpckhdq(*operands)
      raise UnsupportedInstruction # TODO
    end

    def punpckhwd(*operands)
      raise UnsupportedInstruction # TODO
    end

    def punpcklbw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def punpckldq(*operands)
      raise UnsupportedInstruction # TODO
    end

    def punpcklwd(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pxor(*operands)
      raise UnsupportedInstruction # TODO
    end

    def rdpmc(*operands)
      raise UnsupportedInstruction # TODO
    end
  end
end end
