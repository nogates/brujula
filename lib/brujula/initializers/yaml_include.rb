require 'yaml'

# stolen from https://github.com/coub/raml_ruby/
module Brujula
  class YamlInclude
    attr_reader :path

    def init_with(coder)
      @path = coder.scalar
    end

    def load_external_data(base_dir)
      YAML.load external_data_content(base_dir)
    end

    def parseable?
      parseable_extensions.include?(path_extension)
    end

    private

    def external_data_content(base_dir)
      File.read(external_data_path(base_dir))
    end

    def external_data_path(base_dir)
      return path if path.start_with?('/') # absolute path reference

      File.join(base_dir, path)
    end

    def path_extension
      File.extname(path)
    end

    def parseable_extensions
      %w( .yaml .yml .raml )
    end
  end
end

YAML.add_tag '!include', Brujula::YamlInclude
