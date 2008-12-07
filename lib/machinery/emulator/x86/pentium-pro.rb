require 'machinery/emulator/x86/pentium'

module Machinery class Emulator
  ##
  # An emulator for the Intel Pentium Pro (i686) microprocessor.
  #
  # @see http://en.wikipedia.org/wiki/Pentium_Pro
  # @see http://en.wikipedia.org/wiki/X86_instruction_listings#Added_with_Pentium_Pro
  module X86_PentiumPro include X86_Pentium
    def cmova(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovae(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovbe(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovc(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmove(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovg(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovge(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovl(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovle(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovna(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovnae(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovnb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovnbe(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovnc(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovne(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovng(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovnge(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovnl(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovnle(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovno(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovnp(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovns(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovnz(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovo(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovp(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovpe(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovpo(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovs(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmovz(*operands)
      raise UnsupportedInstruction # TODO
    end

    def sysenter(*operands)
      raise UnsupportedInstruction # TODO
    end

    def sysexit(*operands)
      raise UnsupportedInstruction # TODO
    end

    def rdpmc()
      raise UnsupportedInstruction # TODO
    end

    def ud2(*operands)
      raise UnsupportedInstruction # TODO
    end
  end
end end
