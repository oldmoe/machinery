require 'machinery/arch'

module Machinery module Architecture

  ##
  # The MOS 6502 architecture.
  #
  # @see http://en.wikipedia.org/wiki/MOS_Technology_6502
  # @see http://en.wikipedia.org/wiki/MOS_Technology_65xx
  # @see http://www.6502.org/
  module MOS6502 extend RegisterMachine
    counter  :pc, :bits => 16, :title => 'program counter'
    flags    :p,  :bits => 8,  :title => 'status register', :flags => :"nv-bdizc"
    register :a,  :bits => 8,  :title => 'accumulator'
    register :x,  :bits => 8,  :title => 'X register'
    register :y,  :bits => 8,  :title => 'Y register'
    register :s,  :bits => 8,  :title => 'stack pointer'

    ##
    # The MOS 6502 instruction addressing modes.
    #
    # @see http://www.65xx.com/wdc/documentation/w65c02s.pdf
    module Addressing
      ABSOLUTE_A              =  1 # a      = Absolute
      ABSOLUTE_INDEX_INDIRECT =  2 # (a,x)  = Absolute, indexed indirect
      ABSOLUTE_INDEX_X        =  3 # a,x    = Absolute, X-indexed
      ABSOLUTE_INDEX_Y        =  4 # a,y    = Absolute, X-indexed
      ABSOLUTE_INDIRECT       =  5 # (a)    = Absolute, indirect
      ACCUMULATOR             =  6 # A      = Accumulator
      IMMEDIATE               =  7 # #      = Immediate
      IMPLIED                 =  8 # i      = Implied
      RELATIVE                =  9 # r      = Program counter relative
      STACK                   = 10 # s      = Stack
      ZEROPAGE                = 11 # zp     = Zero page
      ZEROPAGE_INDEX_INDIRECT = 12 # (zp,x) = Zero page, indexed indirect
      ZEROPAGE_INDEX_X        = 13 # zp,x   = Zero page, X-indexed
      ZEROPAGE_INDEX_Y        = 14 # zp,y   = Zero page, Y-indexed
      ZEROPAGE_INDIRECT       = 15 # (zp)   = Zero page, indirect
      ZEROPAGE_INDIRECT_Y     = 16 # (zp),y = Zero page, indirect Y-indexed
    end

    ##
    # The MOS 6502 opcode table.
    #
    # @see http://www.65xx.com/wdc/documentation/w65c02s.pdf
    # @see http://web.archive.org/web/20080202033411/http://www.xmission.com/~trevin/atari/6502_insn_set.html
    # @see http://web.archive.org/web/20080202033422/http://www.xmission.com/~trevin/atari/6502_opcodes.html
    # @see http://web.archive.org/web/20080202033416/http://www.xmission.com/~trevin/atari/6502_opcode_table.html
    module Opcodes
      #         a  (a,x)  a,x   a,y    (a)    A     #     i     r     s    zp (zp,x) zp,x  zp,y   (zp)  (zp),y
      #         1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16
      ADC = [0x6D,   -1, 0x7D, 0x79,   -1,   -1, 0x69,   -1,   -1,   -1, 0x65, 0x61, 0x75,   -1, 0x72, 0x71]
      AND = [0x2D,   -1, 0x3D, 0x39,   -1,   -1, 0x29,   -1,   -1,   -1, 0x25, 0x21, 0x35,   -1, 0x32, 0x31]
      ASL = [0x0E,   -1, 0x1E,   -1,   -1, 0x0A,   -1,   -1,   -1,   -1, 0x06,   -1, 0x16,   -1,   -1,   -1]
      BCC = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x90,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      BCS = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xB0,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      BEQ = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xF0,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      BIT = [0x2C,   -1, 0x3C,   -1,   -1,   -1, 0x89,   -1,   -1,   -1, 0x24,   -1, 0x34,   -1,   -1,   -1]
      BMI = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x30,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      BNE = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xD0,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      BPL = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x10,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      BRK = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x00,   -1,   -1,   -1,   -1,   -1,   -1]
      BVC = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x50,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      BVS = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x70,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      CLC = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x18,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      CLD = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xD8,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      CLI = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x58,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      CLV = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xB8,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      CMP = [0xCD,   -1, 0xDD, 0xD9,   -1,   -1, 0xC9,   -1,   -1,   -1, 0xC5, 0xC1, 0xD5,   -1, 0xD2, 0xD1]
      CPX = [0xEC,   -1,   -1,   -1,   -1,   -1, 0xE0,   -1,   -1,   -1, 0xE4,   -1,   -1,   -1,   -1,   -1]
      CPY = [0xCC,   -1,   -1,   -1,   -1,   -1, 0xC0,   -1,   -1,   -1, 0xC4,   -1,   -1,   -1,   -1,   -1]
      DEC = [0xCE,   -1, 0xDE,   -1,   -1, 0x3A,   -1,   -1,   -1,   -1, 0xC6,   -1, 0xD6,   -1,   -1,   -1]
      DEX = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xCA,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      DEY = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x88,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      EOR = [0x4D,   -1, 0x5D, 0x59,   -1,   -1, 0x49,   -1,   -1,   -1, 0x45, 0x41, 0x55,   -1, 0x52, 0x51]
      INC = [0xEE,   -1, 0xFE,   -1,   -1, 0x1A,   -1,   -1,   -1,   -1, 0xE6,   -1, 0xF6,   -1,   -1,   -1]
      INX = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xE8,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      INY = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xC8,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      JMP = [0x4C,   -1,   -1,   -1, 0x6C,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      JSR = [0x20,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      LDA = [0xAD,   -1, 0xBD, 0xB9,   -1,   -1, 0xA9,   -1,   -1,   -1, 0xA5, 0xA1, 0xB5,   -1, 0xB2, 0xB1]
      LDX = [0xAE,   -1,   -1, 0xBE,   -1,   -1, 0xA2,   -1,   -1,   -1, 0xA6,   -1,   -1, 0xB6,   -1,   -1]
      LDY = [0xAC,   -1, 0xBC,   -1,   -1,   -1, 0xA0,   -1,   -1,   -1, 0xA4,   -1, 0xB4,   -1,   -1,   -1]
      LSR = [0x4E,   -1, 0x5E,   -1,   -1, 0x4A,   -1,   -1,   -1,   -1, 0x46,   -1, 0x56,   -1,   -1,   -1]
      NOP = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xEA,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      ORA = [0x0D,   -1, 0x1D, 0x19,   -1,   -1, 0x09,   -1,   -1,   -1, 0x05, 0x01, 0x15,   -1, 0x12, 0x11]
      PHA = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x48,   -1,   -1,   -1,   -1,   -1,   -1]
      PHP = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x08,   -1,   -1,   -1,   -1,   -1,   -1]
      PLA = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x68,   -1,   -1,   -1,   -1,   -1,   -1]
      PLP = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x28,   -1,   -1,   -1,   -1,   -1,   -1]
      ROL = [0x2E,   -1, 0x3E,   -1,   -1, 0x2A,   -1,   -1,   -1,   -1, 0x26,   -1, 0x36,   -1,   -1,   -1]
      ROR = [0x6E,   -1, 0x7E,   -1,   -1, 0x6A,   -1,   -1,   -1,   -1, 0x66,   -1, 0x76,   -1,   -1,   -1]
      RTI = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x40,   -1,   -1,   -1,   -1,   -1,   -1]
      RTS = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x60,   -1,   -1,   -1,   -1,   -1,   -1]
      SBC = [0xED,   -1, 0xFD, 0xF9,   -1,   -1, 0xE9,   -1,   -1,   -1, 0xE5, 0xE1, 0xF5,   -1, 0xF2, 0xF1]
      SEC = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x38,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      SED = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xF8,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      SEI = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x78,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      STA = [0x8D,   -1, 0x9D, 0x99,   -1,   -1,   -1,   -1,   -1,   -1, 0x85, 0x81, 0x95,   -1, 0x92, 0x91]
      STX = [0x8E,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x86,   -1,   -1, 0x96,   -1,   -1]
      STY = [0x8C,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x84,   -1, 0x94,   -1,   -1,   -1]
      TAX = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xAA,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      TAY = [  -1,   -1, 0xBC,   -1,   -1,   -1,   -1, 0xAB,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      TSX = [  -1,   -1, 0x1D,   -1,   -1,   -1,   -1, 0xBA,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      TXA = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x8A,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      TXS = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x9A,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      TYA = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x98,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
    end

    class Instruction < Architecture::Instruction
      ##
      # Defines processor status flags affected by the instruction.
      def self.affect(*args)
        # TODO
      end
    end

    ##
    # The 6502 instruction set.
    #
    # @see http://www.geocities.com/oneelkruns/6502sum.html
    # @see http://web.archive.org/web/20080202033411/http://www.xmission.com/~trevin/atari/6502_insn_set.html
    module Instructions extend Architecture::InstructionSet(Instruction)
      ##
      # Add memory to accumulator with carry.
      class ADC < Instruction
        affect   :n, :z, :c, :v
        simulate do end # TODO
      end

      ##
      # +AND+ memory with the accumulator.
      class AND < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Shift memory or the accumulator one bit left.
      class ASL < Instruction
        affect   :n, :z, :c
        simulate do end # TODO
      end

      ##
      # Branch on carry clear (+P[c] = 0+).
      class BCC < Instruction
        simulate do end # TODO
      end

      ##
      # Branch on carry set (+P[c] = 1+).
      class BCS < Instruction
        simulate do end # TODO
      end

      ##
      # Branch if equal (+P[z] = 1+).
      class BEQ < Instruction
        simulate do end # TODO
      end

      ##
      # Test bits in memory against the accumulator.
      class BIT < Instruction
        affect   :n, :v, :z # FIXME?
        simulate do end # TODO
      end

      ##
      # Branch if result minus (+P[n] = 1+).
      class BMI < Instruction
        simulate do end # TODO
      end

      ##
      # Branch if not equal (+P[z] = 0+).
      class BNE < Instruction
        simulate do end # TODO
      end

      ##
      # Branch if result plus (+P[n] = 0+).
      class BPL < Instruction
        simulate do end # TODO
      end

      ##
      # Force a break.
      class BRK < Instruction
        affect   :b, :i # FIXME?
        simulate do end # TODO
      end

      ##
      # Branch on overflow clear (+P[v] = 0+).
      class BVC < Instruction
        simulate do end # TODO
      end

      ##
      # Branch on overflow set (+P[v] = 1+).
      class BVS < Instruction
        simulate do end # TODO
      end

      ##
      # Clear carry flag.
      class CLC < Instruction
        affect   :c => false
        simulate do end # TODO
      end

      ##
      # Clear decimal mode.
      class CLD < Instruction
        affect   :d => false
        simulate do end # TODO
      end

      ##
      # Clear interrupt disable bit.
      class CLI < Instruction
        affect   :i => false
        simulate do end # TODO
      end

      ##
      # Clear overflow flag.
      class CLV < Instruction
        affect   :v => false
        simulate do end # TODO
      end

      ##
      # Compare memory and the accumulator.
      class CMP < Instruction
        affect   :n, :z, :c
        simulate do end # TODO
      end

      ##
      # Compare memory and the X register.
      class CPX < Instruction
        affect   :n, :z, :c
        simulate do end # TODO
      end

      ##
      # Compare memory and the Y register.
      class CPY < Instruction
        affect   :n, :z, :c
        simulate do end # TODO
      end

      ##
      # Decrement memory by one.
      class DEC < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Decrement the X register by one.
      class DEX < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Decrement the Y register by one.
      class DEY < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # +XOR+ memory with the accumulator.
      class EOR < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Increment memory by one.
      class INC < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Increment the X register by one.
      class INX < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Increment the Y register by one.
      class INY < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Jump to new location.
      class JMP < Instruction
        simulate do end # TODO
      end

      ##
      # Jump to subroutine.
      class JSR < Instruction
        simulate do end # TODO
      end

      ##
      # Load the accumulator from memory.
      class LDA < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Load the X register from memory.
      class LDX < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Load the Y register from memory.
      class LDY < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Shift memory or the accumulator one bit right.
      class LSR < Instruction
        affect   :n, :z, :c
        simulate do end # TODO
      end

      ##
      # No operation.
      class NOP < Instruction
        simulate do end # TODO
      end

      ##
      # +OR+ memory with the accumulator.
      class ORA < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Push the accumulator onto the stack.
      class PHA < Instruction
        simulate do end # TODO
      end

      ##
      # Push the processor status onto the stack.
      class PHP < Instruction
        simulate do end # TODO
      end

      ##
      # Pull the accumulator from the stack.
      class PLA < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Pull the processor status from the stack.
      class PLP < Instruction
        affect   true # restored
        simulate do end # TODO
      end

      ##
      # Rotate memory or the accumulator one bit left.
      class ROL < Instruction
        affect   :n, :z, :c
        simulate do end # TODO
      end

      ##
      # Rotate memory or the accumulator one bit right.
      class ROR < Instruction
        affect   :n, :z, :c
        simulate do end # TODO
      end

      ##
      # Return from interrupt.
      class RTI < Instruction
        affect   true # restored
        simulate do end # TODO
      end

      ##
      # Return from subroutine.
      class RTS < Instruction
        simulate do end # TODO
      end

      ##
      # Subtract memory from accumulator with carry.
      class SBC < Instruction
        affect   :n, :z, :c, :v # FIXME?
        simulate do end # TODO
      end

      ##
      # Set carry flag.
      class SEC < Instruction
        affect   :c => true
        simulate do end # TODO
      end

      ##
      # Set decimal mode.
      class SED < Instruction
        affect   :d => true
        simulate do end # TODO
      end

      ##
      # Set interrupt disable status.
      class SEI < Instruction
        affect   :i => true
        simulate do end # TODO
      end

      ##
      # Store the accumulator in memory.
      class STA < Instruction
        simulate do end # TODO
      end

      ##
      # Store the X register in memory.
      class STX < Instruction
        simulate do end # TODO
      end

      ##
      # Store the Y register in memory.
      class STY < Instruction
        simulate do end # TODO
      end

      ##
      # Transfer the accumulator to the X register.
      class TAX < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Transfer the accumulator to the Y register.
      class TAY < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Transfer the stack pointer to the X register.
      class TSX < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Transfer the X register to the accumulator.
      class TXA < Instruction
        affect   :n, :z
        simulate do end # TODO
      end

      ##
      # Transfer the X register to the stack pointer.
      class TXS < Instruction
        affect   :n, :z # FIXME?
        simulate do end # TODO
      end

      ##
      # Transfer the Y register to the accumulator.
      class TYA < Instruction
        affect   :n, :z
        simulate do end # TODO
      end
    end
  end

  ##
  # The MOS 65C02 architecture (an extension of the MOS 6502).
  #
  # @see http://en.wikipedia.org/wiki/WDC_65C02
  # @see http://en.wikipedia.org/wiki/MOS_Technology_65xx
  module MOS65C02 extend RegisterMachine and include MOS6502
    ##
    # The MOS 65C02 opcode table.
    #
    # @see http://www.65xx.com/wdc/documentation/w65c02s.pdf
    # @see http://web.archive.org/web/20060617063756/http://axis.llx.com/~nparker/a2/opcodes.html
    module Opcodes
      #         a  (a,x)  a,x   a,y    (a)    A     #     i     r     s    zp (zp,x) zp,x  zp,y   (zp)  (zp),y
      #         1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16
      BRA = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x80,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      DEA = [  -1,   -1,   -1,   -1,   -1, 0x3A,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      INA = [  -1,   -1,   -1,   -1,   -1, 0x1A,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      PHX = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xDA,   -1,   -1,   -1,   -1,   -1,   -1]
      PHY = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x5A,   -1,   -1,   -1,   -1,   -1,   -1]
      PLX = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xFA,   -1,   -1,   -1,   -1,   -1,   -1]
      PLY = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x7A,   -1,   -1,   -1,   -1,   -1,   -1]
      STZ = [0x9C,   -1, 0x9E,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x68,   -1, 0x74,   -1,   -1,   -1]
      TRB = [0x1C,   -1, 0x5E,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x14,   -1,   -1,   -1,   -1,   -1]
      TSB = [0x0C,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 0x04,   -1,   -1,   -1,   -1,   -1]
    end

    ##
    # The MOS 65C02 instruction set.
    module Instructions
      ##
      # Branch always.
      class BRA < Instruction
        simulate do end # TODO
      end

      ##
      # Decrement the accumulator by one.
      class DEA < Instruction
        simulate do end # TODO
      end

      ##
      # Increment the accumulator by one.
      class INA < Instruction
        simulate do end # TODO
      end

      ##
      # Push the X register onto the stack.
      class PHX < Instruction
        simulate do end # TODO
      end

      ##
      # Push the Y register onto the stack.
      class PHY < Instruction
        simulate do end # TODO
      end

      ##
      # Pull the X register from the stack.
      class PLX < Instruction
        simulate do end # TODO
      end

      ##
      # Pull the Y register from the stack.
      class PLY < Instruction
        simulate do end # TODO
      end

      ##
      # Store a zero in memory.
      class STZ < Instruction
        simulate do end # TODO
      end

      ##
      # Test and reset memory bit.
      class TRB < Instruction
        simulate do end # TODO
      end

      ##
      # Test and set memory bit.
      class TSB < Instruction
        simulate do end # TODO
      end
    end
  end

  ##
  # The WDC 65C02 architecture (an extension of the MOS 65C02).
  #
  # @see http://en.wikipedia.org/wiki/WDC_65C02
  # @see http://en.wikipedia.org/wiki/MOS_Technology_65xx
  module WDC65C02 extend RegisterMachine and include MOS65C02
    ##
    # The WDC 65C02 opcode table.
    #
    # @see http://www.65xx.com/wdc/documentation/w65c02s.pdf
    # @see http://web.archive.org/web/20060617063756/http://axis.llx.com/~nparker/a2/opcodes.html
    module Opcodes
      #         a  (a,x)  a,x   a,y    (a)    A     #     i     r     s    zp (zp,x) zp,x  zp,y   (zp)  (zp),y
      #         1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16
      BBR = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1] # TODO
      BBS = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1] # TODO
      RMB = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1] # TODO
      SMB = [  -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1] # TODO
      STP = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xDB,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
      WAI = [  -1,   -1,   -1,   -1,   -1,   -1,   -1, 0xCB,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1]
    end

    ##
    # The WDC 65C02 instruction set.
    module Instructions
      ##
      # Branch if bit reset.
      class BBR < Instruction
        simulate do end # TODO
      end

      ##
      # Branch if bit set.
      class BBS < Instruction
        simulate do end # TODO
      end

      ##
      # Reset memory bit.
      class RMB < Instruction
        simulate do end # TODO
      end

      ##
      # Set memory bit.
      class SMB < Instruction
        simulate do end # TODO
      end

      ##
      # Stop mode.
      class STP < Instruction
        simulate do end # TODO
      end

      ##
      # Wait for interrupt.
      class WAI < Instruction
        simulate do end # TODO
      end
    end
  end

end end
