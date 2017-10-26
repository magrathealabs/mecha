require 'rails/generators'

module Mecha
  module Generators
    class GuardGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), 'templates')

      def copy_guardfile
        copy_file('Guardfile', 'Guardfile')
      end

      def add_development_gems
        gem_group :development do
          gem 'guard', require: false
          gem 'guard-minitest', require: false
          gem 'guard-rails', require: false
          gem 'guard-rubocop', require: false
        end
      end
    end
  end
end
