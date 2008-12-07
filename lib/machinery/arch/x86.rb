require 'machinery/arch'

module Machinery::Architecture

  ##
  # The x86-16 (8086, 80186, 80286) architecture.
  #
  # @see http://en.wikipedia.org/wiki/X86_architecture
  module X86_16 extend RegisterMachine
    # Instruction pointer and flags (16-bit)
    register :ip,     :bits => 16, :type => :ip,  :title => 'instruction pointer'
    register :flags,  :bits => 16, :type => :flg, :title => 'flags'

    # Segment registers
    register :cs,     :bits => 16, :type => :seg, :title => 'code segment'
    register :ds,     :bits => 16, :type => :seg, :title => 'data segment'
    register :ss,     :bits => 16, :type => :seg, :title => 'stack segment'
    register :es,     :bits => 16, :type => :seg, :title => 'extra segment'

    # General-purpose registers (16-bit)
    register :ax,     :bits => 16, :type => :reg, :title => 'accumulator'
    register :ah,     :bits => 8,  :type => :reg
    register :al,     :bits => 8,  :type => :reg
    register :bx,     :bits => 16, :type => :reg, :title => 'base'
    register :bh,     :bits => 8,  :type => :reg
    register :bl,     :bits => 8,  :type => :reg
    register :cx,     :bits => 16, :type => :reg, :title => 'counter'
    register :ch,     :bits => 8,  :type => :reg
    register :cl,     :bits => 8,  :type => :reg
    register :dx,     :bits => 16, :type => :reg, :title => 'data/general'
    register :dh,     :bits => 8,  :type => :reg
    register :dl,     :bits => 8,  :type => :reg
    register :si,     :bits => 16, :type => :reg, :title => 'source index'
    register :di,     :bits => 16, :type => :reg, :title => 'destination index'
    register :bp,     :bits => 16, :type => :reg, :title => 'stack base pointer'
    register :sp,     :bits => 16, :type => :reg, :title => 'stack top pointer'
  end

  ##
  # The x86-32 (IA-32) architecture.
  #
  # @see http://en.wikipedia.org/wiki/IA-32
  module X86_32 extend RegisterMachine and include X86_16
    # Instruction pointer and flags (32-bit)
    register :eip,    :bits => 32, :type => :ip,  :title => 'instruction pointer'
    register :eflags, :bits => 32, :type => :flg, :title => 'flags'

    # Segment registers (x86-32 supplements)
    register :fs,     :bits => 16, :type => :seg
    register :gs,     :bits => 16, :type => :seg

    # General-purpose registers (32-bit)
    register :eax,    :bits => 32, :type => :reg, :title => 'accumulator'
    register :ebx,    :bits => 32, :type => :reg, :title => 'base'
    register :ecx,    :bits => 32, :type => :reg, :title => 'counter'
    register :edx,    :bits => 32, :type => :reg, :title => 'data/general'
    register :esi,    :bits => 32, :type => :reg, :title => 'source index'
    register :edi,    :bits => 32, :type => :reg, :title => 'destination index'
    register :ebp,    :bits => 32, :type => :reg, :title => 'stack base pointer'
    register :esp,    :bits => 32, :type => :reg, :title => 'stack top pointer'
  end

  ##
  # The x86-64 (AMD64, aka Intel 64, IA-32e, EMT64T) architecture.
  #
  # @see http://en.wikipedia.org/wiki/X86-64
  module X86_64 extend RegisterMachine and include X86_32
    # Instruction pointer and flags (64-bit)
    register :rip,    :bits => 64, :type => :ip,  :title => 'instruction pointer'
    register :rflags, :bits => 64, :type => :flg, :title => 'status flags'

    # General-purpose registers (64-bit)
    register :rax,    :bits => 64, :type => :reg, :title => 'accumulator'
    register :rbx,    :bits => 64, :type => :reg, :title => 'base'
    register :rcx,    :bits => 64, :type => :reg, :title => 'counter'
    register :rdx,    :bits => 64, :type => :reg, :title => 'data/general'
    register :rsi,    :bits => 64, :type => :reg, :title => 'source index'
    register :rdi,    :bits => 64, :type => :reg, :title => 'destination index'
    register :rbp,    :bits => 64, :type => :reg, :title => 'stack base pointer'
    register :rsp,    :bits => 64, :type => :reg, :title => 'stack top pointer'

    # General-purpose registers (64-bit x86-64 supplements)
    register :r8,     :bits => 64, :type => :reg
    register :r9,     :bits => 64, :type => :reg
    register :r10,    :bits => 64, :type => :reg
    register :r11,    :bits => 64, :type => :reg
    register :r12,    :bits => 64, :type => :reg
    register :r13,    :bits => 64, :type => :reg
    register :r14,    :bits => 64, :type => :reg
    register :r15,    :bits => 64, :type => :reg
  end

  ##
  # The x86 architecture.
  #
  # @see http://en.wikipedia.org/wiki/Category:X86_architecture
  # @see http://en.wikipedia.org/wiki/X86_architecture
  # @see http://developer.intel.com/products/processor/manuals/
  module X86 extend RegisterMachine and include X86_64
    ##
    # x86 instruction set opcodes.
    module Opcodes
      AAA                  = 0x37     # [8086]
      AAS                  = 0x3F     # [8086]
      AAD                  = 0xD50A   # [8086]
      AAM                  = 0xD40A   # [8086]
      CBW                  = 0x98     # [8086,o16]
      CWD                  = 0x99     # [8086,o16]
      CLC                  = 0xF8     # [8086]
      CLD                  = 0xFC     # [8086]
      CLI                  = 0xFA     # [8086]
      CMC                  = 0xF5     # [8086]
      CMPSB                = 0xA6     # [8086]
      CMPSW                = 0xA7     # [8086,o16]
      DAA                  = 0x27     # [8086]
      DAS                  = 0x2F     # [8086]
      F2XM1                = 0xD9F0   # [8086,FPU]
      FABS                 = 0xD9E1   # [8086,FPU]
      FCHS                 = 0xD9E0   # [8086,FPU]
      FCLEX                = 0x9BDBE2 # [8086,FPU]
      FNCLEX               = 0xDBE2   # [8086,FPU]
      FCOMPP               = 0xDED9   # [8086,FPU]
      FDECSTP              = 0xD9F6   # [8086,FPU]
      FDISI                = 0x9BDBE1 # [8086,FPU]
      FNDISI               = 0xDBE1   # [8086,FPU]
      FENI                 = 0x9BDBE0 # [8086,FPU]
      FNENI                = 0xDBE0   # [8086,FPU]
      FINCSTP              = 0xD9F7   # [8086,FPU]
      FINIT                = 0x9BDBE3 # [8086,FPU]
      FNINIT               = 0xDBE3   # [8086,FPU]
      FLD1                 = 0xD9E8   # [8086,FPU]
      FLDL2E               = 0xD9EA   # [8086,FPU]
      FLDL2T               = 0xD9E9   # [8086,FPU]
      FLDLG2               = 0xD9EC   # [8086,FPU]
      FLDLN2               = 0xD9ED   # [8086,FPU]
      FLDPI                = 0xD9EB   # [8086,FPU]
      FLDZ                 = 0xD9EE   # [8086,FPU]
      FNOP                 = 0xD9D0   # [8086,FPU]
      FPATAN               = 0xD9F3   # [8086,FPU]
      FPTAN                = 0xD9F2   # [8086,FPU]
      FPREM                = 0xD9F8   # [8086,FPU]
      FRNDINT              = 0xD9FC   # [8086,FPU]
      FSCALE               = 0xD9FD   # [8086,FPU]
      FSQRT                = 0xD9FA   # [8086,FPU]
      FTST                 = 0xD9E4   # [8086,FPU]
      FXAM                 = 0xD9E5   # [8086,FPU]
      FXCH                 = 0xD9C9   # [8086,FPU]
      FXTRACT              = 0xD9F4   # [8086,FPU]
      FYL2X                = 0xD9F1   # [8086,FPU]
      FYL2XP1              = 0xD9F9   # [8086,FPU]
      HLT                  = 0xF4     # [8086]
      INT3                 = 0xCC     # [8086]
      INTO                 = 0xCE     # [8086]
      IRET                 = 0xCF     # [8086]
      IRETW                = 0xCF     # [8086,o16]
      LAHF                 = 0x9F     # [8086]
      LODSB                = 0xAC     # [8086]
      LODSW                = 0xAD     # [8086,o16]
      MOVSB                = 0xA4     # [8086]
      MOVSW                = 0xA5     # [8086,o16]
      NOP                  = 0x90     # [8086]
      RET                  = 0xC3     # [8086]
      RETF                 = 0xCB     # [8086]
      RETN                 = 0xC3     # [8086]
      SAHF                 = 0x9E     # [8086]
      SALC                 = 0xD6     # [8086]
      SCASB                = 0xAE     # [8086]
      SCASW                = 0xAF     # [8086,o16]
      STC                  = 0xF9     # [8086]
      STD                  = 0xFD     # [8086]
      STI                  = 0xFB     # [8086]
      STOSB                = 0xAA     # [8086]
      STOSW                = 0xAB     # [8086,o16]
      WAIT                 = 0x9B     # [8086]
      XLATB                = 0xD7     # [8086]
    end
  end

end
