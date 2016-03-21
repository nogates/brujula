module Brujula
  module Raml
    module V1_0
      class ResourceType < Brujula::Object
        scheme do
          key :display_name, as: :string
          key :description, as: :markdown
          key /^(get|patch|put|post|delete|options|header)[?]*$/,
              as: :map_object, children: :method, accessor: :methods
          key :type, as: :string
        end
      end
    end
  end
end
