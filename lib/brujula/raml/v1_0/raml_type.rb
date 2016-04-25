module Brujula
  module Raml
    module V1_0
      class RamlType < Brujula::Object
        scheme typed: true, default_type: :object do
          key :type,   as: :any
          key :schema, as: :string, deprecated: true

          key :properties, as: :map_object, children: :property,
              data_transformer: :property_declaration

          key :description, as: :string
          key :display_name, as: :string
          key :default, as: :any
          key :required, as: :boolean
          key :example, as: :any
          key :examples, as: :any

          # When Property is integer
          key :minimum, as: :number, for_types: %w( number integer )
          key :maximum, as: :number, for_types: %w( number integer )
          key :format, as: :string,
              in: %w( int32 int64 int long float double int16 int8 )

          # When Property is string
          key :pattern, as: :regexp, for_types: %w( string )
          key :min_length, as: :number, for_types: %w( string )
          key :max_length, as: :number, for_types: %w( string )


          # include_type_keys

        end
      end
    end
  end
end
