require 'rails/generators'

module Mecha
  module Generators
    class SentryGenerator < Rails::Generators::Base
      def add_gem
        gem 'sentry-raven'
      end

      def config_application_rb
        application(config_sentry)
        application('config.filter_parameters << :password')
        environment('config.action_dispatch.show_exceptions = false', env: 'production')
      end

      def config_application_controller
        inject_into_file(
          'app/controllers/application_controller.rb',
          application_controller_set_raven_context,
          before: "end"
        )

        inject_into_file(
          'app/controllers/application_controller.rb',
          application_controller_before_action,
          after: 'class ApplicationController < ActionController::Base'
        )
      end

      private

      def config_sentry
        <<-DOC
Raven.configure do |config|
      config.dsn = ENV['DNS'] || ''
      config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
      config.environments = ['staging', 'production']
    end
        DOC
      end

      def application_controller_before_action
        "\n  before_action :set_raven_context"
      end

      def application_controller_set_raven_context
        <<-DOC
\n  private

  def set_raven_context
    Raven.user_context(id: session[:current_user_id])
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
        DOC
      end
    end
  end
end
