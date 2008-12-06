require 'machinery/emulator'

module Machinery class Emulator
  ##
  # An emulator for the Intel x86 architecture.
  #
  # @see http://en.wikipedia.org/wiki/Category:X86_architecture
  # @see http://en.wikipedia.org/wiki/X86_architecture
  class X86 < Emulator
    attr_accessor :model

    def initialize(model, options = {})
      @model = model.to_s.to_sym
      require "machinery/emulator/x86/#{model}"
      extend Machinery::Emulator.const_get(:"X86_#{model}")
    end

    def method_missing(instruction, *operands)
      raise InvalidInstruction.new("unknown or unsupported instruction '#{instruction}'")
    end
  end
end end
