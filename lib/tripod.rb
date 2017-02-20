require 'tripod/version'
require 'tripod/generators/app_generator'
require 'tripod/app_builder'

module Tripod
  def self.config_templates_path
    templates_path = File.expand_path(File.join('tripod', 'templates'), File.dirname(__FILE__))
    Tripod::AppGenerator.source_root(templates_path)
    Tripod::AppGenerator.source_paths << Rails::Generators::AppGenerator.source_root
    Tripod::AppGenerator.source_paths << templates_path
  end
end
