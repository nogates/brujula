module Brujula
  class Key
    attr_reader :expression, :required, :options, :for_types, :referrable,
                :data_transformer, :name

    alias_method :required?, :required
    alias_method :referrable?, :referrable

    def initialize(expression, options)
      @expression       = expression
      @name             = expression.to_s
      @options          = options
      @required         = !!options[:required]
      @referrable       = !!options[:referrable]
      @for_types        = options[:for_types] || []
      @data_transformer = options[:data_transformer]
    end

    def accessor_name
      options[:accessor] || expression
    end

    def fixed?
      expression.is_a?(Symbol)
    end

    def matches?(key_name)
      !(expression =~ key_name).nil?
    end

    def valid_for_type?(type)
      return true if for_types.empty?

      for_types.include?(type)
    end

    def basic_type?
      basic_types.include?(options[:as])
    end

    def basic_types
      %i( any array boolean markdown media_type number string uri_template )
    end
  end
end
