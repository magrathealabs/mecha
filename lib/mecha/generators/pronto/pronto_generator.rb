require 'rails/generators'

module Mecha
  module Generators
    class ProntoGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), 'templates')

      class_option :simplecov, type: 'boolean', default: false

      def copy_reek
        copy_file('reek', '.reek')
      end

      def copy_flayignore
        copy_file('flayignore', '.flayignore')
      end

      def add_pronto_gems
        gem_group :development, :test do
          gem 'brakeman', require: false
          gem 'bullet', require: false
          gem 'fasterer', require: false
          gem 'flay', require: false
          gem 'rails_best_practices', require: false
          gem 'reek', require: false

          gem 'pronto'
          gem 'pronto-brakeman', require: false
          gem 'pronto-fasterer', require: false
          gem 'pronto-flay', require: false
          gem 'pronto-rails_best_practices', require: false
          gem 'pronto-rails_schema', require: false
          gem 'pronto-reek', require: false
          gem 'pronto-rubocop', require: false
          gem('pronto-simplecov', require: false) if options[:simplecov]
        end
      end

      def add_bullet_config
        config = <<-CONFIG.strip_heredoc
          config.after_initialize do
            Bullet.enable = true
            Bullet.alert = false
            Bullet.bullet_logger = true
            Bullet.console = true
            Bullet.rails_logger = true
            Bullet.add_footer = true
          end
        end
        CONFIG

        application(config, env: 'development')
      end

      def say_config_message
        message = <<-MESSAGE.strip_heredoc

          If you want to use Pronto in your CI, please config the needed environment variables. Bellow is an example:

          PRONTO_GITHUB_ACCESS_TOKEN: XXX
          PRONTO_PULL_REQUEST_ID: "$(echo $CIRCLE_PULL_REQUEST | grep -o -E '[0-9]+')"
          PRONTO_GITHUB_SLUG: "${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}"
          PRONTO_FORMAT: "%{msg} [%{runner}:%{level}]"
          PRONTO_VERBOSE: true

          Take a look in the project documentation https://github.com/prontolabs/pronto

        MESSAGE

        say message
      end
    end
  end
end
