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
          MapObjectMerger.new(merger_options).call
        when superinstance.is_a?(Brujula::Object)
          ObjectMerger.new(merger_options).call
        else
          superinstance.dup
        end
      end

      def merger_options
        {
          instance:      instance,
          superinstance: superinstance
        }
      end
    end
  end
end
