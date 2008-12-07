require 'machinery/emulator/x86/80386'

module Machinery class Emulator
  ##
  # An emulator for the Intel 80486 (i486) microprocessor.
  #
  # @see http://en.wikipedia.org/wiki/Intel_80486
  # @see http://en.wikipedia.org/wiki/X86_instruction_listings#Added_with_80486
  module X86_80486 include X86_80386
    def bswap(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmpxchg(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cpuid()
      raise UnsupportedInstruction # TODO
    end

    def invd()
      raise UnsupportedInstruction # TODO
    end

    def invlpg(*operands)
      raise UnsupportedInstruction # TODO
    end

    def wbinvd()
      raise UnsupportedInstruction # TODO
    end

    def xadd(*operands)
      raise UnsupportedInstruction # TODO
    end
  end
end end
