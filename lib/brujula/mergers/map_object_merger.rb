module Brujula
  module Mergers
    class MapObjectMerger
      attr_reader :superinstance, :instance

      def initialize(instance:, superinstance:)
        @superinstance = superinstance
        @instance      = instance
      end

      def call
        return superinstance.dup if instance.nil?

        instance.dup.tap do |extended_instance|
          each_inheritable_items do |inherit_item|
            extended_instance.merge(inherit_item.name, inherit_item)
          end
        end
      end

      def each_inheritable_items
        superinstance.each do |inherit_item|

          merge_item = case item_reference(inherit_item.name)
          when :optional_to_optional
            instance.fetch(inherit_item.name)
          when :optional
            instance.fetch(inherit_item.name.gsub(/\?$/, ''))
          when :direct
            instance.key?(inherit_item.name) ?
              instance.fetch(inherit_item.name) : nil
          else
            next
          end

          yield merger(merge_item, inherit_item)
        end
      end

      def merger(merge_item, inherit_item)
        Merger.new(instance: merge_item, superinstance: inherit_item).call
      end

      def item_reference(key)
        case
        when optional_key?(key) && instance_has_optional_item?(key)
          :optional_to_optional
        when optional_key?(key) && instance_has_item?(key)
          :optional
        when !optional_key?(key)
          :direct
        end
      end

      def merge_item?(key)
        return true unless optional_key?(key)

        instance_has_item?(key) || instance_has_optional_item?(key)
      end

      def optional_key?(key)
        key.to_s.end_with?('?')
      end

      def instance_has_item?(key)
        item_names.include?(key.gsub(/\?$/, ''))
      end

      def instance_has_optional_item?(key)
        item_names.include?(key)
      end

      def item_names
        @item_names ||= instance.to_a.map(&:name)
      end
    end
  end
end
