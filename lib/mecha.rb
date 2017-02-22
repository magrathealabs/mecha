require 'mecha/version'
require 'mecha/generators/app_generator'
require 'mecha/app_builder'

module Mecha
  def self.config_templates_path
    templates_path = File.expand_path(File.join('mecha', 'templates'), File.dirname(__FILE__))
    Mecha::AppGenerator.source_root(templates_path)
    Mecha::AppGenerator.source_paths << Rails::Generators::AppGenerator.source_root
    Mecha::AppGenerator.source_paths << templates_path
  end
end