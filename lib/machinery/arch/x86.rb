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
      AAA                  = 0x37     # [x86]
      AAS                  = 0x3F     # [x86]
      AAD                  = 0xD50A   # [x86]
      AAM                  = 0xD40A   # [x86]
      CBW                  = 0x98     # [x86,o16]
      CWD                  = 0x99     # [x86,o16]
      CDQ                  = 0x99     # [386]
      CWDE                 = 0x98     # [386]
      CLC                  = 0xF8     # [x86]
      CLD                  = 0xFC     # [x86]
      CLI                  = 0xFA     # [x86]
      CLTS                 = 0x0F06   # [286]
      CMC                  = 0xF5     # [x86]
      CMPSB                = 0xA6     # [x86]
      CMPSW                = 0xA7     # [x86,o16]
      CMPSD                = 0xA7     # [386,o32]
      DAA                  = 0x27     # [x86]
      DAS                  = 0x2F     # [x86]
      F2XM1                = 0xD9F0   # [x86,FPU]
      FABS                 = 0xD9E1   # [x86,FPU]
      FCHS                 = 0xD9E0   # [x86,FPU]
      FCLEX                = 0x9BDBE2 # [x86,FPU]
      FNCLEX               = 0xDBE2   # [x86,FPU]
      FCOMPP               = 0xDED9   # [x86,FPU]
      FCOS                 = 0xD9FF   # [386,FPU]
      FDECSTP              = 0xD9F6   # [x86,FPU]
      FDISI                = 0x9BDBE1 # [x86,FPU]
      FNDISI               = 0xDBE1   # [x86,FPU]
      FENI                 = 0x9BDBE0 # [x86,FPU]
      FNENI                = 0xDBE0   # [x86,FPU]
      FINCSTP              = 0xD9F7   # [x86,FPU]
      FINIT                = 0x9BDBE3 # [x86,FPU]
      FNINIT               = 0xDBE3   # [x86,FPU]
      FLD1                 = 0xD9E8   # [x86,FPU]
      FLDL2E               = 0xD9EA   # [x86,FPU]
      FLDL2T               = 0xD9E9   # [x86,FPU]
      FLDLG2               = 0xD9EC   # [x86,FPU]
      FLDLN2               = 0xD9ED   # [x86,FPU]
      FLDPI                = 0xD9EB   # [x86,FPU]
      FLDZ                 = 0xD9EE   # [x86,FPU]
      FNOP                 = 0xD9D0   # [x86,FPU]
      FPATAN               = 0xD9F3   # [x86,FPU]
      FPTAN                = 0xD9F2   # [x86,FPU]
      FPREM                = 0xD9F8   # [x86,FPU]
      FPREM1               = 0xD9F5   # [386,FPU]
      FRNDINT              = 0xD9FC   # [x86,FPU]
      FSCALE               = 0xD9FD   # [x86,FPU]
      FSETPM               = 0xDBE4   # [286,FPU]
      FSIN                 = 0xD9FE   # [386,FPU]
      FSINCOS              = 0xD9FB   # [386,FPU]
      FSQRT                = 0xD9FA   # [x86,FPU]
      FTST                 = 0xD9E4   # [x86,FPU]
      FUCOMPP              = 0xDAE9   # [386,FPU]
      FXAM                 = 0xD9E5   # [x86,FPU]
      FXCH                 = 0xD9C9   # [x86,FPU]
      FXTRACT              = 0xD9F4   # [x86,FPU]
      FYL2X                = 0xD9F1   # [x86,FPU]
      FYL2XP1              = 0xD9F9   # [x86,FPU]
      HLT                  = 0xF4     # [x86]
      INSB                 = 0x6C     # [186]
      INSW                 = 0x6D     # [186,o16]
      INSD                 = 0x6D     # [386,o32]
      INT3                 = 0xCC     # [x86]
      INTO                 = 0xCE     # [x86]
      IRET                 = 0xCF     # [x86]
      IRETW                = 0xCF     # [x86,o16]
      IRETD                = 0xCF     # [386,o32]
      LAHF                 = 0x9F     # [x86]
      LEAVE                = 0xC9     # [186]
      LOADALL              = 0x0F07   # [386]
      LOADALL286           = 0x0F05   # [286]
      LODSB                = 0xAC     # [x86]
      LODSW                = 0xAD     # [x86,o16]
      LODSD                = 0xAD     # [386,o32]
      MOVSB                = 0xA4     # [x86]
      MOVSW                = 0xA5     # [x86,o16]
      MOVSD                = 0xA5     # [386,o32]
      NOP                  = 0x90     # [x86]
      OUTSB                = 0x6E     # [186]
      OUTSW                = 0x6F     # [186,o16]
      OUTSD                = 0x6F     # [386,o32]
      POPA                 = 0x61     # [186]
      POPAW                = 0x61     # [186,o16]
      POPAD                = 0x61     # [386,o32]
      POPF                 = 0x9D     # [186]
      POPFW                = 0x9D     # [186,o16]
      POPFD                = 0x9D     # [386,o32]
      PUSHA                = 0x60     # [186]
      PUSHAW               = 0x60     # [186,o16]
      PUSHAD               = 0x60     # [386,o32]
      PUSHF                = 0x9C     # [186]
      PUSHFW               = 0x9C     # [186,o16]
      PUSHFD               = 0x9C     # [386,o32]
      RET                  = 0xC3     # [x86]
      RETF                 = 0xCB     # [x86]
      RETN                 = 0xC3     # [x86]
      SAHF                 = 0x9E     # [x86]
      SALC                 = 0xD6     # [x86]
      SCASB                = 0xAE     # [x86]
      SCASW                = 0xAF     # [x86,o16]
      SCASD                = 0xAF     # [386,o32]
      SMI                  = 0xF1     # [386,AMD]
      STC                  = 0xF9     # [x86]
      STD                  = 0xFD     # [x86]
      STI                  = 0xFB     # [x86]
      STOSB                = 0xAA     # [x86]
      STOSW                = 0xAB     # [x86,o16]
      STOSD                = 0xAB     # [386,o32]
      WAIT                 = 0x9B     # [x86]
      XLATB                = 0xD7     # [x86]
    end
  end

end
