module Brujula
  module Raml
    module V1_0
      class SecuritySchemePart < Brujula::Object
        scheme do
          key :display_name, as: :string
          key :description, as: :markdown
          key :responses, as: :map_object, children: :response
          key :headers, as: :map_object, children: :header,
              data_transformer: :property_declaration
          key :query_parameters, as: :map_object, children: :query_parameter,
              data_transformer: :property_declaration
          key :query_string, as: :string
        end
      end
    end
  end
end
