module Machinery
  class Assembler

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
      require "machinery/assembler/#{target}"
      @@targets[target.to_sym]
    end

    ##
    # Assembles a sequence of instructions into a target-specific result.
    #
    # @param insns    a sequence of assembly instructions
    # @param options  options for the assembler
    def assemble(insns, options = {})
      raise NotImplementedError.new
    end

    protected
      @@targets = {}

      def self.target(name) #:nodoc:
        @@targets[name.to_sym] = self
      end

    module Targets end
  end
end
