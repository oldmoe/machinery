require 'machinery/arch/x86'

module Machinery module Architecture
  ##
  # The Intel 8087 instruction set.
  #
  # @see http://en.wikipedia.org/wiki/Intel_8087
  # @see http://en.wikipedia.org/wiki/X86_instruction_listings#Original_8087_instructions
  # @see http://www.chiplist.com/ISA/8087/
  module X86_8087 include Machinery::Architecture::X86_16
    ##
    # Compute 2x-1.
    class F2XM1 < Instruction
      opcode   0xD9F0
    end

    ##
    # Absolute value.
    class FABS < Instruction
      opcode   0xD9E1
    end

    ##
    # Add.
    class FADD < Instruction; end

    ##
    # Add.
    class FADDP < Instruction; end

    ##
    # Load binary coded decimal (BCD).
    class FBLD < Instruction; end

    ##
    # Store BCD integer and pop.
    class FBSTP < Instruction; end

    ##
    # Change sign.
    class FCHS < Instruction
      opcode   0xD9E0
    end

    ##
    # Clear exceptions.
    class FCLEX < Instruction
      opcode   0x9BDBE2
    end

    ##
    # Compare floating-point values.
    class FCOM < Instruction; end

    ##
    # Compare floating-point values.
    class FCOMP < Instruction; end

    ##
    # Compare floating-point values.
    class FCOMPP < Instruction
      opcode   0xDED9
    end

    ##
    # Decrement stack-top pointer.
    class FDECSTP < Instruction
      opcode   0xD9F6
    end

    ##
    # Disable interrupts.
    class FDISI < Instruction
      opcode   0x9BDBE1
    end

    ##
    # Divide.
    class FDIV < Instruction; end

    ##
    # Divide.
    class FDIVP < Instruction; end

    ##
    # Reverse divide.
    class FDIVR < Instruction; end

    ##
    # Reverse divide.
    class FDIVRP < Instruction; end

    ##
    # Enable interrupts.
    class FENI < Instruction
      opcode   0x9BDBE0
    end

    ##
    # Free floating-point register.
    class FFREE < Instruction; end

    ##
    # Add.
    class FIADD < Instruction; end

    ##
    # Compare integer.
    class FICOM < Instruction; end

    ##
    # Compare integer.
    class FICOMP < Instruction; end

    ##
    # Divide.
    class FIDIV < Instruction; end

    ##
    # Reverse divide.
    class FIDIVR < Instruction; end

    ##
    # Load integer.
    class FILD < Instruction; end

    ##
    # Multiply.
    class FIMUL < Instruction; end

    ##
    # Increment stack-top pointer.
    class FINCSTP < Instruction
      opcode   0xD9F7
    end

    ##
    # Initialize floating-point unit.
    class FINIT < Instruction
      opcode   0x9BDBE3
    end

    ##
    # Store integer.
    class FIST < Instruction; end

    ##
    # Store integer.
    class FISTP < Instruction; end

    ##
    # Subtract.
    class FISUB < Instruction; end

    ##
    # Reverse subtract.
    class FISUBR < Instruction; end

    ##
    # Load floating-point value.
    class FLD < Instruction
      opcode   0xD9E8
    end

    ##
    # Load constant: ...
    class FLD1 < Instruction
      opcode   0xD9E8
    end

    ##
    # Load x87 FPU control word.
    class FLDCW < Instruction; end

    ##
    # Load x87 FPU environment.
    class FLDENV < Instruction; end

    ##
    # Load x87 FPU environment.
    class FLDENVW < Instruction; end

    ##
    # Load constant: ...
    class FLDL2E < Instruction
      opcode   0xD9EA
    end

    ##
    # Load constant: ...
    class FLDL2T < Instruction
      opcode   0xD9E9
    end

    ##
    # Load constant: ...
    class FLDLG2 < Instruction
      opcode   0xD9EC
    end

    ##
    # Load constant: ...
    class FLDLN2 < Instruction
      opcode   0xD9ED
    end

    ##
    # Load constant: ...
    class FLDPI < Instruction
      opcode   0xD9EB
    end

    ##
    # Load constant: ...
    class FLDZ < Instruction
      opcode   0xD9EE
    end

    ##
    # Multiply.
    class FMUL < Instruction; end

    ##
    # Multiply.
    class FMULP < Instruction; end

    ##
    # Clear exceptions.
    class FNCLEX < Instruction
      opcode   0xDBE2
    end

    ##
    # Disable interrupts (no wait).
    class FNDISI < Instruction
      opcode   0xDBE1
    end

    ##
    # Enable interrupts (no wait).
    class FNENI < Instruction
      opcode   0xDBE0
    end

    ##
    # Initialize floating-point unit.
    class FNINIT < Instruction
      opcode   0xDBE3
    end

    ##
    # No operation.
    class FNOP < Instruction
      opcode   0xD9D0
    end

    ##
    # Store x87 FPU state (no wait).
    class FNSAVE < Instruction; end

    ##
    # Store x87 FPU state (no wait).
    class FNSAVEW < Instruction; end

    ##
    # Store x87 FPU control word.
    class FNSTCW < Instruction; end

    ##
    # Store x87 FPU environment (no wait).
    class FNSTENV < Instruction; end

    ##
    # Store x87 FPU environment (no wait).
    class FNSTENVW < Instruction; end

    ##
    # Store x87 FPU status word.
    class FNSTSW < Instruction; end

    ##
    # Partial arctangent.
    class FPATAN < Instruction
      opcode   0xD9F3
    end

    ##
    # Partial remainder.
    class FPREM < Instruction
      opcode   0xD9F8
    end

    ##
    # Partial tangent.
    class FPTAN < Instruction
      opcode   0xD9F2
    end

    ##
    # Round to integer.
    class FRNDINT < Instruction
      opcode   0xD9FC
    end

    ##
    # Restore x87 FPU state.
    class FRSTOR < Instruction; end

    ##
    # Restore x87 FPU state.
    class FRSTORW < Instruction; end

    ##
    # Store x87 FPU state.
    class FSAVE < Instruction; end

    ##
    # Store x87 FPU state.
    class FSAVEW < Instruction; end

    ##
    # Scale.
    class FSCALE < Instruction
      opcode   0xD9FD
    end

    ##
    # Square root.
    class FSQRT < Instruction
      opcode   0xD9FA
    end

    ##
    # Store floating-point value.
    class FST < Instruction; end

    ##
    # Store x87 FPU control word.
    class FSTCW < Instruction; end

    ##
    # Store x87 FPU environment.
    class FSTENV < Instruction; end

    ##
    # Store x87 FPU environment.
    class FSTENVW < Instruction; end

    ##
    # Store floating-point value.
    class FSTP < Instruction; end

    ##
    # Store x87 FPU status word.
    class FSTSW < Instruction; end

    ##
    # Subtract.
    class FSUB < Instruction; end

    ##
    # Subtract.
    class FSUBP < Instruction; end

    ##
    # Reverse subtract.
    class FSUBR < Instruction; end

    ##
    # Reverse subtract.
    class FSUBRP < Instruction; end

    ##
    # Test.
    class FTST < Instruction
      opcode   0xD9E4
    end

    ##
    # Wait.
    class FWAIT < Instruction; end

    ##
    # ExamineModR/M.
    class FXAM < Instruction
      opcode   0xD9E5
    end

    ##
    # Exchange register contents.
    class FXCH < Instruction
      opcode   0xD9C9
    end

    ##
    # Extract exponent and significand.
    class FXTRACT < Instruction
      opcode   0xD9F4
    end

    ##
    # Compute y * log2X.
    class FYL2X < Instruction
      opcode   0xD9F1
    end

    ##
    # Compute y * log2(X+1).
    class FYL2XP1 < Instruction
      opcode   0xD9F9
    end
  end
end end
