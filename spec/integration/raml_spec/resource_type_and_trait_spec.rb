require 'spec_helper'

describe 'Resource Types and Traits RAML SPEC examples', type: :raml_spec do
  describe 'resource_type_and_trait_merging' do
    describe 'users resource' do
      let(:users) { raml.root.resources.fetch('/users') }

      describe 'get method, applies all the traits and resource type' do
        subject { users.methods.fetch('get') }

        its(:query_parameters) do
          is_expected.to have_item('numPages')
            .with_values(
              description: "The number of pages to return, not to exceed <<maxPages>>"
            )
        end

        its(:query_parameters) do
          is_expected.to have_item('sort')
            .with_values(
              enum: %w( asc desc )
            )
        end

        its(:responses) do
          is_expected.to have_item('429')
            .with_values(
              description: "Too many responses"
            )
        end

        its(:headers) do
          is_expected.to have_item('access_token')
            .with_values(
              description: "Access Token",
              example: "5757gh76",
              required: true
            )
        end
      end

      describe 'get method, applies only the resource trait' do
        subject { users.methods.fetch('post') }

        its(:query_parameters) { is_expected.to be nil }
        its(:responses)        { is_expected.to be nil }

        its(:headers) do
          is_expected.to have_item('access_token')
            .with_values(
              description: "Access Token",
              example: "5757gh76",
              required: true
            )
        end
      end
    end
  end
end
