require 'rails/generators'

module Mecha
  module Generators
    class TestsGenerator < Rails::Generators::AppBase
      class_option :rspec, type: :boolean, default: false, desc: 'Configure RSpec'
      source_root File.join(File.dirname(__FILE__), 'templates')

      def add_test_gems
        gem_group :test do
          gem 'database_rewinder'
          gem 'ruby-prof'
          gem 'timecop'
          gem 'vcr'
          gem 'webmock'
        end
      end

      def add_development_test_gems
        gem_group :development, :test do
          gem 'factory_bot_rails'
          gem 'faker'
          gem 'rspec-rails' if rspec?
          gem 'shoulda-matchers' if rspec?
        end
      end

      def test_files
        return if rspec?
        empty_directory_with_keep_file('test/support')
        copy_file('test/test_helper.rb', 'test/test_helper.rb', force: true)
      end

      def rspec_files
        return unless rspec?
        bundle_command('install')
        run('spring stop')
        generate('rspec:install')
        empty_directory('spec/support')
        copy_file('spec/support/factory_bot.rb', 'spec/support/factory_bot.rb', force: true)
        copy_file('spec/rails_helper.rb', 'spec/rails_helper.rb', force: true)
        copy_file('spec/spec_helper.rb', 'spec/spec_helper.rb', force: true)
        remove_file('test')
      end

      def say_warking
        message = <<-MESSAGE.strip_heredoc

          Please install Chrome driver `brew install chromedriver`.

        MESSAGE

        say message
      end

      private

      def rspec?
        options[:rspec].present?
      end
    end
  end
end
