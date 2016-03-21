module Brujula
  module Raml
    module V1_0
      class Trait < Brujula::Object
        scheme do
          key :usage, as: :markdown
          key :description, as: :markdown
          # key :parameters
          key :query_parameters, as: :map_object, children: :query_parameter
          key :headers, as: :map_object, children: :header,
              data_transformer: :property_declaration
          key :responses, as: :map_object, children: :response
        end
      end
    end
  end
end
