require 'inflecto'
require 'pathname'

require_relative 'brujula/initializers/inflecto_ramelize'
require_relative 'brujula/initializers/yaml_include'

require_relative 'brujula/object_parser'
require_relative 'brujula/object_builder'
require_relative 'brujula/referrer'
require_relative 'brujula/scheme'
require_relative 'brujula/raml'
require_relative 'brujula/object'
require_relative 'brujula/map_object'
require_relative 'brujula/key'
require_relative 'brujula/basic_type'
require_relative 'brujula/raml/exceptions'

# parameters for trait and resource types
require_relative 'brujula/parameters/functions'
require_relative 'brujula/parameters/parser'
require_relative 'brujula/parameters/builder'

# data transformers
require_relative 'brujula/data_transformers/property_declaration'
require_relative 'brujula/data_transformers/security_scheme_settings_declaration'
require_relative 'brujula/data_transformers/body_declaration'

# mergers
require_relative 'brujula/mergers/merger'
require_relative 'brujula/mergers/object_merger'
require_relative 'brujula/mergers/map_object_merger'

# extenders
require_relative 'brujula/type_extender/resource'
require_relative 'brujula/type_extender/resource_type'
require_relative 'brujula/type_extender/method'

# Definitions
require_relative 'brujula/raml/definition'

# Types
require_relative 'brujula/raml/v1_0/array'
require_relative 'brujula/raml/v1_0/string'
require_relative 'brujula/raml/v1_0/markdown'
require_relative 'brujula/raml/v1_0/media_type'
require_relative 'brujula/raml/v1_0/uri_template'

# Objects
require_relative 'brujula/raml/v1_0/raml_type'
require_relative 'brujula/raml/v1_0/body_type'
require_relative 'brujula/raml/v1_0/property'
require_relative 'brujula/raml/v1_0/trait'
require_relative 'brujula/raml/v1_0/root'
require_relative 'brujula/raml/v1_0/header'
require_relative 'brujula/raml/v1_0/method'
require_relative 'brujula/raml/v1_0/body'
require_relative 'brujula/raml/v1_0/response'
require_relative 'brujula/raml/v1_0/resource'
require_relative 'brujula/raml/v1_0/resource_type'
require_relative 'brujula/raml/v1_0/query_parameter'
require_relative 'brujula/raml/v1_0/uri_parameter'
require_relative 'brujula/raml/v1_0/security_scheme_part'
require_relative 'brujula/raml/v1_0/security_scheme_settings'
require_relative 'brujula/raml/v1_0/security_scheme'
require_relative 'brujula/raml/v1_0/null_security_scheme'

module Brujula
  class << self
    def parse_file(file_path)
      Brujula::Raml::Definition.from_file(file_path)
    end

    def parse_string(string)
      Brujula::Raml::Definition.from_string(string)
    end
  end
end
