module Brujula
  class Referrer

    attr_reader :name, :definition, :data

    def initialize(name:, definition:, data:)
      @name       = name
      @definition = definition
      @data       = data
    end

    def call
      object_to_reference(data)
    end

    private

    def object_to_reference(reference)
      case reference
      when String
        string_reference(reference)
      when Array
        map_object_reference(reference)
      when Hash
        # object_reference(reference) TODO
      when NilClass
        nil_reference(reference)
      else
        raise "Invalid reference"
      end
    end

    def map_object_reference(reference)
      data.each_with_object([]) do |reference, collection|
        collection << object_to_reference(reference)
      end
    end

    def nil_reference(reference)
      case name
      when "secured_by"
        Brujula::Raml::V1_0::NullSecuritySchema.new
      else
        raise "The reference from key #{ key } cannot be nil"
      end
    end

    def string_reference(reference)
      case name
      when "secured_by"
        definition.root.security_schemes.fetch(reference)
      when "type"
        definition.root.resource_types.fetch(reference)
      when "is"
        definition.root.traits.fetch(reference)
      else
        raise "Invalid reference"
      end
    end
  end
end
