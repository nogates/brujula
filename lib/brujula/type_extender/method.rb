module Brujula
  module TypeExtender
    class Method

      attr_reader :definition

      def initialize(definition:)
        @definition = definition
      end

      def call
        return definition if definition.is.nil?

        extended_object
      end

      def extended_object
        @extended_object ||= apply_inherit_chain
      end

      def apply_inherit_chain
        definition.is.inject(definition.dup) do |object, trait|
          Brujula::Mergers::ObjectMerger.new(
            superinstance: parametized_trait(trait), instance: object
          ).call
        end
      end

      def parametized_trait(trait)
        Brujula::Parameters::Parser.new(
          object:     trait,
          parameters: parameter_builder(trait).method_params(resource, definition)
        ).call
      end

      def parameter_builder(object)
        Brujula::Parameters::Builder.new(
          object: object
        )
      end

      def resource
        definition.parent.parent
      end
    end
  end
end
