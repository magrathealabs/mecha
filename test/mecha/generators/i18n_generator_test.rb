require 'test_helper'
require 'mecha/generators/i18n/i18n_generator'

module Mecha
  module Generators
    class I18nGeneratorTest < BaseGeneratorTest
      tests Mecha::Generators::I18nGenerator

      test 'i18n created locale files' do
        create_application_rb
        run_generator

        assert_file 'config/application.rb', /config\.i18n\.available_locales = \[\'pt-BR\', \'en\'\]/
        assert_no_file 'config/locales/en.yml'
      end
    end
  end
end
