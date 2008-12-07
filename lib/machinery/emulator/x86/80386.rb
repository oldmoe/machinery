require 'machinery/emulator/x86/80286'

module Machinery class Emulator
  ##
  # An emulator for the Intel 80386 (i386) microprocessor.
  #
  # @see http://en.wikipedia.org/wiki/Intel_80386
  # @see http://en.wikipedia.org/wiki/X86_instruction_listings#Added_with_80386
  module X86_80386 include X86_80286 and include Machinery::Architecture::X86_32
    def bsf(*operands)
      raise UnsupportedInstruction # TODO
    end

    def bsr(*operands)
      raise UnsupportedInstruction # TODO
    end

    def bt(*operands)
      raise UnsupportedInstruction # TODO
    end

    def btc(*operands)
      raise UnsupportedInstruction # TODO
    end

    def btr(*operands)
      raise UnsupportedInstruction # TODO
    end

    def bts(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cdq()
      raise UnsupportedInstruction # TODO
    end

    def cmpsd()
      raise UnsupportedInstruction # TODO
    end

    def cwde()
      raise UnsupportedInstruction # TODO
    end

    def insb()
      raise UnsupportedInstruction # TODO
    end

    def insw()
      raise UnsupportedInstruction # TODO
    end

    def insd()
      raise UnsupportedInstruction # TODO
    end

    def iretd()
      raise UnsupportedInstruction # TODO
    end

    def iretf(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jcxz(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jecxz(*operands)
      raise UnsupportedInstruction # TODO
    end

    def lfs(*operands)
      raise UnsupportedInstruction # TODO
    end

    def lgs(*operands)
      raise UnsupportedInstruction # TODO
    end

    def lss(*operands)
      raise UnsupportedInstruction # TODO
    end

    def lodsd()
      raise UnsupportedInstruction # TODO
    end

    def loopw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def loopd(*operands)
      raise UnsupportedInstruction # TODO
    end

    def loopew(*operands)
      raise UnsupportedInstruction # TODO
    end

    def looped(*operands)
      raise UnsupportedInstruction # TODO
    end

    def loopzw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def loopzd(*operands)
      raise UnsupportedInstruction # TODO
    end

    def loopnew(*operands)
      raise UnsupportedInstruction # TODO
    end

    def loopned(*operands)
      raise UnsupportedInstruction # TODO
    end

    def loopnzw(*operands)
      raise UnsupportedInstruction # TODO
    end

    def loopnzd(*operands)
      raise UnsupportedInstruction # TODO
    end

    def movsd()
      raise UnsupportedInstruction # TODO
    end

    def movsx(*operands)
      raise UnsupportedInstruction # TODO
    end

    def movzx(*operands)
      raise UnsupportedInstruction # TODO
    end

    def popad()
      raise UnsupportedInstruction # TODO
    end

    def popfd()
      raise UnsupportedInstruction # TODO
    end

    def pushad()
      raise UnsupportedInstruction # TODO
    end

    def pushfd()
      raise UnsupportedInstruction # TODO
    end

    def scasd()
      raise UnsupportedInstruction # TODO
    end

    def seta(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setae(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setbe(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setc(*operands)
      raise UnsupportedInstruction # TODO
    end

    def sete(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setg(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setge(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setl(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setle(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setna(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setnae(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setnb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setnbe(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setnc(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setne(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setng(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setnge(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setnl(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setnle(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setno(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setnp(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setns(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setnz(*operands)
      raise UnsupportedInstruction # TODO
    end

    def seto(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setp(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setpe(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setpo(*operands)
      raise UnsupportedInstruction # TODO
    end

    def sets(*operands)
      raise UnsupportedInstruction # TODO
    end

    def setz(*operands)
      raise UnsupportedInstruction # TODO
    end

    def shld(*operands)
      raise UnsupportedInstruction # TODO
    end

    def shrd(*operands)
      raise UnsupportedInstruction # TODO
    end

    def stosd()
      raise UnsupportedInstruction # TODO
    end
  end
end end
