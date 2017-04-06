require 'test_helper'
require 'mecha/generators/sentry/sentry_generator'

module Mecha
  module Generators
    class SentryGeneratorTest < BaseGeneratorTest
      tests Mecha::Generators::SentryGenerator

      test 'Sentry configs' do
        create_gemfile
        create_application_controller
        create_application_rb
        create_production_rb
        run_generator

        assert_file 'Gemfile', /gem 'sentry-raven'/
        assert_file 'config/application.rb', /Raven.configure do |config|/
        assert_file 'config/environments/production.rb', /config.action_dispatch.show_exceptions = false/
        assert_file 'app/controllers/application_controller.rb', /def set_raven_context/
        assert_file 'app/controllers/application_controller.rb', /before_action :set_raven_context/
      end
    end
  end
end
