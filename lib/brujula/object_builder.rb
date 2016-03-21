module Brujula
  class ObjectBuilder
    attr_reader :definition, :data, :key, :key_data

    def initialize(definition:, data:, key:)
      @definition = definition
      @data       = data
      @key        = key
      @key_data   = extract_and_transform_data
    end

    def call
      return nil if key_data.nil?
      return object_reference if is_object_reference?
      return map_object_reference if is_map_object_reference?

      object_class.new(new_object_arguments).expand
    end

    private

    def extract_and_transform_data
      return if data.nil? || extracted_data.nil?
      return extracted_data if key.data_transformer.nil?

      data_transformer.call(definition, extracted_data)
    end

    def data_transformer
      Brujula::DataTransformers.const_get(
        Inflecto.camelize(key.data_transformer.to_s)
      )
    end

    def extracted_data
      @extracted_data ||= case
      when key.fixed?
        data.fetch(ramelize_name, nil)
      else
        data.select { |name, value| key.matches?(name) }
      end
    end

    def ramelize_name
      Inflecto.ramelize(key.expression.to_s)
    end

    def is_object_reference?
      key.referrable? &&
      key_data.is_a?(String) &&
      object_class < Brujula::Object
    end

    def is_map_object_reference?
      key.referrable? &&
      key_data.is_a?(Array) &&
      object_class == Brujula::MapObject
    end

    def object_reference
      case
      when object_class == Brujula::Raml::V1_0::ResourceType
        definition.root.resource_types.fetch(key_data)
      else
        raise "Invalid reference"
      end
    end

    def map_object_reference
      case
      when key.expression == :secured_by
        key_data.map do |security_scheme_ref|
          if security_scheme_ref.nil? # NullSecuritySchema
            Brujula::Raml::V1_0::NullSecuritySchema.new
          else
            definition.root.security_schemes.fetch(security_scheme_ref)
          end
        end
      when key.expression == :is
        key_data.map do |trait_ref|
          definition.root.traits.fetch(trait_ref)
        end
      else
        raise "Invalid reference"
      end
    end

    def object_class
      @object_class ||= if key.options[:as] == :map_object
        Brujula::MapObject
      elsif key.basic_type?
        Brujula::BasicType
      else
        Brujula::Raml::V1_0.const_get(
          Inflecto.camelize(key.options[:as].to_s)
        )
      end
    end

    def new_object_arguments
      {
        data:   key_data,
        name:   key.name,
        parent: definition
      }.tap do |args|
        if key.options[:as] == :map_object
          args.merge!(child_class: key.options[:children])
        elsif key.basic_type?
          args.merge!(as: key.options[:as])
        end
      end
    end
  end
end
