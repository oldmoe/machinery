require 'machinery/arch/x86'

module Machinery class Emulator
  ##
  # An emulator for the Intel 8086/8088 microprocessor.
  #
  # @see http://en.wikipedia.org/wiki/Intel_8086
  # @see http://en.wikipedia.org/wiki/Intel_8088
  # @see http://en.wikipedia.org/wiki/X86_instruction_listings#Original_8086.2F8088_instructions
  module X86_8086 include Machinery::Architecture::X86_16
    # @see http://en.wikipedia.org/wiki/Intel_BCD_opcode
    def aaa()
      raise UnsupportedInstruction # TODO
    end

    # @see http://en.wikipedia.org/wiki/Intel_BCD_opcode
    def aad(imm = nil)
      raise UnsupportedInstruction # TODO
    end

    # @see http://en.wikipedia.org/wiki/Intel_BCD_opcode
    def aam(imm = nil)
      raise UnsupportedInstruction # TODO
    end

    # @see http://en.wikipedia.org/wiki/Intel_BCD_opcode
    def aas()
      raise UnsupportedInstruction # TODO
    end

    def adc(*operands)
      raise UnsupportedInstruction # TODO
    end

    def add(*operands)
      raise UnsupportedInstruction # TODO
    end

    def and(*operands)
      raise UnsupportedInstruction # TODO
    end

    def call(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cbw()
      raise UnsupportedInstruction # TODO
    end

    def clc()
      raise UnsupportedInstruction # TODO
    end

    def cld()
      raise UnsupportedInstruction # TODO
    end

    def cli()
      raise UnsupportedInstruction # TODO
    end

    def cmc()
      raise UnsupportedInstruction # TODO
    end

    def cmp(*operands)
      raise UnsupportedInstruction # TODO
    end

    def cmpsb()
      raise UnsupportedInstruction # TODO
    end

    def cmpsw()
      raise UnsupportedInstruction # TODO
    end

    def cwd()
      raise UnsupportedInstruction # TODO
    end

    # @see http://en.wikipedia.org/wiki/Intel_BCD_opcode
    def daa()
      raise UnsupportedInstruction # TODO
    end

    # @see http://en.wikipedia.org/wiki/Intel_BCD_opcode
    def das()
      raise UnsupportedInstruction # TODO
    end

    def dec(*operands)
      raise UnsupportedInstruction # TODO
    end

    def div(*operands)
      raise UnsupportedInstruction # TODO
    end

    def esc(*operands)
      raise UnsupportedInstruction # TODO
    end

    # @see http://en.wikipedia.org/wiki/HLT
    def hlt()
      raise UnsupportedInstruction # TODO
    end

    def idiv(*operands)
      raise UnsupportedInstruction # TODO
    end

    def imul(*operands)
      raise UnsupportedInstruction # TODO
    end

    def in(*operands)
      raise UnsupportedInstruction # TODO
    end

    def inc(*operands)
      raise UnsupportedInstruction # TODO
    end

    # @see http://en.wikipedia.org/wiki/INT_(x86_instruction)
    def int(*operands)
      raise UnsupportedInstruction # TODO
    end

    def into()
      raise UnsupportedInstruction # TODO
    end

    def iret()
      raise UnsupportedInstruction # TODO
    end

    def ja(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jae(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jbe(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jc(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jcxz(*operands)
      raise UnsupportedInstruction # TODO
    end

    def je(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jg(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jge(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jl(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jle(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jna(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jnae(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jnb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jnbe(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jnc(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jne(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jng(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jnge(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jnl(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jnle(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jno(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jnp(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jns(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jnz(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jo(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jp(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jpe(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jpo(*operands)
      raise UnsupportedInstruction # TODO
    end

    def js(*operands)
      raise UnsupportedInstruction # TODO
    end

    def jz(*operands)
      raise UnsupportedInstruction # TODO
    end

    # @see http://en.wikipedia.org/wiki/JMP_(x86_instruction)
    def jmp(*operands)
      raise UnsupportedInstruction # TODO
    end

    def lahf()
      raise UnsupportedInstruction # TODO
    end

    def lds(*operands)
      raise UnsupportedInstruction # TODO
    end

    def lea(*operands)
      raise UnsupportedInstruction # TODO
    end

    def les(*operands)
      raise UnsupportedInstruction # TODO
    end

    def lock(*operands)
      raise UnsupportedInstruction # TODO
    end

    def lodsb()
      raise UnsupportedInstruction # TODO
    end

    def lodsw()
      raise UnsupportedInstruction # TODO
    end

    def loop(*operands)
      raise UnsupportedInstruction # TODO
    end

    def loope(*operands)
      raise UnsupportedInstruction # TODO
    end

    def loopne(*operands)
      raise UnsupportedInstruction # TODO
    end

    def loopnz(*operands)
      raise UnsupportedInstruction # TODO
    end

    def loopz(*operands)
      raise UnsupportedInstruction # TODO
    end

    # @see http://en.wikipedia.org/wiki/MOV_(x86_instruction)
    def mov(*operands)
      raise UnsupportedInstruction # TODO
    end

    def movsb()
      raise UnsupportedInstruction # TODO
    end

    def movsw()
      raise UnsupportedInstruction # TODO
    end

    def mul(*operands)
      raise UnsupportedInstruction # TODO
    end

    def neg(*operands)
      raise UnsupportedInstruction # TODO
    end

    # @see http://en.wikipedia.org/wiki/NOP
    def nop()
      raise UnsupportedInstruction # TODO
    end

    def not(*operands)
      raise UnsupportedInstruction # TODO
    end

    def or(*operands)
      raise UnsupportedInstruction # TODO
    end

    def out(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pop(*operands)
      raise UnsupportedInstruction # TODO
    end

    def popf()
      raise UnsupportedInstruction # TODO
    end

    def push(*operands)
      raise UnsupportedInstruction # TODO
    end

    def pushf()
      raise UnsupportedInstruction # TODO
    end

    def rcl(*operands)
      raise UnsupportedInstruction # TODO
    end

    def rcr(*operands)
      raise UnsupportedInstruction # TODO
    end

    def rep(*operands)
      raise UnsupportedInstruction # TODO
    end

    def repe(*operands)
      raise UnsupportedInstruction # TODO
    end

    def repne(*operands)
      raise UnsupportedInstruction # TODO
    end

    def repnz(*operands)
      raise UnsupportedInstruction # TODO
    end

    def repz(*operands)
      raise UnsupportedInstruction # TODO
    end

    def ret(imm16 = nil)
      retn(imm16)
    end

    def retn(imm16 = nil)
      raise UnsupportedInstruction # TODO
    end

    def retf(imm16 = nil)
      raise UnsupportedInstruction # TODO
    end

    def rol(*operands)
      raise UnsupportedInstruction # TODO
    end

    def ror(*operands)
      raise UnsupportedInstruction # TODO
    end

    def sahf()
      raise UnsupportedInstruction # TODO
    end

    def sal(*operands)
      raise UnsupportedInstruction # TODO
    end

    def sar(*operands)
      raise UnsupportedInstruction # TODO
    end

    def sbb(*operands)
      raise UnsupportedInstruction # TODO
    end

    def scasb()
      raise UnsupportedInstruction # TODO
    end

    def scasw()
      raise UnsupportedInstruction # TODO
    end

    def shl(*operands)
      raise UnsupportedInstruction # TODO
    end

    def shr(*operands)
      raise UnsupportedInstruction # TODO
    end

    def stc()
      raise UnsupportedInstruction # TODO
    end

    def std()
      raise UnsupportedInstruction # TODO
    end

    def sti()
      raise UnsupportedInstruction # TODO
    end

    def stosb()
      raise UnsupportedInstruction # TODO
    end

    def stosw()
      raise UnsupportedInstruction # TODO
    end

    def sub(*operands)
      raise UnsupportedInstruction # TODO
    end

    # @see http://en.wikipedia.org/wiki/TEST_(x86_instruction)
    def test(*operands)
      raise UnsupportedInstruction # TODO
    end

    def wait()
      raise UnsupportedInstruction # TODO
    end

    def xchg(*operands)
      raise UnsupportedInstruction # TODO
    end

    def xlat(*operands)
      raise UnsupportedInstruction # TODO
    end

    def xor(*operands)
      raise UnsupportedInstruction # TODO
    end
  end
end end
