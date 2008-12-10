require 'machinery/arch'

module Machinery module Architecture

  ##
  # The MOS 6502 architecture.
  #
  # @see http://en.wikipedia.org/wiki/MOS_Technology_6502
  # @see http://en.wikipedia.org/wiki/MOS_Technology_65xx
  module MOS6502 extend RegisterMachine
    counter  :pc, :bits => 16, :title => 'program counter'
    flags    :p,  :bits => 8,  :title => 'status register'
    register :a,  :bits => 8,  :title => 'accumulator'
    register :x,  :bits => 8,  :title => 'index register X'
    register :y,  :bits => 8,  :title => 'index register Y'
    register :s,  :bits => 8,  :title => 'stack pointer'

    ##
    # @see http://web.archive.org/web/20080202033411/http://www.xmission.com/~trevin/atari/6502_insn_set.html
    # @see http://web.archive.org/web/20080202033422/http://www.xmission.com/~trevin/atari/6502_opcodes.html
    # @see http://web.archive.org/web/20080202033416/http://www.xmission.com/~trevin/atari/6502_opcode_table.html
    module Opcodes
      #      imp   imm   zpg   zpx   zpy   zpi   inx   iny   abs   abx   aby   ind   idx
      ADC = [0x00, 0x69, 0x65, 0x75, 0x00, 0x72, 0x61, 0x71, 0x6D, 0x7D, 0x79, 0x00, 0x00]
      AND = [0x00, 0x29, 0x25, 0x35, 0x00, 0x32, 0x21, 0x31, 0x2D, 0x3D, 0x39, 0x00, 0x00]
      ASL = [0x0A, 0x00, 0x06, 0x16, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x1E, 0x00, 0x00, 0x00]
      BCC = [0x00, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      BCS = [0x00, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      BEQ = [0x00, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      BIT = [0x00, 0x89, 0x24, 0x34, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x3c, 0x00, 0x00, 0x00]
      BMI = [0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      BNE = [0x00, 0xD0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      BPL = [0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      BRK = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      BVC = [0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      BVS = [0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      CLC = [0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      CLD = [0xD8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      CLI = [0x58, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      CLV = [0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      CMP = [0x00, 0xC9, 0xC5, 0xD5, 0x00, 0xD2, 0xC1, 0xD1, 0xCD, 0xDD, 0xD9, 0x00, 0x00]
      CPX = [0x00, 0xE0, 0xE4, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEC, 0x00, 0x00, 0x00, 0x00]
      CPY = [0x00, 0xC0, 0xC4, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCC, 0x00, 0x00, 0x00, 0x00]
      DEC = [0x00, 0x00, 0xC6, 0xD6, 0x00, 0x00, 0x00, 0x00, 0xCE, 0xDE, 0x00, 0x00, 0x00]
      DEX = [0xCA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      DEY = [0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      EOR = [0x00, 0x49, 0x45, 0x55, 0x00, 0x52, 0x41, 0x51, 0x4D, 0x5D, 0x59, 0x00, 0x00]
      INC = [0x00, 0x00, 0xE6, 0xF6, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xFE, 0x00, 0x00, 0x00]
      INX = [0xE8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      INY = [0xC8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      JMP = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4C, 0x00, 0x00, 0x6C, 0x7C]
      JSR = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00]
      LDA = [0x00, 0xA9, 0xA5, 0xB5, 0x00, 0xB2, 0xA1, 0xB1, 0xAD, 0xBD, 0xB9, 0x00, 0x00]
      LDX = [0x00, 0xA2, 0xA6, 0x00, 0xB6, 0x00, 0x00, 0x00, 0xAE, 0x00, 0xBE, 0x00, 0x00]
      LDY = [0x00, 0xA0, 0xA4, 0xB4, 0x00, 0x00, 0x00, 0x00, 0xAC, 0xBC, 0x00, 0x00, 0x00]
      LSR = [0x4A, 0x00, 0x46, 0x56, 0x00, 0x00, 0x00, 0x00, 0x4E, 0x5E, 0x00, 0x00, 0x00]
      NOP = [0xEA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      ORA = [0x00, 0x09, 0x05, 0x15, 0x00, 0x12, 0x01, 0x11, 0x0D, 0x1D, 0x19, 0x00, 0x00]
      PHA = [0x48, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      PHP = [0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      PLA = [0x68, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      PLP = [0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      ROL = [0x2A, 0x00, 0x26, 0x36, 0x00, 0x00, 0x00, 0x00, 0x2E, 0x3E, 0x00, 0x00, 0x00]
      ROR = [0x6A, 0x00, 0x66, 0x76, 0x00, 0x00, 0x00, 0x00, 0x6E, 0x7E, 0x00, 0x00, 0x00]
      RTI = [0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      RTS = [0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      SBC = [0x00, 0xE9, 0xE5, 0xF5, 0x00, 0xF2, 0xE1, 0xF1, 0xED, 0xFD, 0xF9, 0x00, 0x00] # !
      SEC = [0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      SED = [0xF8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      SEI = [0x78, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      STA = [0x00, 0x00, 0x85, 0x95, 0x00, 0x92, 0x81, 0x91, 0x8D, 0x9D, 0x99, 0x00, 0x00]
      STX = [0x00, 0x00, 0x86, 0x00, 0x96, 0x00, 0x00, 0x00, 0x8E, 0x00, 0x00, 0x00, 0x00]
      STY = [0x00, 0x00, 0x84, 0x94, 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x00]
      TAX = [0xAA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      TAY = [0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      TSX = [0xBA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      TXA = [0x8A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      TXS = [0x9A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      TYA = [0x98, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
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
        # TODO
      end

      ##
      # +AND+ memory with the accumulator.
      class AND < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Shift memory or the accumulator one bit left.
      class ASL < Instruction
        affect   :n, :z, :c
        # TODO
      end

      ##
      # Branch on carry clear (+P[c] = 0+).
      class BCC < Instruction
        # TODO
      end

      ##
      # Branch on carry set (+P[c] = 1+).
      class BCS < Instruction
        # TODO
      end

      ##
      # Branch if equal (+P[z] = 1+).
      class BEQ < Instruction
        # TODO
      end

      ##
      # Test bits in memory against the accumulator.
      class BIT < Instruction
        affect   :n, :v, :z # FIXME?
        # TODO
      end

      ##
      # Branch if result minus (+P[n] = 1+).
      class BMI < Instruction
        # TODO
      end

      ##
      # Branch if not equal (+P[z] = 0+).
      class BNE < Instruction
        # TODO
      end

      ##
      # Branch if result plus (+P[n] = 0+).
      class BPL < Instruction
        # TODO
      end

      ##
      # Force a break.
      class BRK < Instruction
        affect   :b, :i # FIXME?
        # TODO
      end

      ##
      # Branch on overflow clear (+P[v] = 0+).
      class BVC < Instruction
        # TODO
      end

      ##
      # Branch on overflow set (+P[v] = 1+).
      class BVS < Instruction
        # TODO
      end

      ##
      # Clear carry flag.
      class CLC < Instruction
        affect   :c => false
        # TODO
      end

      ##
      # Clear decimal mode.
      class CLD < Instruction
        affect   :d => false
        # TODO
      end

      ##
      # Clear interrupt disable bit.
      class CLI < Instruction
        affect   :i => false
        # TODO
      end

      ##
      # Clear overflow flag.
      class CLV < Instruction
        affect   :v => false
        # TODO
      end

      ##
      # Compare memory and the accumulator.
      class CMP < Instruction
        affect   :n, :z, :c
        # TODO
      end

      ##
      # Compare memory and the X register.
      class CPX < Instruction
        affect   :n, :z, :c
        # TODO
      end

      ##
      # Compare memory and the Y register.
      class CPY < Instruction
        affect   :n, :z, :c
        # TODO
      end

      ##
      # Decrement memory by one.
      class DEC < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Decrement the X register by one.
      class DEX < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Decrement the Y register by one.
      class DEY < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # +XOR+ memory with the accumulator.
      class EOR < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Increment memory by one.
      class INC < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Increment the X register by one.
      class INX < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Increment the Y register by one.
      class INY < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Jump to new location.
      class JMP < Instruction
        # TODO
      end

      ##
      # Jump to subroutine.
      class JSR < Instruction
        # TODO
      end

      ##
      # Load the accumulator from memory.
      class LDA < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Load the X register from memory.
      class LDX < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Load the Y register from memory.
      class LDY < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Shift memory or the accumulator one bit right.
      class LSR < Instruction
        affect   :n, :z, :c
        # TODO
      end

      ##
      # No operation.
      class NOP < Instruction
        # TODO
      end

      ##
      # +OR+ memory with the accumulator.
      class ORA < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Push the accumulator onto the stack.
      class PHA < Instruction
        # TODO
      end

      ##
      # Push the processor status onto the stack.
      class PHP < Instruction
        # TODO
      end

      ##
      # Pull the accumulator from the stack.
      class PLA < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Pull the processor status from the stack.
      class PLP < Instruction
        affect   true # restored
        # TODO
      end

      ##
      # Rotate memory or the accumulator one bit left.
      class ROL < Instruction
        affect   :n, :z, :c
        # TODO
      end

      ##
      # Rotate memory or the accumulator one bit right.
      class ROR < Instruction
        affect   :n, :z, :c
        # TODO
      end

      ##
      # Return from interrupt.
      class RTI < Instruction
        affect   true # restored
        # TODO
      end

      ##
      # Return from subroutine.
      class RTS < Instruction
        # TODO
      end

      ##
      # Subtract memory from accumulator with carry.
      class SBC < Instruction
        affect   :n, :z, :c, :v # FIXME?
        # TODO
      end

      ##
      # Set carry flag.
      class SEC < Instruction
        affect   :c => true
        # TODO
      end

      ##
      # Set decimal mode.
      class SED < Instruction
        affect   :d => true
        # TODO
      end

      ##
      # Set interrupt disable status.
      class SEI < Instruction
        affect   :i => true
        # TODO
      end

      ##
      # Store the accumulator in memory.
      class STA < Instruction
        # TODO
      end

      ##
      # Store the X register in memory.
      class STX < Instruction
        # TODO
      end

      ##
      # Store the Y register in memory.
      class STY < Instruction
        # TODO
      end

      ##
      # Transfer the accumulator to the X register.
      class TAX < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Transfer the accumulator to the Y register.
      class TAY < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Transfer the stack pointer to the X register.
      class TSX < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Transfer the X register to the accumulator.
      class TXA < Instruction
        affect   :n, :z
        # TODO
      end

      ##
      # Transfer the X register to the stack pointer.
      class TXS < Instruction
        affect   :n, :z # FIXME?
        # TODO
      end

      ##
      # Transfer the Y register to the accumulator.
      class TYA < Instruction
        affect   :n, :z
        # TODO
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
    # @see http://web.archive.org/web/20060617063756/http://axis.llx.com/~nparker/a2/opcodes.html
    module Opcodes
      BRA = [0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      DEA = [0x3A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      INA = [0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      PHX = [0xDA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      PHY = [0x5A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      PLX = [0xFA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      PLY = [0x7A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
      STZ = [0x00, 0x00, 0x64, 0x74, 0x00, 0x00, 0x00, 0x00, 0x9C, 0x9E, 0x00, 0x00, 0x00]
      TRB = [0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00]
      TSB = [0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00]
    end

    ##
    # The MOS 65C02 instruction set.
    module Instructions
      ##
      # Branch always.
      class BRA < Instruction
        # TODO
      end

      ##
      # Decrement the accumulator by one.
      class DEA < Instruction
        # TODO
      end

      ##
      # Increment the accumulator by one.
      class INA < Instruction
        # TODO
      end

      ##
      # Push the X register onto the stack.
      class PHX < Instruction
        # TODO
      end

      ##
      # Push the Y register onto the stack.
      class PHY < Instruction
        # TODO
      end

      ##
      # Pull the X register from the stack.
      class PLX < Instruction
        # TODO
      end

      ##
      # Pull the Y register from the stack.
      class PLY < Instruction
        # TODO
      end

      ##
      # Store a zero in memory.
      class STZ < Instruction
        # TODO
      end

      ##
      # Test and reset memory bit.
      class TRB < Instruction
        # TODO
      end

      ##
      # Test and set memory bit.
      class TSB < Instruction
        # TODO
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
    # @see http://web.archive.org/web/20060617063756/http://axis.llx.com/~nparker/a2/opcodes.html
    module Opcodes
      BBR = [] # TODO
      BBS = [] # TODO
      RMB = [] # TODO
      SMB = [] # TODO
      STP = [] # TODO
      WAI = [] # TODO
    end

    ##
    # The WDC 65C02 instruction set.
    module Instructions
      ##
      # Branch if bit reset.
      class BBR < Instruction
        # TODO
      end

      ##
      # Branch if bit set.
      class BBS < Instruction
        # TODO
      end

      ##
      # Reset memory bit.
      class RMB < Instruction
        # TODO
      end

      ##
      # Set memory bit.
      class SMB < Instruction
        # TODO
      end

      ##
      # Stop mode.
      class STP < Instruction
        # TODO
      end

      ##
      # Wait for interrupt.
      class WAI < Instruction
        # TODO
      end
    end
  end

end end
