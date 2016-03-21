module Brujula
  module Raml
    module V1_0
      class Resource < Brujula::Object
        scheme do
          key :display_name, as: :string
          key :description, as: :markdown
          key /^(get|patch|put|post|delete|options|header)$/,
              as: :map_object, children: :method, accessor: :methods
          key :is, as: :map_object, children: :trait, referrable: true
          key :type, as: :resource_type, referrable: true
          key :secured_by, as: :map_object, referrable: true
          key :uri_parameters, as: :map_object, children: :uri_parameter
          key /^\/(.*)/, as: :map_object, children: :resource, accessor: :resources
        end
      end
    end
  end
end
