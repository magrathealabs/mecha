require 'test_helper'
require 'mecha/generators/assets/assets_generator'

module Mecha
  module Generators
    class AssetsGeneratorTest < BaseGeneratorTest
      tests Mecha::Generators::AssetsGenerator

      test 'application.scss is created' do
        create_application_css
        create_application_rb
        run_generator

        assert_file "#{destination_root}/app/assets/stylesheets/application.scss"
        assert_no_file "#{destination_root}/app/assets/stylesheets/application.css"
        assert_file "#{destination_root}/config/application.rb", /config.assets.initialize_on_precompile = false/
      end
    end
  end
end
