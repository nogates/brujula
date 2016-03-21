module Brujula
  class MapObject
    include Enumerable

    attr_reader :parent, :name, :child_class

    def initialize(data:, parent: nil, name:, child_class:)
      @parent      = parent
      @name        = name
      @child_class = child_class
      @collection  = {}
      each_flatted_child(data) do |child_name, child_data|
        child_object = build_object(child_name, child_data)

        @collection.merge!(child_name.to_s => child_object)
      end
    end

    def key?(key)
      @collection.key?(key.to_s)
    end

    def [](key)
      @collection.fetch(key.to_s, nil)
    end

    def fetch(key)
      @collection.fetch(key.to_s)
    rescue KeyError => error
      $stderr.puts "Couldn't find item #{ key } in collection #{ name }"
      raise error
    end

    def merge(key, value)
      @collection.merge!(key.to_s => value)
    end

    def each
      @collection.values.each { |item| yield item }
    end

    def expand
      self
    end

    private

    def build_object(name, data)
      child_data = normalize_child_data(data)
      options    = { data: child_data, name: name, parent: self }
      object     = child_klass.new(options)
      apply_inheritance(object)
    end

    def child_klass
      Brujula::Raml::V1_0.const_get(Inflecto.camelize(child_class))
    end

    def normalize_child_data(data)
      return data unless data.is_a?(Brujula::YamlInclude)

      data.load_external_data(parent.root.base_dir)
    end

    def apply_inheritance(child)
      case child
      when Brujula::Raml::V1_0::Resource
        Brujula::TypeExtender::Resource.new(definition: child).call
      when Brujula::Raml::V1_0::Method
        Brujula::TypeExtender::Method.new(definition: child).call
      when Brujula::Raml::V1_0::ResourceType
        Brujula::TypeExtender::ResourceType.new(definition: child).call
      else
        child
      end
    end

    def each_flatted_child(data)
      flatten_children(data).each do |child_name, child_data|
        yield child_name, child_data
      end
    end

    def flatten_children(data)
      case data
      when Array
        data.each_with_object({}) do |child, children|
          child.each do |key, value|
            children.merge!(key => value)
          end
        end
      when Hash
        data
      else
        raise 'Invalid data for map_object'
      end
    end
  end
end
