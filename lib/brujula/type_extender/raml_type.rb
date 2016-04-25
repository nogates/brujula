module Brujula
  module TypeExtender
    class RamlType

      RAML_TYPES = %w( object number string integer boolean date file )

      attr_reader :definition

      def initialize(definition:)
        @definition = definition
      end

      def call
        return definition unless custom_type?

        Brujula::Mergers::ObjectMerger.new(
          superinstance: reference_type, instance: definition
        ).call
      end

      def custom_type?
        ! RAML_TYPES.include?(definition.type)
      end

      def reference_type
        if definition.parent.name == "types" # root types, not preloaded
          definition.parent.fetch(definition.type)
        else
          definition.root.types.fetch(definition.type)
        end
      rescue KeyError => error
        raise Brujula::Raml::InvalidTypeReference,
          "The referenced type #{ definition.type } cannot be processed"
      end
    end
  end
end
