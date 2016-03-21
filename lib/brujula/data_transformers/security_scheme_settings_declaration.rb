module Brujula
  module DataTransformers
    class SecuritySchemeSettingsDeclaration
      class << self
        def call(*args)
          new(*args).call
        end
      end

      attr_reader :data, :parent

      def initialize(parent, data)
        @parent = parent
        @data   = data
      end

      # Add the type from the parent and carry on
      def call
        data.merge("type" => parent.type)
      end
    end
  end
end
