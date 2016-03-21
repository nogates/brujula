module Brujula
  module TypeExtender
    class ResourceType
      attr_reader :definition

      def initialize(definition:)
        @definition = definition
      end

      def call
        return definition if definition.type.nil?

        extended_object
      end

      def parent_definition
        if within_root_resource_types?  # maybe its not preload
          definition.parent.fetch(definition.type)
        else
          definition.root.resource_types.fetch(definition.type)
        end
      end

      def extended_object
        @extended_object ||= Brujula::Mergers::ObjectMerger.new(
          superinstance: parent_definition, instance: definition
        ).call
      end

      def within_root_resource_types?
        definition.parent.is_a?(Brujula::MapObject) &&
        definition.parent.parent.is_a?(Brujula::Raml::V1_0::Root)
      end
    end
  end
end
