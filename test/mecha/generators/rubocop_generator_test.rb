require 'test_helper'
require 'mecha/generators/rubocop/rubocop_generator'

module Mecha
  module Generators
    class RubocopGeneratorTest < BaseGeneratorTest
      tests Mecha::Generators::RubocopGenerator

      test '.rubocop.yml is created' do
        run_generator

        assert_file '.rubocop.yml', /Rails:\n  Enabled: true/
      end
    end
  end
end
