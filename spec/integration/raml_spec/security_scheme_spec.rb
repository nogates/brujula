require 'spec_helper'

describe 'Root RAML SPEC examples', type: :raml_spec do
  describe 'security_scheme_intro' do
    describe 'security_scheme #oauth_2_0' do
      subject { raml.root.security_schemes.fetch('oauth_2_0') }

      its(:type)        { is_expected.to eq('OAuth 2.0') }
      its(:description) { is_expected.to eq <<-TXT.strip_heredoc }
        Dropbox supports OAuth 2.0 for authenticating all API requests.

      TXT

      describe '#described_by' do
        let(:described_by) do
          raml.root.security_schemes.fetch('oauth_2_0').described_by
        end

        describe '#headers' do
          describe 'Authorization' do
            subject { described_by.headers.fetch('Authorization') }

            its(:type)        { is_expected.to eq('string') }
            its(:description) { is_expected.to eq <<-TXT.strip_heredoc }
              Used to send a valid OAuth 2 access token. Do not use
              with the "access_token" query string parameter.

            TXT
          end
        end

        describe '#query_parameters' do
          describe 'access_token' do
            subject { described_by.query_parameters.fetch('access_token') }

            its(:type)        { is_expected.to eq('string') }
            its(:description) { is_expected.to eq <<-TXT.strip_heredoc }
              Used to send a valid OAuth 2 access token. Do not use together with
              the "Authorization" header

            TXT
          end
        end

        describe '#responses' do
          describe '401' do
            subject { described_by.responses.fetch(401) }

            its(:description) { is_expected.to eq <<-TXT.strip_heredoc }
              Bad or expired token. This can happen if the user or Dropbox
              revoked or expired an access token. To fix, you should re-
              authenticate the user.

            TXT
          end

          describe '403' do
            subject { described_by.responses.fetch(403) }

            its(:description) { is_expected.to eq <<-TXT.strip_heredoc }
              Bad OAuth request (wrong consumer key, bad nonce, expired
              timestamp...). Unfortunately, re-authenticating the user won't help here.

            TXT
          end
        end
      end

      describe '#settings' do
        subject { raml.root.security_schemes.fetch('oauth_2_0').settings }
        its(:authorization_uri) do
          is_expected.to eq('https://www.dropbox.com/1/oauth2/authorize')
        end
        its(:access_token_uri) do
          is_expected.to eq('https://api.dropbox.com/1/oauth2/token')
        end
        its(:authorization_grants) do
          is_expected.to eq %w( authorization_code refresh_token )
        end
      end
    end

    describe 'security_scheme #oauth_1_0' do
      subject { raml.root.security_schemes.fetch('oauth_1_0') }

      its(:type)        { is_expected.to eq('OAuth 1.0') }
      its(:description) { is_expected.to eq <<-TXT.strip_heredoc }
        OAuth 1.0 continues to be supported for all API requests, but OAuth 2.0 is now preferred.

      TXT

      describe '#settings' do
        subject { raml.root.security_schemes.fetch('oauth_1_0').settings }
        its(:request_token_uri) do
          is_expected.to eq('https://api.dropbox.com/1/oauth/request_token')
        end
        its(:authorization_uri) do
          is_expected.to eq('https://www.dropbox.com/1/oauth/authorize')
        end
        its(:token_credentials_uri) do
          is_expected.to eq('https://api.dropbox.com/1/oauth/access_token')
        end
      end
    end
  end

  describe 'security_scheme_basic_authorization' do
    describe 'security_scheme #basic' do
      subject { raml.root.security_schemes.fetch('basic') }

      its(:type) { is_expected.to eq('Basic Authentication') }
      its(:description) { is_expected.to eq <<-TXT.strip_heredoc }
        This API supports Basic Authentication.

      TXT
    end
  end

  describe 'security_scheme_digest' do
    describe 'security_scheme #digest' do
      subject { raml.root.security_schemes.fetch('digest') }

      its(:type) { is_expected.to eq('Digest Authentication') }
      its(:description) { is_expected.to eq <<-TXT.strip_heredoc }
        This API supports DigestSecurityScheme Authentication.

      TXT
    end
  end

  describe 'security_scheme_pass_through' do
    describe 'security_scheme #passthrough' do
      subject { raml.root.security_schemes.fetch('passthrough') }

      its(:type) { is_expected.to eq('Pass Through') }
      its(:description) { is_expected.to eq <<-TXT.strip_heredoc }
        This API supports Pass Through Authentication.

      TXT

      describe '#described_by' do
        let(:described_by) do
          raml.root.security_schemes.fetch('passthrough').described_by
        end

        describe '#headers' do
          describe 'api_key' do
            subject { described_by.headers.fetch('api_key') }

            its(:type)        { is_expected.to eq('string') }
          end
        end

        describe '#query_parameters' do
          describe 'query' do
            subject { described_by.query_parameters.fetch('query') }

            its(:type)        { is_expected.to eq('string') }
          end
        end
      end
    end
  end

  describe 'security_scheme_other' do
    describe 'security_scheme #custom_scheme' do
      subject { raml.root.security_schemes.fetch('custom_scheme') }

      its(:type) { is_expected.to eq('x-custom') }
      its(:description) { is_expected.to eq <<-TXT.strip_heredoc }
        A custom security scheme for authenticating requests.

      TXT

      describe '#described_by' do
        let(:described_by) do
          raml.root.security_schemes.fetch('custom_scheme').described_by
        end

        describe '#headers' do
          describe 'SpecialToken' do
            subject { described_by.headers.fetch('SpecialToken') }

            its(:type)        { is_expected.to eq('string') }
            its(:description) { is_expected.to eq <<-TXT.strip_heredoc }
              Used to send a custom token.

            TXT
          end
        end

        describe '#responses' do
          describe '401' do
            subject { described_by.responses.fetch(401) }

            its(:description) { is_expected.to eq <<-TXT.strip_heredoc }
              Bad token.

            TXT
          end
          describe '403' do
            subject { described_by.responses.fetch(403) }

            its(:name) { is_expected.to eq 403 }
          end
        end
      end
    end
  end

  describe 'security_scheme_applying' do
    describe '/users#GET' do
      let(:method) { raml.root.resources.fetch('/users').fetch('get') }

      pending "Need to implement merging mechanism for security schemes"
    end
  end
end
