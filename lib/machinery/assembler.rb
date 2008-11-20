require 'machinery/extensions'
require 'machinery/arch'
require 'machinery/binary'

module Machinery
  class Assembler
    attr_accessor :lineno

    ##
    # Assembles a sequence of instructions for the specified target.
    #
    # @param insns    a sequence of assembly instructions
    # @param target   the assembler's target name (e.g. :pyc)
    # @param options  options for the assembler
    def self.assemble(insns, options = {})
      target = @@targets.index(self) || options[:target]
      raise ArgumentError.new('must specify :target in arguments') unless target
      self.for(target).new.assemble(insns, options)
    end

    ##
    # Returns an assembler implementation for the specified target.
    #
    # @param target   the assembler's target name (e.g. :pyc)
    # @return [Class] the assembler class
    def self.for(target)
      require "machinery/assembler/#{target}" unless @@targets.has_key?(target.to_sym)
      assembler = @@targets[target.to_sym]
      assembler.initialize!
      assembler
    end

    ##
    # Assembles a sequence of instructions into a target-specific file.
    def assemble_to_file(filename, options = {}, &block)
      File.open(filename, 'w') do |file|
        file.write(assemble(nil, options, &block).marshal_dump)
        file.pos rescue nil
      end
    end

    ##
    # Assembles a sequence of instructions into a target-specific result.
    #
    # @param insns    a sequence of assembly instructions
    # @param options  options for the assembler
    def assemble(insns, options = {}, &block)
      raise NotImplementedError.new
    end

    ##
    # Emits a single instruction into the output instruction stream.
    def emit(opcode, *args)
      self << Machinery::Architecture::Instruction.new(opcode, *args)
    end

    ##
    # Appends a single instruction into the output instruction stream.
    def <<(instruction)
      raise NotImplementedError.new
    end

    protected
      @@initialized = {}
      @@targets = {}

      def self.target(*names) #:nodoc:
        names.each { |name| @@targets[name.to_sym] = self }
      end

      def self.format(format) #:nodoc:
        attr_accessor(format)
        define_method(:<<, lambda { |instruction| send(format) << instruction })
      end

      def self.inherited(subclass) #:nodoc:
        subclass.extend(Machinery::Extensions)
      end

      def self.initialize! #:nodoc:
        @@initialized[self] ||= begin
          self.install_extensions!
          true
        end
      end
  end
end
