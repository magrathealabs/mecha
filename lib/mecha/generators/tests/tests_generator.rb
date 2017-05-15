require 'rails/generators'

module Mecha
  module Generators
    class TestsGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), 'templates')

      def add_test_gems
        gem_group :test do
          gem 'capybara'
          gem 'database_rewinder'
          gem 'poltergeist'
          gem 'ruby-prof'
          gem 'timecop'
          gem 'webmock'
        end
      end

      def add_development_test_gems
        gem_group :development, :test do
          gem 'factory_girl_rails'
          gem 'faker'
        end
      end

      def test_files
        directory('test/support', 'test/support')
        copy_file('test/test_helper.rb', 'test/test_helper.rb', force: true)
      end
    end
  end
end
