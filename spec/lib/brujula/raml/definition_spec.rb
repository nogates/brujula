require 'spec_helper'

describe Brujula::Raml::Definition do

  describe '.from_file' do
    context 'when the file does not exists' do
      let(:file_path) { "/tmp/idontexist473847389473" }

      it 'raises an error and writes the error to the stderr' do
        expect($stderr).to receive(:puts)
          .with("** Invalid file path #{ file_path }")

        expect { described_class.from_file(file_path) }
          .to raise_error Errno::ENOENT
      end
    end
  end

  describe '.from_string' do
    let(:tmp_dir) { Dir.mktmpdir }
    let(:raml_string) do
      <<-RAML
      #% RAML 1.0
      title: Test api
      RAML
    end

    it 'parses a raml string correctly' do
      expect(described_class.from_string(raml_string).root.title)
        .to eq 'Test api'
    end

    it 'the definition has the expected path as base_dir' do
      Dir.chdir tmp_dir do
        # OSX expands sometimes the two folders differently, including /private
        expect(described_class.from_string(raml_string).base_dir.to_s)
          .to include(tmp_dir)
      end
    end
  end
end
