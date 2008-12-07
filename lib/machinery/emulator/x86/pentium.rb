require 'machinery/emulator/x86/80486'

module Machinery class Emulator
  ##
  # An emulator for the Intel Pentium (i586) microprocessor.
  #
  # @see http://en.wikipedia.org/wiki/Pentium
  # @see http://en.wikipedia.org/wiki/X86_instruction_listings#Added_with_Pentium
  module X86_Pentium include X86_80486
    def cmpxchg8b(*operands)
      raise UnsupportedInstruction # TODO
    end

    def rdmsr()
      raise UnsupportedInstruction # TODO
    end

    def rdtsc()
      raise UnsupportedInstruction # TODO
    end

    def wrmsr()
      raise UnsupportedInstruction # TODO
    end
  end
end end
