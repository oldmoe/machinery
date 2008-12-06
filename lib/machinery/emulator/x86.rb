require 'machinery/emulator'

module Machinery class Emulator
  ##
  # An emulator for the Intel x86 architecture.
  #
  # @see http://en.wikipedia.org/wiki/Category:X86_architecture
  # @see http://en.wikipedia.org/wiki/X86_architecture
  class X86 < Emulator
    attr_accessor :model, :options

    def initialize(model, options = {})
      @model = case model = model.to_s.to_sym
        when :"8088"  then :"8086"
        when :"80188" then :"80186"
        when :i186    then :"80186"
        when :i286    then :"80286"
        when :i386    then :"80386"
        when :i486    then :"80486"
        when :i586    then :"pentium-mmx"
        when :i686    then :"pentium-pro"
        else model
      end
      @options = options
      extend_instruction_set!(@model)
    end

    def method_missing(instruction, *operands)
      raise InvalidInstruction.new("unknown or unsupported instruction '#{instruction}'")
    end

    protected

      def extend_instruction_set!(model)
        load_instruction_set!(:x86, model)
        klass = "X86_#{model.to_s.gsub('-', '')}".downcase
        klass = Machinery::Emulator.constants.find { |const| const.to_s.downcase == klass }
        extend Machinery::Emulator.const_get(klass)
      end
  end
end end
