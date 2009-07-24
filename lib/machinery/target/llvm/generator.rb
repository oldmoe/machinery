require 'machinery/generator'

module Machinery module LLVM
  ##
  # Generates LLVM program (.ll file) source code.
  #
  # @see http://llvm.org/docs/LangRef.html
  class Generator < Machinery::Generator

    ##
    # @see http://llvm.org/docs/LangRef.html#functionstructure
    # @see http://llvm.org/docs/LangRef.html#fnattrs
    # @see http://llvm.org/docs/LangRef.html#gc
    def define(type, name, *params, &block)
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#paramattrs
    def declare(type, name, *params)
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#datalayout
    def target(options = {})
      # TODO
    end

    def self.type(*names)
      names.each do |name|
        name = name.to_sym
        define_method(name) do |*args|
          args.empty? ? name : Type.new(name, *args)
        end
      end
    end

    # 5.2 Primitive Types

    type :float, :double, :fp128, :x86_fp80, :ppc_fp128
    type :void
    type :label
    type :metadata

    # 5.3.1 Integer Type

    type :i8, :i16, :i32, :i64, :i128

    def i(bits, *args)
      Type.new("i#{bits}", *args)
    end

    # 5.3.2 Array Type

    def array(elements, element_type)
      Type.new # TODO
    end

    # 5.3.3 Function Type

    def function(return_type, *parameters)
      Type.new # TODO
    end

    # 5.3.4 Pointer Type

    def pointer(type)
      Type.new # TODO
    end

    # 5.3.5 Structure Type

    def struct(*types)
      Type.new # TODO
    end

    # 5.3.6 Packed Structure Type

    def packed(*types)
      Type.new # TODO
    end

    # 5.3.7 Vector Type

    def vector(elements, element_type)
      Type.new # TODO
    end

    # 5.3.8 Opaque Type

    type :opaque

    # 7.1 Inline Assembler Expressions

    ##
    # @see http://llvm.org/docs/LangRef.html#inlineasm
    def asm(string, options = {})
      # TODO
    end

    # 9.1 Terminator Instructions

    ##
    # @see http://llvm.org/docs/LangRef.html#i_ret
    def ret(type, value = nil)
      emit :ret # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_br
    def br
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_switch
    def switch
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_invoke
    def invoke
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_unwind
    def unwind
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_unreachable
    def unreachable
      # TODO
    end

    # 9.2 Binary Operations

    ##
    # @see http://llvm.org/docs/LangRef.html#i_add
    def add(type, op1, op2, options = {})
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_fadd
    def fadd(type, op1, op2, options = {})
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_sub
    def sub(type, op1, op2, options = {})
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_fsub
    def fsub(type, op1, op2, options = {})
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_mul
    def mul(type, op1, op2, options = {})
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_fmul
    def fmul(type, op1, op2, options = {})
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_udiv
    def udiv(type, op1, op2, options = {})
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_sdiv
    def sdiv(type, op1, op2, options = {})
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_fdiv
    def fdiv(type, op1, op2, options = {})
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_urem
    def urem(type, op1, op2, options = {})
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_srem
    def srem(type, op1, op2, options = {})
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_frem
    def frem(type, op1, op2, options = {})
      # TODO
    end

    # 9.3 Bitwise Binary Operations

    ##
    # @see http://llvm.org/docs/LangRef.html#i_shl
    def shl
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_lshr
    def lshr
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_ashr
    def ashr
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_and
    def and_
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_or
    def or_
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_xor
    def xor_
      # TODO
    end

    # 9.4 Vector Operations

    ##
    # @see http://llvm.org/docs/LangRef.html#i_extractelement
    def extractelement
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_insertelement
    def insertelement
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_shufflevector
    def shufflevector
      # TODO
    end

    # 9.5 Aggregate Operations

    ##
    # @see http://llvm.org/docs/LangRef.html#i_extractvalue
    def extractvalue
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_insertvalue
    def insertvalue
      # TODO
    end

    # 9.6 Memory Access and Addressing Operations

    ##
    # @see http://llvm.org/docs/LangRef.html#i_malloc
    def malloc
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_free
    def free
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_alloca
    def alloca
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_load
    def load
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_store
    def store
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_getelementptr
    def getelementptr
      # TODO
    end

    # 9.7 Conversion Operations

    ##
    # @see http://llvm.org/docs/LangRef.html#i_trunc
    def trunc
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_zext
    def zext
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_sext
    def sext
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_fptrunc
    def fptrunc
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_fpext
    def fpext
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_fptoui
    def fptoui
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_fptosi
    def fptosi
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_uitofp
    def uitofp
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_sitofp
    def sitofp
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_ptrtoint
    def ptrtoint
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_inttoptr
    def inttoptr
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_bitcast
    def bitcast
      # TODO
    end

    # 9.8 Other Operations

    ##
    # @see http://llvm.org/docs/LangRef.html#i_icmp
    def icmp
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_fcmp
    def fcmp
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_phi
    def phi
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_select
    def select
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_call
    def call
      # TODO
    end

    ##
    # @see http://llvm.org/docs/LangRef.html#i_va_arg
    def va_arg
      # TODO
    end

    class Type
      def *(other)
        # TODO
      end

      def %(other)
        # TODO
      end
    end
  end
end end
