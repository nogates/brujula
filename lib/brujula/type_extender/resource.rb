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
        Brujula::Parameters::Parser.new(
          object:     trait,
          parameters: parameter_builder(trait).method_params(definition, method)
        ).call
      end

      def parametized_type
        Brujula::Parameters::Parser.new(
          object:     definition.type,
          parameters: parameter_builder(definition.type).resource_params(definition)
        ).call
      end

      def parameter_builder(object)
        Brujula::Parameters::Builder.new(
          object: object
        )
      end
    end
  end
end
