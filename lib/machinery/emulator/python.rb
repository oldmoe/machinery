require 'machinery/emulator'
require 'machinery/arch/pyvm'

module Machinery class Emulator
  ##
  # A simple emulator mimicking the Python runtime.
  class Python < Emulator
    architecture PythonVM
    instructions PythonVM::Instructions => :emulator
    attr_reader  :release
    attr_reader  :options

    def initialize(release = "2.6", options = {}, &block) # :yield: self
      @release = release
      super(options, &block)
    end
  end
end end

if $0 == __FILE__
  Machinery::Emulator::Python.new do
    load_const "Hello, world!"
    print_item
    print_newline
    load_const nil
    return_value
  end
end
