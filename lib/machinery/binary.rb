require 'stringio'

module Machinery
  class BinaryFormat

    def self.sections(props = {}, &block)
      @@sections[self] ||= {}
      props.each do |name, default|
        @@sections[self][name.to_sym] = default
        attr_accessor(name.to_sym)
      end
    end

    def self.section(prop = {})
      sections(prop)
    end

    def initialize(options = {})
      @@sections[self.class].each do |name, default|
        value = options[name] || default
        value = instance_eval(&value) if value.is_a?(Proc)
        instance_variable_set(:"@#{name}", value)
      end
    end

    def each_byte(&block)
      to_pyc.each_byte(&block)
    end

    def to_a() marshal_dump.split(//) end
    def to_s() marshal_dump end

    def marshal_load(dumped)
      raise NotImplementedError.new
    end

    def marshal_dump()
      write(out = StringIO.new).string
    end

    def write(out)
      raise NotImplementedError.new
    end

    protected
      @@sections = {}
  end
end
