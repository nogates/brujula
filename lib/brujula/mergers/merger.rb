module Brujula
  module Mergers
    class Merger
      attr_reader :superinstance, :instance

      def initialize(instance:, superinstance:)
        @superinstance = superinstance
        @instance      = instance
      end

      def call
        case
        when superinstance.is_a?(Brujula::MapObject)
          MapObjectMerger.new(
            instance: instance, superinstance: superinstance
          ).call
        when superinstance.is_a?(Brujula::Object)
          ObjectMerger.new(
            instance: instance, superinstance: superinstance
          ).call
        else
          superinstance.dup
        end
      end
    end
  end
end
