module Machinery
  class Generator
    attr_accessor :output

    def initialize(options = {}, &block)
      @nesting, @output = 0, []
      @options = options
      instance_eval(&block) if block_given?
    end

    def emit(*args)
      @output.push(*args.map { |arg| [@nesting, arg] })
    end

    def unemit()
      @output.pop.pop
    end

    protected

      def nested_eval(&block)
        @nesting += 1
        instance_eval(&block) if block_given?
        @nesting -= 1
      end

    class Label
      attr_accessor :name, :options

      def initialize(name, options = {})
        @name = name.to_sym
        @options = { :local => false }.merge(options)
      end

      def local?() options[:local] end

      def method_missing(local, &block)
        Label.new("#{name}.#{local}")
      end

      def to_s
        local? ? ".#{name}:" : "#{name}:"
      end

      def inspect
        "#<#{self.class}(#{to_s})>"
      end
    end
  end
end
