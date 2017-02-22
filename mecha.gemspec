# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mecha/version'

Gem::Specification.new do |spec|
  spec.name          = 'mecha'
  spec.version       = Mecha::VERSION
  spec.authors       = ['Magrathea Labs']
  spec.email         = ['contact@magrathealabs.com']

  spec.summary       = 'Generate a Rails app using MLabs defaults.'
  spec.description   = 'Mecha is used by MLabs to bootstrap working apps with our defaults.'
  spec.homepage      = 'https://github.com/magrathealabs/mecha'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = Mecha::RUBY_VERSION

  spec.add_dependency 'rails', Mecha::RAILS_VERSION

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
