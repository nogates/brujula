module Brujula
  module Raml
    class Definition
      class << self
        def from_file(file)
          new(content: File.read(file), base_dir: File.dirname(file))
        rescue Errno::ENOENT => exception
          $stderr.puts "** Invalid file path #{ file }"
          raise exception
        end

        def from_string(string)
          new(content: string, base_dir: Dir.pwd)
        end
      end

      attr_reader :raw_content, :yaml_content, :base_dir

      def initialize(content:, base_dir:)
        @base_dir    = Pathname.new(base_dir)
        @raw_content = content
      end

      def root
        @root ||= load_raml_objects
      end

      private

      # def validate_version! # TODO
      #   true
      # end

      def yaml_content
        @yaml_content ||= YAML.load(raw_content)
      end

      def load_raml_objects
        @raml_objects ||= Brujula::Raml::V1_0::Root.new(
          data: yaml_content, name: :root, base_dir: base_dir
        )
      end
    end
  end
end
