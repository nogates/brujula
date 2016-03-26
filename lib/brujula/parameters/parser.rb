module Brujula
  module Parameters
    class Parser

      attr_reader :object, :parameters

      def initialize(object:, parameters:)
        @object     = object
        @parameters = parameters
      end

      def call
        parametize(object.dup)
      end

      def parametize(object)
        object.dup.tap do |object|
          applicable_attributes(object).each do |attribute|
            property = object.instance_variable_get(attribute)

            if property.is_a?(Brujula::Object)
              property = parametize(original_property)
            elsif property.is_a?(Brujula::MapObject)
              property = property.dup.tap do |map_object|
                items = map_object.instance_variable_get("@collection")
                items = items.each_with_object({}) do |(name, item), collection|
                  collection.merge!(parametize_string(name) => parametize(item))
                end
                map_object.instance_variable_set("@collection", items)
              end
            elsif property.is_a?(::String)
              property = parametize_string(property)
            end


            object.instance_variable_set(attribute, property)
          end
        end
      end

      def parametize_string(string)
        string.gsub(/<<(.*?)>>/) do |expression|
          content          = expression.match(/<<(.*?)>>/)[1]
          expression_chain = content.split('|')
          parameter_name   = expression_chain.first.strip
          value            = parameters.fetch(parameter_name)

          expression_chain[1..-1].inject(value) do |result, function|
            transformer_functions.call(result, function.strip)
          end
        end
      end

      def transformer_functions
        @transformer_functions = Brujula::Parameters::Functions.new
      end

      def applicable_attributes(object)
        object.instance_variables - excluded_attributes
      end

      def excluded_attributes
        %i( @parent @parameters )
      end
    end
  end
end
