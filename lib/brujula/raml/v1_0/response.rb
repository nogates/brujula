module Brujula
  module Raml
    module V1_0
      class Response < Brujula::Object
        scheme do
          key :display_name, as: :string
          key :description, as: :markdown
          key :headers, as: :map_object, children: :header,
              data_transformer: :property_declaration
          key :body, as: :map_object, children: :body,
              data_transformer: :body_declaration
        end
      end
    end
  end
end
