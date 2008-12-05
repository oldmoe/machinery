require 'stringio'

module Machinery
  class Format
    @@formats = {}

    def self.formats() @@formats end

    def self.mime_type(type)
      @@formats[self] ||= {}
      @@formats[self][:mime_types] ||= []
      @@formats[self][:mime_types] << type
    end

    def self.extension(*exts)
      @@formats[self] ||= {}
      @@formats[self][:extensions] ||= []
      @@formats[self][:extensions].push(*exts)
    end

    def self.for(options = {})
      options = case options
        when Symbol then { :extension => options }
        when String then { :mime_type => options }
        else options
      end
      if mime_type = options[:mime_type]
      puts "MIME #{mime_type} #{@@formats[mime_type]}"
        return @@formats[mime_type]
      end
      if extension = options[:extension]
      puts "EXT"
        return @@formats.find { |format| format.first == extension }
      end
    end

    class BinaryFormat < Format
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

      class << self
        alias_method :header, :section
        alias_method :field, :section
        alias_method :magic, :section
      end

      def self.endianness(value)
        @@endianness[self] = value.to_sym
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
        @@endianness = {}
        @@sections = {}
    end

  end
end
