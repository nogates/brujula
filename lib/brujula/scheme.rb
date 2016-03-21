module Brujula
  class Scheme
    attr_reader :keys, :typed, :default_type, :reference,
                :store_for_reference, :allow_any

    alias :typed? :typed
    alias :store_object_for_reference? :store_for_reference
    alias :allow_any? :allow_any

    def initialize(klass, options = {}, block = nil)
      @klass               = klass
      @options             = options
      @keys                = {}
      @typed               = !!options[:typed]
      @default_type        = options[:default_type] || :string
      @store_for_reference = !!options[:store_for_reference]
      @allow_any           = !!options[:allow_any]

      if options[:as]
        block = Brujula::Raml::V1_0.const_get(
          Inflecto.camelize(options[:as])
        ).block
      end

      instance_exec(&block)
    end

    def key_collection
      @keys.values
    end

    def validate_data!(data)
      valid_keys?(data) || raise(Brujula::Raml::RequiredProperty) # && enough_data?(data))
    end

    def typed_keys(type)
      keys.values.select do |brujula_key|
        brujula_key.valid_for_type?(type)
      end
    end

    private

    attr_reader :klass

    def key(name, options = {})
      store_key(name, options)
    end

    def valid_keys?(data)
      (ramelized_required_keys - data.keys).empty?
    end

    def ramelized_required_keys
      @ramelized_required_keys ||= keys_for_type.values
        .select(&:required?).select(&:fixed?)
        .map { |object| ramelize_key(object.expression) }
    end

    def keys_for_type
      return keys unless typed

      keys.select { |key| key.include_in_type?() }
    end

    def ramelize_key(key)
      Inflecto.ramelize(key.to_s)
    end

    def store_key(name, options)
      key = Brujula::Key.new(name, options)
      klass.class_eval { attr_reader key.accessor_name }

      @keys.merge!(key.accessor_name => key)
    end
  end
end
