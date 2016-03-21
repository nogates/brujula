# TODO
require 'psych'

# `stolen` from:
# http://stackoverflow.com/questions/29462856/loading-yaml-with-line-number-for-each-key

class Psych::Nodes::Node
  attr_accessor :_brujula_line
end

class Psych::Visitors::ToRuby
  def revive_hash hash, o
    o.children.each_slice(2) { |k,v|
      key = accept(k)
      val = accept(v)

      # TODO
      # This is not working because instead of returning a `val`, which could
      # be an string for example, it's returning a hash
      # Actually, I am not really interested in adding the line number to
      # object values. I am only interested in adding the lines to the object
      # itself, probably, as some kind of raml anotation, so it could be used
      # as another anotated property, and thus, displayed in the documentation
      # TODO

      if v.is_a? ::Psych::Nodes::Scalar
        val = { "value" => val, "_brujula_line" => v._brujula_line + 1} # line is 0 based, so + 1
      end

      # Code dealing with << (for merging hashes) omitted.
      # If you need this you will probably need to copy it
      # in here. See the method:
      # https://github.com/tenderlove/psych/blob/v2.0.13/lib/psych/visitors/to_ruby.rb#L333-L365

      hash[key] = val
    }
    hash
  end
end

module Brujula
  class LineNumberHandler < Psych::TreeBuilder
    attr_accessor :parser

    def scalar value, anchor, tag, plain, quoted, style
      mark = parser.mark
      s = super
      s._brujula_line = mark.line
      s
    end
  end

  class YamlParser
    class << self
      def load(string)
       handler = Brujula::LineNumberHandler.new
       parser  = Psych::Parser.new(handler)

       handler.parser = parser

       parser.parse string

       handler.root.to_ruby.first
      end
    end
  end
end
