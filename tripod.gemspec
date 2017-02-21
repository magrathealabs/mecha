# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tripod/version'

Gem::Specification.new do |spec|
  spec.name          = 'tripod'
  spec.version       = Tripod::VERSION
  spec.authors       = ['Magrathea Labs']
  spec.email         = ['support@magrathealabs.com']

  spec.summary       = 'Generate a Rails app using MLabs defaults.'
  spec.description   = 'Tripod is used by MLabs to bootstrap working apps with our defaults.'
  spec.homepage      = 'https://github.com/magrathealabs/tripod'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = Tripod::RUBY_VERSION

  spec.add_dependency 'rails', Tripod::RAILS_VERSION

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
