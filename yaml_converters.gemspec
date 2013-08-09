# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yaml_converters/version'

Gem::Specification.new do |gem|
  gem.name          = 'yaml_converters'
  gem.version       = YamlConverters::VERSION
  gem.authors       = ['Tomek Wałkuski']
  gem.email         = ['ja@jestem.tw']
  gem.description   = %q{Convert YAML to segments and back}
  gem.summary       = %q{Convert YAML to segments and back}
  gem.homepage      = 'https://github.com/tomekw/yaml_converters'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency('activesupport')
  gem.add_dependency('psych', '>= 1.3.3')

  gem.add_development_dependency('growl')
  gem.add_development_dependency('guard-rspec')
  gem.add_development_dependency('rake')
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('simplecov')
end
