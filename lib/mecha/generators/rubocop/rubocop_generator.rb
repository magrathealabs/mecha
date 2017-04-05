require 'rails/generators'

module Mecha
  module Generators
    class RubocopGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), 'templates')

      def copy_rubocop
        copy_file('rubocop.yml', '.rubocop.yml')
      end

      def add_development_gems
        gem_group :development do
          gem 'rubocop', require: false
        end
      end
    end
  end
end
