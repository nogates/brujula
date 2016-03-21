require 'spec_helper'

RSpec.describe "Github API" do
  let(:fixture_folder) { Pathname.new(__dir__).join('..', 'support', 'fixtures', 'raml') }

  describe '.parse_file' do
    let(:fixture_file) { fixture_folder.join('github.raml') }

    def self.root
      @root ||= Brujula.parse_file(
        File.join(__dir__, '..', 'support', 'fixtures', 'raml', 'github.raml')
      ).root
    end

    def root
      self.class.root
    end

    it "has the right title" do
      expect(root).to have_accessor("title")
        .as(String).with_value("GitHub API")
    end

    it "has the right version" do
      expect(root).to have_accessor("version")
        .as(String).with_value("v3")
    end

    it "has the right base_uri" do
      expect(root).to have_accessor("base_uri")
        .as(String).with_value("https://api.github.com")
    end

    it "has the right security_schemes" do
      expect(root.security_schemes).to have_item("oauth_2_0")
        .as(:security_scheme)
    end

    describe 'security_schemes#oauth_2_0' do
      let(:security_scheme) { root.security_schemes.fetch("oauth_2_0") }

      it 'has the right description' do
        description = <<-TXT.lines.map(&:strip).join("\n")
          OAuth2 is a protocol that lets external apps request authorization to private
          details in a user's GitHub account without getting their password. This is
          preferred over Basic Authentication because tokens can be limited to specific
          types of data, and can be revoked by users at any time.

        TXT

        expect(security_scheme).to have_accessor('description')
          .as(String).with_value(description)
      end

      it 'has the right type' do
        expect(security_scheme).to have_accessor('type')
          .as(String).with_value('OAuth 2.0')
      end

      it 'has the right security_scheme part' do
        expect(security_scheme).to have_accessor('described_by')
          .as(:security_scheme_part)
      end

      describe '#described_by' do
        let(:described_by) { security_scheme.described_by }

        it 'has the right headers' do
          description = <<-TXT.lines.map(&:strip).join("\n")
            Used to send a valid OAuth 2 access token. Do not use together with
            the "access_token" query string parameter.

          TXT

          expect(described_by.headers).to have_item("Authorization")
            .with_values(description: description, type: 'string')
        end

        it 'has the right query parameters' do
          description = <<-TXT.lines.map(&:strip).join("\n")
            Used to send a valid OAuth 2 access token. Do not use together with
            the "Authorization" header

          TXT

          expect(described_by.query_parameters).to have_item("access_token")
            .with_values(description: description, type: 'string')
        end

        it 'has the right responses' do
          expect(described_by.responses).to have_item(404)
            .with_values(description: 'Unauthorized')
        end
      end

      it 'has the right settings' do
        expect(security_scheme).to have_accessor('settings')
          .as(:security_scheme_settings)
      end

      describe '#settings' do
        let(:settings) { security_scheme.settings }

        it 'has the right authorization uri' do
          expect(settings).to have_accessor('authorization_uri')
            .with_value('https://github.com/login/oauth/authorize')
        end

        it 'has the right access token uri' do
          expect(settings).to have_accessor('access_token_uri')
            .with_value('https://github.com/login/oauth/access_token')
        end

        it 'has the right authorization grants' do
          expect(settings).to have_accessor('authorization_grants')
            .with_value(%w( code ))
        end

        it 'has the right scopes' do
          expect(settings).to have_accessor('scopes').with_value(
            %w( user user:email user:follow public_repo repo repo:status
                delete_repo notifications gist )
          )
        end
      end
    end

    it 'has one secured_by reference' do
      expect(root.secured_by.count).to be 1
    end

    it 'has the right secured_by reference' do
      expect(root.secured_by).to have_accessor('first')
        .as(:security_scheme).with_values(type: 'OAuth 2.0')
    end

    it 'has the right media type' do
      expect(root).to have_accessor('media_type')
        .as(String).with_value('application/json')
    end

    it 'has a resource type `base`' do
      expect(root.resource_types).to have_item('base').as(:resource_type)
    end

    describe 'resource_type #base' do
      let(:resource_type) { root.resource_types.fetch('base') }

      %w( get? post? patch? put? delete? ).each do |verb|
        describe "has a optional method #{ verb }" do
          let(:method) { resource_type.methods.fetch(verb) }

          it 'has a `X-GitHub-Media-Type` header' do
            description = "You can check the current version of media type in responses.\n"

            expect(method.headers).to have_item("X-GitHub-Media-Type")
              .as(:header).with_values(description: description, type: 'string')
          end

          it 'has a `Accept` header' do
            description = "Is used to set specified media type."

            expect(method.headers).to have_item("Accept")
              .as(:header).with_values(description: description, type: 'string')
          end

          it 'has a `X-RateLimit-Limit` header' do
            expect(method.headers).to have_item("X-RateLimit-Limit")
              .as(:header).with_values(type: 'integer')
          end

          it 'has a `X-RateLimit-Remaining` header' do
            expect(method.headers).to have_item("X-RateLimit-Remaining")
              .as(:header).with_values(type: 'integer')
          end

          it 'has a `X-RateLimit-Reset` header' do
            expect(method.headers).to have_item("X-RateLimit-Reset")
              .as(:header).with_values(type: 'integer')
          end

          it 'has a `X-GitHub-Request-Id` header' do
            expect(method.headers).to have_item("X-GitHub-Request-Id")
              .as(:header).with_values(type: 'integer')
          end

          it 'has a 403 response' do
            description = <<-TXT.lines.map(&:strip).join("\n")
              API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
              for details.

            TXT
            expect(method.responses).to have_item(403)
              .as(:response).with_values(description: description)
          end
        end
      end

      # Next type. Merge types!
    end

    it 'has a `historial` trait' do
      expect(root.traits).to have_item('historical').as(:trait)
    end

    describe 'traits #historical' do
      let(:trait) { root.traits.fetch('historical') }

      it 'has a `since` query_parameter' do
        expect(trait.query_parameters).to have_item('since')
          .as(:query_parameter).with_values(
            description: <<-TXT.lines.map(&:strip).join("\n"),
              Timestamp in ISO 8601 format YYYY-MM-DDTHH:MM:SSZ.
              Only gists updated at or after this time are returned.

            TXT
            type: 'string'
          )
      end
    end

    it 'has a `filterable` trait' do
      expect(root.traits).to have_item('filterable').as(:trait)
    end

    describe 'traits #filterable' do
      let(:trait) { root.traits.fetch('filterable') }

      it 'has a `filter` query_parameter' do
        expect(trait.query_parameters).to have_item('filter')
          .as(:query_parameter).with_values(
            description: <<-TXT.lines.map(&:strip).join("\n"),
              Issues assigned to you / created by you / mentioning you / you're
              subscribed to updates for / All issues the authenticated user can see

            TXT
            enum: %w( assigned created mentioned subscribed all ),
            default: 'all',
            required: true
          )
      end

      it 'has a `state` query_parameter' do
        expect(trait.query_parameters).to have_item('state')
          .as(:query_parameter).with_values(
            enum: %w( open closed ),
            default: 'open',
            required: true
          )
      end

      it 'has a `labels` query_parameter' do
        description = <<-TXT.strip
          String list of comma separated Label names. Example - bug,ui,@high.
        TXT

        expect(trait.query_parameters).to have_item('labels')
          .as(:query_parameter).with_values(
            description: description,
            type:        'string',
            required:    true
          )
      end

      it 'has a `sort` query_parameter' do
        expect(trait.query_parameters).to have_item('sort')
          .as(:query_parameter).with_values(
            enum:     %w( created updated comments ),
            default:  'created',
            required: true
          )
      end

      it 'has a `direction` query_parameter' do
        expect(trait.query_parameters).to have_item('direction')
          .as(:query_parameter).with_values(
            enum:     %w( asc desc ),
            default:  'desc',
            required: true
          )
      end

      it 'has a `since` query_parameter' do
        description = <<-TXT.lines.map(&:strip).join("\n")
          Optional string of a timestamp in ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ.
          Only issues updated at or after this time are returned.

        TXT

        expect(trait.query_parameters).to have_item('since')
          .as(:query_parameter).with_values(
            description: description,
            type:        'string'
          )
      end
    end

    it "has a root /search resource" do
      expect(root.resources).to have_item('/search').as(:resource)
    end

    describe '/search resource' do
      let(:resource) { root.resources.fetch('/search') }

      it 'has a /repositories resource' do
        expect(resource.resources).to have_item('/repositories').as(:resource)
      end

      describe '/repositories' do
        let(:child_resource) { resource.resources.fetch('/repositories') }

        it 'has the right type' do
          expect(child_resource).to have_accessor('type')
            .as(:resource_type).with_values(name: 'collection')
        end

        it 'has a `get` method' do
          expect(child_resource.methods).to have_item('get').as(:method)
        end

        describe 'GET' do
          let(:method) { child_resource.methods.fetch('get') }

          it 'has a `q` query parameter' do
            description = <<-TXT.lines.map(&:strip).join("\n")
              The search terms. This can be any combination of the supported repository
              search parameters:
              'Search In' Qualifies which fields are searched. With this qualifier you
              can restrict the search to just the repository name, description, readme,
              or any combination of these.
              'Size' Finds repositories that match a certain size (in kilobytes).
              'Forks' Filters repositories based on the number of forks, and/or whether
              forked repositories should be included in the results at all.
              'Created' and 'Last Updated' Filters repositories based on times of
              creation, or when they were last updated.
              'Users or Repositories' Limits searches to a specific user or repository.
              'Languages' Searches repositories based on the language they're written in.
              'Stars' Searches repositories based on the number of stars.

            TXT

            expect(method.query_parameters).to have_item('q')
              .as(:query_parameter).with_values(
                description: description,
                type:        'string',
                required:    true
              )
          end

          it 'has a `sort` query parameter' do
            expect(method.query_parameters).to have_item('sort')
              .as(:query_parameter).with_values(
                description: 'If not provided, results are sorted by best match.',
                enum:        %w( stars forks updated )
              )
          end

          it 'has a `order` query parameter' do
            expect(method.query_parameters).to have_item('order')
              .as(:query_parameter).with_values(
                enum:        %w( asc desc ),
                default:     'desc'
              )
          end

          it 'has a `X-GitHub-Media-Type` headers' do
            expect(method.headers).to have_item('X-GitHub-Media-Type')
              .as(:header).with_values(
                description: <<-TXT.lines.map(&:strip).join("\n"),
                You can check the current version of media type in responses.

                TXT
                type: 'string'
              )
          end
        end
      end

      it "has a root /code resource" do
        expect(resource.resources).to have_item('/code').as(:resource)
      end

      describe '/code Resource' do
        let(:child_resource) { resource.resources.fetch('/code') }

        it "has the right type" do
          expect(child_resource).to have_accessor('type').as(:resource_type)
            .with_values(name: 'collection')
        end

        it 'has a GET method' do
          expect(child_resource.methods).to have_item('get').as(:method)
        end

        describe 'GET method' do
          let(:method) { child_resource.methods.fetch('get') }

          it 'has a `q` query parameter' do
            expect(method.query_parameters).to have_item('q')
              .as(:query_parameter).with_values(
                description: <<-TXT.lines.map(&:strip).join("\n"),
                  The search terms. This can be any combination of the supported code
                  search parameters:
                  'Search In' Qualifies which fields are searched. With this qualifier
                  you can restrict the search to just the file contents, the file path,
                  or both.
                  'Languages' Searches code based on the language it's written in.
                  'Forks' Filters repositories based on the number of forks, and/or
                  whether code from forked repositories should be included in the results
                  at all.
                  'Size' Finds files that match a certain size (in bytes).
                  'Path' Specifies the path that the resulting file must be at.
                  'Extension' Matches files with a certain extension.
                  'Users' or 'Repositories' Limits searches to a specific user or repository.

                TXT
                type: 'string',
                required: true
              )
          end

          it 'has a `sort` query parameter' do
            expect(method.query_parameters).to have_item('sort')
              .as(:query_parameter).with_values(
                description: <<-TXT.lines.map(&:strip).join("\n"),
                  Can only be 'indexed', which indicates how recently a file has been indexed
                  by the GitHub search infrastructure. If not provided, results are sorted
                  by best match.

                TXT
                enum: %w( indexed )
              )
          end

          it 'has a `order` query parameter' do
            expect(method.query_parameters).to have_item('order')
              .as(:query_parameter).with_values(
                enum: %w( asc desc ),
                default: 'desc'
              )
          end

          it 'has a `X-GitHub-Media-Type` header' do
            description = "You can check the current version of media type in responses.\n"

            expect(method.headers).to have_item("X-GitHub-Media-Type")
              .as(:header).with_values(description: description, type: 'string')
          end

          it 'has a `Accept` header' do
            description = "Is used to set specified media type."

            expect(method.headers).to have_item("Accept")
              .as(:header).with_values(description: description, type: 'string')
          end

          it 'has a `X-RateLimit-Limit` header' do
            expect(method.headers).to have_item("X-RateLimit-Limit")
              .as(:header).with_values(type: 'integer')
          end

          it 'has a `X-RateLimit-Remaining` header' do
            expect(method.headers).to have_item("X-RateLimit-Remaining")
              .as(:header).with_values(type: 'integer')
          end

          it 'has a `X-RateLimit-Reset` header' do
            expect(method.headers).to have_item("X-RateLimit-Reset")
              .as(:header).with_values(type: 'integer')
          end

          it 'has a `X-GitHub-Request-Id` header' do
            expect(method.headers).to have_item("X-GitHub-Request-Id")
              .as(:header).with_values(type: 'integer')
          end

          it 'has a 403 response' do
            description = <<-TXT.lines.map(&:strip).join("\n")
              API rate limit exceeded. See http://developer.github.com/v3/#rate-limiting
              for details.

            TXT

            expect(method.responses).to have_item(403)
              .as(:response).with_values(description: description)
          end

          it 'has a 200 response' do
            expect(method.responses).to have_item(200).as(:response)
          end
        end
      end
    end

#dejdeiodheiodheidhiehd


    it "has a root /events resource" do
      expect(root.resources).to have_item('/events').as(:resource)
    end

    describe '/events resource' do
      let(:resource) { root.resources.fetch('/events') }

      it 'has the right type' do
        expect(resource).to have_accessor('type').as(:resource_type)
      end

      it 'has a GET method' do
        expect(resource.methods).to have_item('get').as(:method)
          .with_values(description: 'List public events.')
      end

      describe 'GET method' do
        let(:method) { resource.methods.fetch('get') }

        it 'has a 200 response' do
          expect(method.responses).to have_item(200).as(:response)
        end

        describe 'Response 200' do
          let(:response) { method.responses.fetch(200) }

          it 'has the correct schema' do
            # binding.pry
          end
        end
      end
    end

    it "has a root /issues resource" do
      expect(root.resources).to have_item('/issues').as(:resource)
    end

    describe '/issues resource' do
      let(:resource) { root.resources.fetch('/issues') }

      it 'has the right type' do
        expect(resource).to have_accessor('type').as(:resource_type)
          .with_values(name: 'item')
      end

      it 'has a get method' do
        expect(resource.methods).to have_item('get').as(:method)
      end

      describe 'GET method' do
        let(:method) { resource.methods.fetch('get') }

        it 'has the right trait' do
          expect(method).to have_accessor('is.first').as(:trait)
            .with_values(name: 'filterable')
        end

        it 'has a `filter` query parameter' do
          expect(method.query_parameters).to have_item('filter')
            .with_values(
              description: <<-TXT.lines.map(&:strip).join("\n"),
                Issues assigned to you / created by you / mentioning you / you're
                subscribed to updates for / All issues the authenticated user can see

              TXT
              enum: %w( assigned created mentioned subscribed all ),
              default: 'all'
            )
        end

        it 'has a `state` query parameter' do
          expect(method.query_parameters).to have_item('state')
            .with_values(
              enum: %w( open closed ),
              default: 'open',
              required: true
            )
        end

        it 'has a `labels` query parameter' do
          expect(method.query_parameters).to have_item('labels')
            .with_values(
              description: 'String list of comma separated Label names. Example - bug,ui,@high.',
              type: 'string',
              required: true
            )
        end

        it 'has a `sort` query parameter' do
          expect(method.query_parameters).to have_item('sort')
            .with_values(
              enum: %w( created updated comments ),
              default: 'created',
              required: true
            )
        end

        it 'has a `direction` query parameter' do
          expect(method.query_parameters).to have_item('direction')
            .with_values(
              enum: %w( asc desc ),
              default: 'desc',
              required: true
            )
        end

        it 'has a `since` query parameter' do
          expect(method.query_parameters).to have_item('since')
            .with_values(
            description: <<-TXT.lines.map(&:strip).join("\n"),
              Optional string of a timestamp in ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ.
              Only issues updated at or after this time are returned.

            TXT
              type: 'string',
            )
        end

        it 'has the right description' do
          expect(method).to have_accessor('description').as(String).with_value(
            <<-TXT.lines.map(&:strip).join("\n"),
              List issues.
              List all issues across all the authenticated user's visible repositories.

            TXT
          )
        end

        it 'has a 200 response' do
          expect(method.responses).to have_item(200).as(:response)
        end

        describe '200 Response' do
          let(:response) { method.responses.fetch(200) }

          it 'has an application/json body' do
            expect(response.body).to have_item("application/json").as(:body)
          end

          describe 'application/json body' do
            let(:body) { response.body.fetch('application/json') }

            it 'has the expected scheme' do
              expect(body).to have_accessor("schema").as(String)
            end

            it 'has the expected example' do
              expect(body).to have_accessor("example").as(String)
            end
          end
        end
      end
    end
  end
end
