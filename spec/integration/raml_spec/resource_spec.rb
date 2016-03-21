require 'spec_helper'

describe 'Resource RAML SPEC examples', type: :raml_spec do
  describe 'resource_intro' do
    subject { raml.root }

    its(:resources) { is_expected.to have_item("/gists") }

    describe '/gists' do
      subject { raml.root.resources.fetch('/gists') }

      its(:display_name) { is_expected.to eq('Gists') }

      describe '/public' do
        subject do
          raml.root.resources.fetch('/gists').resources.fetch('/public')
        end

        its(:display_name) { is_expected.to eq('Public Gists') }
      end
    end
  end

  describe 'resource_computed_urls' do
    subject { raml.root }

    its(:resources) do
      is_expected.to have_item("/user").and have_item("/users")
    end

    describe '/users' do
      let(:users) { raml.root.resources.fetch('/users') }

      describe '/{userId}' do
        let(:userId) { users.resources.fetch('/{userId}') }

        describe '#uriParameters' do
          describe 'userId' do
            subject { userId.uri_parameters.fetch('userId') }

            its(:type) { is_expected.to eq('integer') }
          end
        end

        subject    { userId }

        its(:resources) do
          is_expected.to have_item("/followers")
            .and have_item("/following")
            .and have_item("/keys")
        end

        describe '#resources' do
          describe 'keyId' do
            let(:keyId) do
              userId.resources.fetch('/keys').resources.fetch('/{keyId}')
            end

            describe '#uriParameters' do
              describe 'keyId' do
                subject { keyId.uri_parameters.fetch('keyId') }

                its(:type) { is_expected.to eq('integer') }
              end
            end
          end
        end
      end
    end
  end
end
