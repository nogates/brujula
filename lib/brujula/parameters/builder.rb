module Brujula
  module Parameters
    class Builder

      attr_reader :object

      def initialize(object:)
        @object  = object
      end

      def resource_params(resource)
        object_parameters.merge(resource_parameters(resource))
      end

      def method_params(resource, method)
        object_parameters.merge(
          resource_parameters(resource)
        ).merge(
          method_parameters(method)
        )
      end

      private

      def object_parameters
        object.instance_variable_get("@parameters") || {}
      end

      def method_parameters(method)
        {
          "methodName" => method.name,
        }
      end

      def resource_parameters(resource)
        {
          "resourcePath"     => resource_path(resource),
          "resourcePathName" => resource_path_name(resource)
        }
      end

      def resource_path(resource)
        resource.name
      end

      def resource_path_name(resource)
        resource.name.split('/').last.gsub(/[\{\}]/, "")
      end
    end
  end
end
