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
            superinstance: trait, instance: object
          ).call
        end
      end
    end
  end
end
