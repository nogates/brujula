module Brujula
  module Parameters
    class Transformer

      attr_reader :parameters

      def initialize(parameters:)
        @parameters = parameters
      end

      def call(string)
        content = string.match(/<<(.*?)>>/)[1]

        apply_functions(content)
      end

      private

      def apply_functions(string)
        value, function_names = extract_functions(string)

        return value if function_names.empty?

        function_names.inject(value) do |result, function|
          call_function(result, function)
        end
      end

      def call_function(value, function)
        function_ref = get_function_name(function)

        send function_ref, value
      end

      def extract_functions(string)
        expression_chain = string.split('|')
        parameter_name   = expression_chain.first.strip
        value            = parameters.fetch(parameter_name)

        [ value, expression_chain[1..-1].map(&:strip) ]
      end

      def get_function_name(function)
        name = Inflecto.underscore(function).gsub(/^!/, '').to_sym

        return name if private_methods.include?(name)

        raise "Invalid trasformer function #{ function }"
      end

      def singularize(string)
        Inflecto.singularize(string)
      end

      def pluralize(string)
        Inflecto.pluralize(string)
      end

      def uppercase(string)
        string.upcase
      end

      def lowercase(string)
        string.downcase
      end

      def lowercamelcase(string)
        Inflecto.ramelize(string)
      end

      def uppercamelcase(string)
        Inflecto.camelize(string)
      end

      def lowerunderscorecase(string)
        Inflecto.underscore(string)
      end

      def upperunderscorecase(string)
        Inflecto.underscore(string).upcase
      end

      def lowerhyphencase(string)
        Inflecto.dasherize(Inflecto.underscore(string)).downcase
      end

      def upperhyphencase(string)
        Inflecto.dasherize(Inflecto.underscore(string)).upcase
      end
    end
  end
end
