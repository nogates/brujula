# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brujula/version'

Gem::Specification.new do |spec|
  spec.name          = 'brujula'
  spec.version       = Brujula::VERSION
  spec.authors       = [ 'David Tapiador' ]
  spec.email         = [ 'nogates@singularities.org']
  spec.summary       = %q{ Yet another Ruby RAML parser aiming for version 1.0 fully support }
  spec.description   = %q{ Yet another Ruby RAML parser aiming for version 1.0 fully support }
  spec.homepage      = 'https://github.com/nogates/brujula'
  spec.license       = 'MIT'

  spec.files         = Dir[ 'Rakefile', 'Gemfile', 'lib/**/**', '*.md' ]
  spec.test_files    = spec.files.grep(%r{ ^(test|spec|features)/ })
  spec.require_paths = %w( lib )

  spec.add_dependency 'inflecto'
  spec.add_dependency 'mime-types'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'simplecov'
end
