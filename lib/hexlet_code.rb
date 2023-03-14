# frozen_string_literal: true

require_relative "hexlet_code/version"

# Module form generate
module HexletCode
  autoload :Tag, "hexlet_code/tag"

  def self.build(tag, options = {}, &block)
    @tag = Tag.build(tag, options, &block)
  end
end
