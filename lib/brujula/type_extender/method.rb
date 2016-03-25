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
        ParameterParser.new(
          definition: trait,
          parameters: apply_parameters_for_trait(trait)
        ).call
      end

      def apply_parameters_for_trait(trait)
        trait_parameters(trait).tap do |hash|
          hash.merge!(method_parameters)
        end
      end

      def trait_parameters(trait)
        trait.instance_variable_get("@parameters") || {}
      end

      def method_parameters
        {
          "methodName"       => definition.name,
          "resourcePath"     => resource_path,
          "resourcePathName" => resource_path_name
        }
      end

      def resource_path
        resource.name
      end

      def resource_path_name
        resource.name.split('/').last.gsub(/[\{\}]/, "")
      end

      def resource
        definition.parent.parent
      end
    end
  end
end
