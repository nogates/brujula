module Brujula
  module BasicTypeMixin
    attr_reader :parent, :name
  end

  class BasicType
    attr_reader :data, :as, :parent, :name

    def initialize(parent: nil, data:, name:, as:)
      @parent = parent
      @data   = data
      @name   = name
      @as     = as
    end

    def expand
      case as
      when :boolean, :number, :any
        data
      else
        base_class.new(normalized_data).tap do |instance|
          instance.extend(BasicTypeMixin)
          instance.define_singleton_method :parent do
            instance_variable_get("@parent")
          end
          instance.instance_variable_set("@name", name)
        end
      end
    end

    private

    def base_class
      Brujula::Raml::V1_0.const_get(Inflecto.camelize(as.to_s))
    end

    def normalized_data
      case as
      when :string
        data.to_s
      else
        data
      end
    end
  end
end
