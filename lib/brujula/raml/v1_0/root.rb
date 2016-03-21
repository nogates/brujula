module Brujula
  module Raml
    module V1_0
      class Root < Brujula::Object
        scheme do
          key :title, as: :string
          key :description, as: :markdown
          key :version, as: :string
          key :base_uri, as: :uri_template
          key :base_uri_parameters, as: :query_parameter
          key :media_type, as: :media_type
          key :security_schemes, as: :map_object, children: :security_scheme
          key :secured_by, as: :map_object, referrable: true
          key :protocols, as: :map_object, children: :string
          key :types, as: :map_object, children: :raml_type
          key :resource_types, as: :map_object, children: :resource_type
          key :traits, as: :map_object, children: :trait
          key /^\/(.*)/, as: :map_object, children: :resource, accessor: :resources
        end

        attr_reader :base_dir

        def initialize(data:, name:, base_dir:)
          @base_dir = base_dir
          super(data: data, name: name)
        end
      end
    end
  end
end
