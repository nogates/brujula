module Brujula
  module Raml
    module V1_0
      class Method < Brujula::Object
        scheme do
          key :display_name, as: :string
          key :description, as: :markdown
          key :query_parameters, as: :map_object, children: :query_parameter
          # key :query_string, as: :query_string TODO
          key :headers, as: :map_object, children: :header,
              data_transformer: :property_declaration
          key :responses, as: :map_object, children: :response
          key :body, as: :map_object, children: :body,
              data_transformer: :body_declaration
          key :protocols, as: :array
          key :is, as: :map_object, children: :trait, referrable: true
          key :secured_by, as: :map_object, referrable: true
        end
      end
    end
  end
end
