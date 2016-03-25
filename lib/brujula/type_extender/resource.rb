module Brujula
  module TypeExtender
    class Resource
      attr_reader :definition

      def initialize(definition:)
        @definition = definition
      end

      def call
        return definition if definition.type.nil? && definition.is.nil?

        extended_object
      end

      def extended_object
        @extended_object ||= apply_inherit_chain
      end

      def apply_inherit_chain
        object = definition.dup
        object = apply_type(object) unless definition.type.nil?
        object = apply_traits(object) unless definition.is.nil?
        object
      end

      def apply_type(object)
        Brujula::Mergers::ObjectMerger.new(
          superinstance: parametized_type,
          instance:      object,
        ).call
      end

      def apply_traits(object)
        return object if definition.methods.nil?

        object.methods.each do |method|
          new_method = apply_traits_to_method(method)
          object.methods.merge(new_method.name, new_method)
        end
        object
      end

      def apply_traits_to_method(method)
        definition.is.inject(method.dup) do |object, trait|
          Brujula::Mergers::ObjectMerger.new(
            superinstance: parametized_trait(trait, object), instance: object
          ).call
        end
      end

      def parametized_trait(trait, method)
        ParameterParser.new(
          definition: trait,
          parameters: apply_parameters_for_trait(trait, method)
        ).call
      end


      def parametized_type
        ParameterParser.new(
          definition: definition.type, parameters: apply_parameters_for_type
        ).call
      end

      def apply_parameters_for_type
        type_parameters.tap do |hash|
          hash.merge!(resource_parameters)
        end
      end

      def apply_parameters_for_trait(trait, method)
        trait_parameters(trait).tap do |hash|
          hash.merge!(method_parameters(method))
        end
      end

      def method_parameters(method)
        resource_parameters.merge(
          "methodName" => method.name
        )
      end

      def trait_parameters(trait)
        trait.instance_variable_get("@parameters") || {}
      end

      def type_parameters
        definition.type.instance_variable_get("@parameters") || {}
      end

      def resource_parameters
        {
          "resourcePath"     => resource_path,
          "resourcePathName" => resource_path_name
        }
      end

      def resource_path
        definition.name
      end

      def resource_path_name
        definition.name.split('/').last.gsub(/[\{\}]/, "")
      end
    end
  end
end
