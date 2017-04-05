require 'test_helper'
require 'mecha/generators/simplecov/simplecov_generator'

module Mecha
  module Generators
    class SimplecovGeneratorTest < BaseGeneratorTest
      tests Mecha::Generators::SimplecovGenerator

      test '.simplecov is created' do
        run_generator

        assert_file '.simplecov', /SimpleCov.start do/
      end
    end
  end
end
