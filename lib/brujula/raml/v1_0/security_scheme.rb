module Brujula
  module Raml
    module V1_0
      class SecurityScheme < Brujula::Object
        scheme do
          key :type, as: :string, required: true
          key :description, as: :markdown
          key :described_by, as: :security_scheme_part
          key :settings, as: :security_scheme_settings,
              data_transformer: :security_scheme_settings_declaration
        end
      end
    end
  end
end
