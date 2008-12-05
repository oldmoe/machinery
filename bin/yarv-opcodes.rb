#!/usr/bin/env ruby
abort "Usage: #{$0} path/to/insns.def" unless ARGV.first

opcode, opcodes = false, {}
File.foreach(ARGV.first) do |line|
  line.chomp!
  if line == 'DEFINE_INSN'
    opcode = true
  elsif opcode
    opcode = false
    puts "%-20s = 0x%02x # %03d" % [line.upcase, opcodes.size, opcodes.size]
    opcodes[line] = opcodes.size
  end
end
