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
      NOP                  = 0x90 # 144
    end
  end

end
