require 'test_helper'
require 'mecha/generators/devise/devise_generator'

module Mecha
  module Generators
    class DeviseGeneratorTest < BaseGeneratorTest
      tests Mecha::Generators::DeviseGenerator

      test 'generate Devise files' do
        create_devise_app_files
        run_generator([destination_root])

        assert_file "#{destination_root}/Gemfile", /gem 'devise', '~> 4.2'/
        assert_file "#{destination_root}/config/environments/development.rb",
                    /config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }/
        assert_file "#{destination_root}/app/controllers/application_controller.rb",
                    /\n  before_action :authenticate_user!/
      end
    end
  end
end
