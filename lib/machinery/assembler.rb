require 'machinery/extensions'
require 'machinery/arch'
require 'machinery/format'

module Machinery
  class Assembler
    attr_accessor :lineno

    ##
    # Assembles a sequence of instructions into a target-specific file format.
    #
    # @param filename     a relative or absolute file path to the output file
    # @param options      options for the assembler
    # @return [Integer]   the number of bytes written
    def self.assemble_to_file(filename, options = {}, &block)
      target = @@targets.index(self) || options[:target]
      raise ArgumentError.new('must specify :target in arguments') unless target
      File.open(filename, 'wb') do |file|
        file.write(self.assemble(nil, options, &block).marshal_dump)
        file.pos rescue nil
      end
    end

    ##
    # Assembles a sequence of instructions for the specified output target.
    #
    # @param instructions a sequence of assembly instructions
    # @param options      options for the assembler
    def self.assemble(instructions, options = {}, &block)
      target = @@targets.index(self) || options[:target]
      raise ArgumentError.new('must specify :target in arguments') unless target
      self.for(target).new.assemble(instructions, options, &block)
    end

    ##
    # Returns an assembler implementation for the specified output target.
    #
    # @param target       the assembler's target name (e.g. :python)
    # @return [Class]     the assembler class
    def self.for(target)
      require "machinery/assembler/#{target}" unless @@targets.has_key?(target.to_sym)
      assembler = @@targets[target.to_sym]
      assembler.initialize!
      assembler
    end

    ##
    # Assembles a sequence of instructions into a target-specific output.
    #
    # @param instructions a sequence of assembly instructions
    # @param options      options for the assembler
    def assemble(instructions = nil, options = {}, &block)
      instructions.each { |instruction| send(*instruction.to_a) } unless instructions.nil?
      instance_eval(&block) if block_given?
      output
    end

    ##
    # Emits a single instruction into the output instruction stream.
    def emit(opcode, *args)
      self << Machinery::Architecture::Instruction.new(opcode, *args)
    end

    ##
    # Appends a single instruction to the output instruction stream.
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
        alias_method(:output, format)
        define_method(:<<, lambda { |instruction| self.output << instruction })
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
