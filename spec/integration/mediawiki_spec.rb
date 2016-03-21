require 'spec_helper'

RSpec.describe "MediaWiki API" do
  let(:fixture_folder) { Pathname.new(__dir__).join('..', 'support', 'fixtures', 'raml') }

  describe '.parse_file' do
    let(:fixture_file) { fixture_folder.join('mediawiki.raml') }

    subject { Brujula.parse_file(fixture_file).root }

    it "has the right title" do
      expect(subject).to have_accessor("title")
        .as(String).with_value("MediaWiki")
    end

    it "has the right version" do
      expect(subject).to have_accessor("version")
        .as(String).with_value("v1")
    end

    it "has the right base_uri" do
      expect(subject).to have_accessor("base_uri")
        .as(String).with_value("https://en.wikipedia.org/w/api.php")
    end

    it "has the right description" do
      description = [
        "The MediaWiki action API is a web service that provides convenient",
        "access to wiki features, data, and meta-data over HTTP, via a",
        "URL usually at api.php"
      ].join(" ")

      expect(subject).to have_accessor("description")
        .as(String).with_value(description)
    end

    it "has the right media_type" do
      expect(subject).to have_accessor("media_type")
        .as(String).with_value("application/json")
    end

    xit "has the right NormalizedItem type" do
      expect(subject).to have_raml_type("NormalizedItem")
        .as('object').with_properties
    end

    it "has the right root resources" do
      expect(subject.resources).to have_item("/")
    end

    describe 'Resource /' do
      let(:resource) { subject.resources.fetch("/") }

      it "has the right / GET method" do
        expect(resource.methods).to have_item("get").as(:method)
          .with_values(description: "Title normalization")
      end


      describe 'Method GET' do
        let(:method) { resource.fetch("get") }

        it "has the right action query parameter" do
          expect(resource.methods).to have_item("get").as(:method)
            .with_values(description: "Title normalization")
        end
      end
    end


    # /:
    #   get:
    #     description: Title normalization
    #     queryParameters:
    #       action:
    #         enum: [ query ]
    #       titles:
    #         enum: [ articleA|article_B ]
    #     responses:
    #       200:
    #         body:
    #           application/json:
    #             type: Normalization
    #   get:
    #     description: Missing and invalid titles
    #     queryParameters:
    #       action:
    #         enum: [query]
    #       titles:
    #         enum: [Doesntexist|Main%20Page|Talk]
    #       format:
    #         enum: [jsonfm]
    #     responses:
    #       200:
    #         body:
    #           application/json:
    #             type: QueryResult
    #   get:
    #     description: Resolving redirects
    #     queryParameters:
    #       action:
    #         enum: [query]
    #       titles:
    #         enum: [Doesntexist|Main%20Page|Talk]
    #       redirects:
    #     responses:
    #       200:
    #         body:
    #           application/json:
    #             type: RedirectsQuery
    #   get:
    #     description: Exporting pages
    #     queryParameters:
    #       action:
    #         enum: [query]
    #       titles:
    #         enum: [API]
    #       generator:
    #         enum: [templates]
    #       export:
    #     responses:
    #       200:
    #         body:
    #           application/json:
    #             type: ExportQuery



  end
end
