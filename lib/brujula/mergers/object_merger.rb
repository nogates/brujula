module Brujula
  module Mergers
    class ObjectMerger
      attr_reader :superinstance, :instance

      def initialize(instance:, superinstance:)
        @superinstance = superinstance
        @instance      = instance
      end

      def call
        return superinstance.dup if instance.nil?
        instance.dup.tap do |object|
          each_inheritable_attributes do |name, attribute|
            original_item = object.instance_variable_get("@#{ name }")
            merged_item   = Merger.new(
              instance: original_item, superinstance: attribute
            ).call
            object.instance_variable_set("@#{ name }", merged_item)
          end
        end
      end

      def each_inheritable_attributes
        applicable_attributes.each do |name|
          next if superinstance.instance_variable_get(name).nil?
          string_name = name.to_s.gsub(/^@/, '')
          yield(string_name, superinstance.instance_variable_get(name))
        end
      end

      def applicable_attributes
        superinstance.instance_variables - excluded_attributes
      end

      def excluded_attributes
        %i( @parent @name @type )
      end
    end
  end
end
