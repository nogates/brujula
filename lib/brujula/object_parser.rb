module Brujula
  class ObjectParser
    class << self
      def call(definition:, data:, parent: :root)
        new(definition: definition, data: data, parent: parent).call
      end
    end

    attr_reader :definition, :args, :parent, :data

    def initialize(definition:, data:, parent: :root)
      @definition  = definition
      @parent      = parent
      @data        = data
    end

    def call
      return data if not_processable_external_data?

      scheme_keys.each do |key|
        object_instance = object_builder(key).call

        definition.instance_variable_set(
          "@#{ key.accessor_name }", object_instance
        )
      end
    end

    private

    def not_processable_external_data?
      external_data? && !data.parseable?
    end

    def normalized_data
      @normalized_data ||= apply_default_type(node_data)
    end

    def node_data
      return data unless external_data?

      data.load_external_data(definition.root.base_dir)
    end

    def apply_default_type(data)
      return data unless scheme.typed?
      return data if data.key?("type")

      data.merge("type" => scheme.default_type.to_s)
    end

    def external_data?
      data.is_a?(Brujula::YamlInclude)
    end

    def scheme
      @scheme ||= definition.class.scheme
    end

    def scheme_keys
      return scheme.key_collection unless scheme.typed?

      scheme.typed_keys(normalized_data.fetch('type'))
    end

    def object_builder(key)
      ObjectBuilder.new(definition: definition, data: normalized_data, key: key)
    end
  end
end
