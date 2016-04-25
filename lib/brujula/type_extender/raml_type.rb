module Brujula
  module TypeExtender
    class RamlType

      RAML_TYPES = %w( object number string integer boolean date file array )

      attr_reader :definition

      def initialize(definition:)
        @definition = definition
      end

      def call
        return definition unless custom_type?

        expand_object
      end

      private

      def expand_object
        superinstances.inject(definition) do |instance, superinstance|
          Brujula::Mergers::ObjectMerger.new(
            superinstance: superinstance, instance: instance
          ).call
        end
      end

      def superinstances
        case definition.type
        when Array
          definition.type.map { |type| get_reference(type) }
        when String
          [ get_reference(definition.type) ]
        else
          raise_invalid_reference(definition.type)
        end
      end

      def raise_invalid_reference(reference)
        raise Brujula::Raml::InvalidTypeReference,
          "The referenced type #{ reference } cannot be processed"
      end

      def custom_type?
        ! RAML_TYPES.include?(definition.type)
      end

      def get_reference(reference)
        if definition.parent.name == "types" # root types, not preloaded
          definition.parent.fetch(reference)
        else
          definition.root.types.fetch(reference)
        end
      rescue KeyError
        raise_invalid_reference(reference)
      end
    end
  end
end
