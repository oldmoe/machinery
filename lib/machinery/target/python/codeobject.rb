require 'machinery/format'

##
# Constructs a PyCodeObject structure for serialization into a .pyc file.
#
# @see http://svn.python.org/projects/python/trunk/Python/compile.c
module Machinery::Python
  class CodeObject < Machinery::Format::BinaryFormat
    mime_type 'application/x-python-bytecode'
    extension :pyc

    # @see http://svn.python.org/projects/python/trunk/Python/import.c
    MAGIC = {
      '2.0'   => 50823,
      '2.1'   => 60202,
      '2.2'   => 60717,
      '2.3a0' => 62011,
      '2.3a0' => 62021,
      '2.3a0' => 62011, # (!)
      '2.3'   => 62011,
      '2.4a0' => 62041,
      '2.4a3' => 62051,
      '2.4b1' => 62061,
      '2.4'   => 62061,
      '2.5a0' => 62071,
      '2.5a0' => 62081, # (ast-branch)
      '2.5a0' => 62091, # (with)
      '2.5a0' => 62092, # (changed WITH_CLEANUP opcode)
      '2.5b3' => 62101, # (fix wrong code: for x, in ...)
      '2.5b3' => 62111, # (fix wrong code: x += yield)
      '2.5c1' => 62121, # (fix wrong lnotab with for loops and storing constants that should have been removed)
      '2.5c2' => 62131, # (fix wrong code: for x, in ... in listcomp/genexp)
      '2.5'   => 62131,
      '2.6a0' => 62151, # (peephole optimizations and STORE_MAP opcode)
      '2.6a1' => 62161, # (WITH_CLEANUP optimization)
      '2.6'   => 62161,
    }

    section :co_argcount    => 0
    section :co_nlocals     => 0
    section :co_stacksize   => 0
    section :co_flags       => 0
    section :co_code        => []
    section :co_consts      => []
    section :co_names       => []
    section :co_varnames    => []
    section :co_freevars    => []
    section :co_cellvars    => []
    section :co_filename    => ''
    section :co_name        => lambda { (@options[:co_name] || '?').to_sym }, :validate => :to_sym
    section :co_firstlineno => 1
    section :co_lnotab      => []

    def initialize(options = {}, &block)
      super(@options = options)
      class <<@co_code; include Bytecode; end
      class <<@co_firstlineno; include FirstLineNumber; end
      class <<@co_lnotab; include LineNumberTab; end
      block.call(self) if block_given?
    end

    def co_name=(value)
      @co_name = value.to_sym
    end

    def lineno=(n)
      co_lnotab << [co_code.offset, n]
    end

    def <<(instruction)
      co_code << instruction
    end

    def to_pyc
      marshal_dump
    end

    def inspect
      super # TODO
    end

    def magic
      # TODO: use Utilities#python_magic
      [MAGIC[(@options[:version] || DEFAULT_VERSION)], ?\r, ?\n].pack('Scc')
    end

    def mtime
      (@options[:mtime] || Time.now).to_i
    end

    # @see http://svn.python.org/projects/python/trunk/Python/marshal.c
    def write(out)
      out << magic << [mtime].pack('L')
      out << 'c' << [co_argcount, co_nlocals, co_stacksize, co_flags].pack('LLLL')
      [co_code, co_consts, co_names, co_varnames, co_freevars, co_cellvars, co_filename, co_name].each do |section|
        out << section.to_pyc
      end
      #out << co_name.to_sym.to_pyc
      out << [co_firstlineno].pack('L')
      out << co_lnotab.to_pyc
    end

    protected

      def const(obj)
        co_consts << obj unless co_consts.include?(obj)
        co_consts.index(obj)
      end

    ##
    module Bytecode
      def offset
        inject(0) { |sum, instruction| sum + instruction.size }
      end

      def to_pyc
        flatten.map(&:to_s).join.to_pyc
      end
    end

    ##
    module FirstLineNumber
      def to_pyc
        [self].pack('L')
      end
    end

    ##
    # @see http://svn.python.org/projects/python/trunk/Python/compile.c#assemble_lnotab
    module LineNumberTab
      def to_pyc
        lnotab = []

        offset_was, lineno_was = 0, 0
        each do |offset_now, lineno_now|
          offset = offset_now - offset_was
          lineno = lineno_now - lineno_was
          offset_was, lineno_was = offset_now, lineno_now

          (offset / 255).times do # offset overflow
            offset -= 255
            lnotab << [255, 0]
          end

          (lineno / 255).times do # lineno overflow
            lineno -= 255
            lnotab << [offset, 255]
            offset = 0
          end

          lnotab << [offset, lineno]
        end

        lnotab.flatten.pack('C*').to_pyc
      end
    end

    ##
    module Extensions #:nodoc:
      module NilClass
        def to_pyc() 'N' end
      end

      module FalseClass
        def to_pyc() 'F' end
      end

      module TrueClass
        def to_pyc() 'T' end
      end

      module Fixnum
        def to_pyc() 'i' << [self].pack('L') end
      end

      module Bignum
        def to_pyc() 'l' << [self].pack('L') end # FIXME
      end

      module Float
        def to_pyc() 'f' << [to_s.size].pack('c') << to_s end
      end

      module String
        # This is ?s in Python <= 2.3, but ?t in Python >= 2.4
        def to_pyc() 's' << [size].pack('L') << self end
      end

      module Symbol
        def to_pyc() 't' << [to_s.size].pack('L') << to_s end # FIXME
      end

      module Array
        def to_pyc() '(' << [length].pack('L') << map(&:to_pyc).join end
      end
    end
  end
end
