# frozen_string_literal: true

module HexletCode
  # Tag generating class
  class Tag
    class << self
      def build(tag, options = {}, &block)
        new(tag, options, &block)
      end
    end

    def initialize(tag, options, &_block)
      @params = get_params(options)
      @tag = tag
      @content = block_given? ? yield : nil

      build(@tag, @params, @content)
    end

    def build(tag, params, content)
      result = "<#{tag}#{params}>#{content}"

      case tag.to_sym
      when :label, :div then result += "</#{tag}>"
      end
      result
    end

    private

    def get_params(options)
      options.each_with_object("") { |(key, value), params| params + " #{key}=\"#{value}\"" }
      params
    end
  end
end
