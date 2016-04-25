module Brujula
  module Raml
    module V1_0
      class Property < Brujula::Object
        scheme typed: true do
          key :description, as: :string
          key :display_name, as: :string
          key :default, as: :any
          key :required, as: :boolean
          # key :scheme, as: :type

          key :type, as: :string
          key :example, as: :any
          key :examples, as: :any

          # when Property is not file
          key :enum, as: :array, unless_type_is: %w( file )

          # When Property is integer
          key :minimum, as: :number, for_types: %w( number integer )
          key :maximum, as: :number, for_types: %w( number integer )
          key :format, as: :string,
              in: %w( int32 int64 int long float double int16 int8 )

          # When Property is string
          key :pattern, as: :regexp, for_types: %w( string )
          key :min_length, as: :number, for_types: %w( string )
          key :max_length, as: :number, for_types: %w( string )

        end
      end
    end
  end
end
