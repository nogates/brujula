require 'mime-types'

module Brujula
  module DataTransformers
    class BodyDeclaration
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

      def call
        case
        when keys_are_media_type?
          data
        else
          { default_media_type => data }
        end
      end

      private

      def keys_are_media_type?
        data.keys.all? { |key| MIME::Types[key].any? }
      end

      def default_media_type
        parent.root.media_type || raise('Default Media Type required')
      end
    end
  end
end
