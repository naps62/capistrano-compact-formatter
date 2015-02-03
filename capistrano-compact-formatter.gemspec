# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano-compact-formatter/version'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-compact-formatter'
  spec.version       = CapistranoCompactFormatter::VERSION
  spec.authors       = ['Miguel Palhas']
  spec.email         = ['mpalhas@gmail.com']
  spec.summary       = %q{A compact formatter for capistrano 3}
  spec.description   = %q{A compact formatter for capistrano 3}
  spec.homepage      = 'https://github.com/naps62/capistrano-compact-formatter'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'sshkit', '~> 1.3'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
