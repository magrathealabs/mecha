require 'test_helper'
require 'mecha/generators/rubocop/rubocop_generator'

module Mecha
  module Generators
    class RubocopGeneratorTest < BaseGeneratorTest
      tests Mecha::Generators::RubocopGenerator

      test '.rubocop.yml is created' do
        create_gemfile
        run_generator

        assert_file '.rubocop.yml', /Rails:\n  Enabled: true/
        assert_file 'Gemfile', /  gem 'rubocop'/
      end
    end
  end
end
