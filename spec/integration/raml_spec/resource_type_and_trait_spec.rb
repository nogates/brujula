require 'spec_helper'

describe 'Resource Types and Traits RAML SPEC examples', type: :raml_spec do
  describe 'resource_type_and_traits_merging' do
    describe 'users resource' do
      let(:users) { raml.root.resources.fetch('/users') }

      describe 'get method, applies all the traits and resource type' do
        subject { users.methods.fetch('get') }

        its(:query_parameters) do
          is_expected.to have_item('numPages')
            .with_values(
              description: "The number of pages to return, not to exceed 10"
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

      describe 'post method, applies only the resource trait' do
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

  describe 'resource_type_and_traits_parameters' do
    describe '/books resource' do
      let(:books) { raml.root.resources.fetch('/books') }

      describe 'get method, applies all the traits and resource type' do
        subject { books.methods.fetch('get') }

        its(:query_parameters) do
          is_expected.to have_item('title').with_values(
            description: "Return books that have their title matching the given value"
          )
        end

        its(:query_parameters) do
          is_expected.to have_item('access_token').with_values(
            description: "A valid access_token is required"
          )
        end

        its(:query_parameters) do
          is_expected.to have_item('numPages').with_values(
            description: "The number of pages to return, not to exceed 10"
          )
        end
      end
    end
  end

  describe 'resource_type_and_traits_functions' do
    describe '/userId resource' do
      let(:userId) { raml.root.resources.fetch('/userId') }

      describe 'GET method' do
        subject { userId.methods.fetch('get') }

        its(:description) do
          is_expected.to eq <<-TXT.strip_heredoc
            This should cover all the functions:
            userId as userId
            userIds as userIds
            USERID as USERID
            userid as userid
            userId as userId
            UserId as UserId
            user_id as user_id
            USER_ID as USER_ID
            user-id as user-id
            USER-ID as USER-ID
            complex one user-id user-id

          TXT
        end
      end
    end
  end
end
