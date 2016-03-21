require 'spec_helper'

describe 'Root RAML SPEC examples', type: :raml_spec do
  describe 'github_v3' do
    subject                { raml.root }
    its(:title)            { is_expected.to eq('GitHub API') }
    its(:version)          { is_expected.to eq('v3') }
    its(:base_uri)         { is_expected.to eq('https://api.github.com') }
    its(:media_type)       { is_expected.to eq('application/json') }
    its(:security_schemes) { is_expected.to have_item('oauth_2_0') }
    its(:types)            { is_expected.to have_item('Gist') }
    its(:types)            { is_expected.to have_item('Gists') }
    its(:resource_types)   { is_expected.to have_item('collection') }
    its(:resources)        { is_expected.to have_item('/search') }
    its(:secured_by) do
      is_expected.to match_array [ Brujula::Raml::V1_0::SecurityScheme ]
    end
  end
end

# #%RAML 1.0
# title: GitHub API
# version: v3
# baseUri: https://api.github.com
# mediaType:  application/json
# securitySchemes:
#   - oauth_2_0: !include securitySchemes/oauth_2_0.raml
# types:
#     Gist:  !include types/gist.raml
#     Gists: !include types/gists.raml
# resourceTypes:
#   collection: !include types/collection.raml*/
# traits:
# securedBy: [ oauth_2_0 ]
# /search:
#   /code:
#     type: collection
#     get:
