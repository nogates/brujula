module Brujula
  module Parameters
    class Parser
      attr_reader :object, :parameters

      def initialize(object:, parameters:)
        @object     = object
        @parameters = parameters
      end

      def call
        parametize(object)
      end

      private

      def parametize(extend_object)
        extend_object.dup.tap do |definition|
          applicable_attributes(definition).each do |attribute|
            property          = definition.instance_variable_get(attribute)
            extended_property = parse_attribute(property)

            definition.instance_variable_set(attribute, extended_property)
          end
        end
      end

      def parse_attribute(definition)
        case
        when definition.is_a?(Brujula::Object)
          parametize(definition)
        when definition.is_a?(Brujula::MapObject)
          parametize_map_object(definition)
        when definition.is_a?(::String)
          parametize_string(definition)
        else
          definition
        end
      end

      def parametize_map_object(definition)
        definition.dup.tap do |map_object|
          items = map_object.instance_variable_get("@collection")
          items = items.each_with_object({}) do |(name, item), collection|
            collection.merge!(parametize_string(name) => parametize(item))
          end
          map_object.instance_variable_set("@collection", items)
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
