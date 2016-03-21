require 'pry'
require 'simplecov'
require 'rspec/its'

# Remove all tab and blank spaces between lines
class String
  def strip_heredoc
    self.lines.map(&:strip).join("\n")
  end
end

# Cucumber + Rspec should cover 100% of the gem. WIP
SimpleCov.minimum_coverage 95

require 'brujula'

def fixture_folder
  Pathname.new(__dir__).join('support', 'fixtures')
end

Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  config.before(:example, type: :raml_spec) do |example|
    example_fixture_name   = example.example_group.parent_groups[-2].description
    example_fixture_folder = fixture_folder.join('raml', 'raml_spec')
    example_fixture_data   = File.read(
      example_fixture_folder.join("#{ example_fixture_name }.raml")
    )
    example.example_group.let(:raml) do
      Brujula::Raml::Definition.new(
        content: example_fixture_data, base_dir: example_fixture_folder)
    end
  end
end
