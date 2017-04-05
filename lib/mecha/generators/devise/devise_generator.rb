require 'rails/generators'
require 'rails/generators/rails/app/app_generator'
require 'mecha/generators/app/app_builder'

module Mecha
  module Generators
    class DeviseGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), 'templates')

      def generate_devise
        gem('devise', '~> 4.2')
        say_status(:run, 'bundle install')

        generate('devise:install')
        generate('devise User')
        generate('devise:views')
      end

      def config_development_rb
        environment("config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }", env: 'development')
      end

      def config_application_controller
        inject_into_file(
          'app/controllers/application_controller.rb',
          "\n  before_action :authenticate_user!",
          before: "\nend"
        )
      end
    end
  end
end
