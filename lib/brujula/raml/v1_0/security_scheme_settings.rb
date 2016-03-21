module Brujula
  module Raml
    module V1_0
      class SecuritySchemeSettings < Brujula::Object
        scheme typed: true do
          key :type,   as: :string

          # When security scheme is OAuth 1.0
          key :request_token_uri, as: :string, for_types: [ 'OAuth 1.0' ]
          key :token_credentials_uri, as: :string, for_types: [ 'OAuth 1.0' ]

          # When security scheme is OAuth 2.0
          key :access_token_uri, as: :string, for_types: [ 'OAuth 2.0' ]
          key :authorization_uri, as: :string, for_types: [ 'OAuth 2.0' ]
          key :authorization_grants, as: :array, for_types: [ 'OAuth 2.0' ]
          key :scopes, as: :array, for_types: [ 'OAuth 2.0' ]

          # When security scheme is either OAuth 1.0
          key :authorization_uri, as: :string, for_types: [ 'OAuth 1.0', 'OAuth 2.0' ]
        end
      end
    end
  end
end
