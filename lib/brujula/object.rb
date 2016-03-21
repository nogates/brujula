module Brujula
  class Object
    attr_reader :name

    class << self
      attr_reader :scheme, :block

      def scheme(options = {}, &block) # TODO
        return @scheme unless @scheme.nil?

        if block_given?
          @block  = block
          @scheme = Brujula::Scheme.new(self, options, block)
        else
          @scheme = Brujula::Scheme.new(self, options)
        end
      end
    end

    def initialize(data:, parent: nil, name:)
      @name = name
      define_singleton_method(:raw_data) { data }
      define_singleton_method(:parent)   { parent }

      Brujula::ObjectParser.call(definition: self, data: data, parent: parent)
    end

    def expand # TODO
      @representation || self
    end

    def root
      object = self
      until object.is_a? Brujula::Raml::V1_0::Root
        object = object.parent
      end
      object
    end
  end
end
