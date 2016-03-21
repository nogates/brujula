module Brujula
  module DataTransformers
    class PropertyDeclaration
      class << self
        def call(*args)
          new(*args).call
        end
      end

      attr_reader :data, :parent

      def initialize(parent, data)
        @parent = parent
        @data   = data
      end

      def call
        data.each_with_object({}) do |(key, property), object|
          if property.is_a?(String) # data as type
            object.merge!(key => { "type" => property })
          else
            object.merge!(key => property)
          end
        end
      end
    end
  end
end
