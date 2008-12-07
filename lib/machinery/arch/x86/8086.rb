require 'machinery/arch/x86'

module Machinery module Architecture
  ##
  # The Intel 8086/8088 instruction set.
  #
  # @see http://en.wikipedia.org/wiki/Intel_8086
  # @see http://en.wikipedia.org/wiki/Intel_8088
  # @see http://en.wikipedia.org/wiki/X86_instruction_listings#Original_8086.2F8088_instructions
  module X86_8086 include Machinery::Architecture::X86_16

    ##
    # ASCII adjust after addition.
    #
    # @see http://en.wikipedia.org/wiki/Intel_BCD_opcode
    class AAA < Instruction
      opcode  0x37
    end

    ##
    # ASCII adjust AX before division.
    #
    # @see http://en.wikipedia.org/wiki/Intel_BCD_opcode
    class AAD < Instruction
      opcode  0xD50A
    end

    ##
    # ASCII adjust AX after multiply.
    #
    # @see http://en.wikipedia.org/wiki/Intel_BCD_opcode
    class AAM < Instruction
      opcode  0xD40A
    end

    ##
    # ASCII adjust AL after subtraction.
    #
    # @see http://en.wikipedia.org/wiki/Intel_BCD_opcode
    class AAS < Instruction
      opcode  0x3F
    end

    ##
    # Add with carry.
    class ADC < Instruction; end

    ##
    # Add.
    class ADD < Instruction; end

    ##
    # Logical AND.
    class AND < Instruction; end

    ##
    # Call procedure.
    class CALL < Instruction; end

    ##
    # Convert byte to word.
    class CBW < Instruction
      opcode  0x98 # o16
    end

    ##
    # Clear carry flag (CF).
    class CLC < Instruction
      opcode  0xF8
    end

    ##
    # Clear direction flag (DF).
    class CLD < Instruction
      opcode  0xFC
    end

    ##
    # Clear interrupt flag (IF).
    class CLI < Instruction
      opcode  0xFA
    end

    ##
    # Complement carry flag (CF).
    class CMC < Instruction
      opcode  0xF5
    end

    ##
    # Compare two operands.
    class CMP < Instruction; end

    ##
    # Compare string operands.
    class CMPSB < Instruction
      opcode  0xA6
    end

    ##
    # Compare string operands.
    class CMPSW < Instruction
      opcode  0xA7 # o16
    end

    ##
    # Convert word to double-word.
    class CWD < Instruction
      opcode  0x99 # o16
    end

    ##
    # Decimal adjust AL after addition.
    #
    # @see http://en.wikipedia.org/wiki/Intel_BCD_opcode
    class DAA < Instruction
      opcode  0x27
    end

    ##
    # Decimal adjust AL after subtraction.
    #
    # @see http://en.wikipedia.org/wiki/Intel_BCD_opcode
    class DAS < Instruction
      opcode  0x2F
    end

    ##
    # Decrement by 1.
    class DEC < Instruction; end

    ##
    # Unsigned divide.
    class DIV < Instruction; end

    ##
    # ...
    class ESC < Instruction; end

    ##
    # Halt.
    #
    # @see http://en.wikipedia.org/wiki/HLT
    class HLT < Instruction
      opcode  0xF4
    end

    ##
    # Signed divide.
    class IDIV < Instruction; end

    ##
    # Signed multiply.
    class IMUL < Instruction; end

    ##
    # Input from port.
    class IN < Instruction; end

    ##
    # Increment by 1.
    class INC < Instruction; end

    ##
    # Call to interrupt procedure.
    #
    # @see http://en.wikipedia.org/wiki/INT_(x86_instruction)
    class INT < Instruction; end

    ##
    # Call to interrupt procedure.
    class INTO < Instruction
      opcode  0xCE
    end

    ##
    # Interrupt return.
    class IRET < Instruction
      opcode  0xCF
    end

    ##
    # Jump short if above (CF=0 and ZF=0).
    class JA < Instruction; end

    ##
    # Jump short if above or equal (CF=0).
    class JAE < Instruction; end

    ##
    # Jump short if below (CF=1).
    class JB < Instruction; end

    ##
    # Jump short if below or equal (CF=1 or ZF=1).
    class JBE < Instruction; end

    ##
    # Jump short if carry (CF=1).
    class JC < Instruction; end

    ##
    # Jump short if CX register is 0.
    class JCXZ < Instruction; end

    ##
    # Jump short if equal (ZF=1).
    class JE < Instruction; end

    ##
    # Jump short if greater (ZF=0 and SF=OF).
    class JG < Instruction; end

    ##
    # Jump short if greater or equal (SF=OF).
    class JGE < Instruction; end

    ##
    # Jump short if less (SF!=OF).
    class JL < Instruction; end

    ##
    # Jump short if less or equal (ZF=1 or SF!=OF).
    class JLE < Instruction; end

    ##
    # Jump.
    #
    # @see http://en.wikipedia.org/wiki/JMP_(x86_instruction)
    class JMP < Instruction; end

    ##
    # Jump short if not above (CF=1 or ZF=1).
    class JNA < Instruction; end

    ##
    # Jump short if not above or equal (CF=1).
    class JNAE < Instruction; end

    ##
    # Jump short if not below (CF=0).
    class JNB < Instruction; end

    ##
    # Jump short if not below or equal (CF=0 and ZF=0).
    class JNBE < Instruction; end

    ##
    # Jump short if not carry (CF=0).
    class JNC < Instruction; end

    ##
    # Jump short if not equal (ZF=0).
    class JNE < Instruction; end

    ##
    # Jump short if not greater (ZF=1 or SF!=OF).
    class JNG < Instruction; end

    ##
    # Jump short if not greater or equal (SF!=OF).
    class JNGE < Instruction; end

    ##
    # Jump short if not less (SF=OF).
    class JNL < Instruction; end

    ##
    # Jump short if not less or equal (ZF=0 and SF=OF).
    class JNLE < Instruction; end

    ##
    # Jump short if not overflow (OF=0).
    class JNO < Instruction; end

    ##
    # Jump short if not parity (PF=0).
    class JNP < Instruction; end

    ##
    # Jump short if not sign (SF=0).
    class JNS < Instruction; end

    ##
    # Jump short if not zero (ZF=0).
    class JNZ < Instruction; end

    ##
    # Jump short if overflow (OF=1).
    class JO < Instruction; end

    ##
    # Jump short if parity (PF=1).
    class JP < Instruction; end

    ##
    # Jump short if parity even (PF=1).
    class JPE < Instruction; end

    ##
    # Jump short if parity odd (PF=0).
    class JPO < Instruction; end

    ##
    # Jump short if sign (SF=1).
    class JS < Instruction; end

    ##
    # Jump short if zero (ZF=1).
    class JZ < Instruction; end

    ##
    # Load status flags into AH register.
    class LAHF < Instruction
      opcode  0x9F
    end

    ##
    # Load DS:r16 with far pointer from memory.
    class LDS < Instruction; end

    ##
    # Load effective address.
    class LEA < Instruction; end

    ##
    # Load ES:r16 with far pointer from memory.
    class LES < Instruction; end

    ##
    # Assert LOCK# signal prefix.
    class LOCK < Instruction; end

    ##
    # Load byte at address DS:(E)SI into AL.
    class LODSB < Instruction
      opcode  0xAC
    end

    ##
    # Load word at address DS:(E)SI into AX.
    class LODSW < Instruction
      opcode  0xAD # o16
    end

    ##
    # Loop according to ECX counter: decrement and jump short if count != 0.
    class LOOP < Instruction; end

    ##
    # Loop according to ECX counter: decrement and jump short if count != 0 and ZF = 1.
    class LOOPE < Instruction; end

    ##
    # Loop according to ECX counter: decrement and jump short if count != 0 and ZF = 0.
    class LOOPNE < Instruction; end

    ##
    # ...
    class LOOPNZ < Instruction; end

    ##
    # ...
    class LOOPZ < Instruction; end

    ##
    # Move.
    #
    # @see http://en.wikipedia.org/wiki/MOV_(x86_instruction)
    class MOV < Instruction; end

    ##
    # Move byte from address DS:(E)SI to ES:(E)DI.
    class MOVSB < Instruction
      opcode  0xA4
    end

    ##
    # Move word from address DS:(E)SI to ES:(E)DI.
    class MOVSW < Instruction
      opcode  0xA5 # o16
    end

    ##
    # Unsigned multiply.
    class MUL < Instruction; end

    ##
    # Two's complement negation.
    class NEG < Instruction; end

    ##
    # One byte no-operation instruction.
    #
    # @see http://en.wikipedia.org/wiki/NOP
    class NOP < Instruction
      opcode  0x90
    end

    ##
    # One's complement negation.
    class NOT < Instruction; end

    ##
    # Logical inclusive OR.
    class OR < Instruction; end

    ##
    # Output to port.
    class OUT < Instruction; end

    ##
    # Pop a value from the stack.
    class POP < Instruction; end

    ##
    # Pop top of stack into lower 16 bits of EFLAGS.
    class POPF < Instruction; end

    ##
    # Push word onto the stack.
    class PUSH < Instruction; end

    ##
    # Push lower 16 bits of EFLAGS onto the stack.
    class PUSHF < Instruction; end

    ##
    # Rotate left.
    class RCL < Instruction; end

    ##
    # Rotate right.
    class RCR < Instruction; end

    ##
    # Repeat string operation prefix.
    class REP < Instruction; end

    ##
    # Repeat string operation prefix.
    class REPE < Instruction; end

    ##
    # Repeat string operation prefix.
    class REPNE < Instruction; end

    ##
    # Repeat string operation prefix.
    class REPNZ < Instruction; end

    ##
    # Repeat string operation prefix.
    class REPZ < Instruction; end

    ##
    # Return from procedure.
    class RET < Instruction
      opcode  0xC3
    end

    ##
    # Far return to calling procedure.
    class RETF < Instruction
      opcode  0xCB
    end

    ##
    # Near return to calling procedure.
    class RETN < RET; end

    ##
    # Rotate left.
    class ROL < Instruction; end

    ##
    # Rotate right.
    class ROR < Instruction; end

    ##
    # Loads SF, ZF, AF, PF, and CF from AH into EFLAGS register.
    class SAHF < Instruction
      opcode  0x9E
    end

    ##
    # Shift left.
    class SAL < Instruction; end

    ##
    # Shift right.
    class SAR < Instruction; end

    ##
    # Integer subtraction with borrow.
    class SBB < Instruction; end

    ##
    # Scan string: compare AL with byte at ES:(E)DI or RDI then set status flags.
    class SCASB < Instruction
      opcode  0xAE
    end

    ##
    # Scan string: compare AX with word at ES:(E)DI or RDI then set status flags.
    class SCASW < Instruction
      opcode  0xAF # o16
    end

    ##
    # Shift left.
    class SHL < Instruction; end

    ##
    # Shift right.
    class SHR < Instruction; end

    ##
    # Set carry flag (CF).
    class STC < Instruction
      opcode  0xF9
    end

    ##
    # Set direction flag (DF).
    class STD < Instruction
      opcode  0xFD
    end

    ##
    # Set the interrupt flag (IF).
    class STI < Instruction
      opcode  0xFB
    end

    ##
    # Store string: store AL at address ES:(E)DI.
    class STOSB < Instruction
      opcode  0xAA
    end

    ##
    # Store string: store AX at address ES:(E)DI.
    class STOSW < Instruction
      opcode  0xAB # o16
    end

    ##
    # Subtract.
    class SUB < Instruction; end

    ##
    # Logical compare.
    #
    # @see http://en.wikipedia.org/wiki/TEST_(x86_instruction)
    class TEST < Instruction; end

    ##
    # Check pending unmasked floating-point exceptions.
    class WAIT < Instruction
      opcode  0x9B
    end

    ##
    # Exchange register/memory with register.
    class XCHG < Instruction; end

    ##
    # Table look-up translation: set AL to memory byte DS:[(E)BX + unsigned AL].
    class XLATB < Instruction
      opcode  0xD7
    end

    ##
    # Logical exclusive OR.
    class XOR < Instruction; end

  end
end end
