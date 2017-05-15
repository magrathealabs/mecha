require 'test_helper'
require 'mecha/generators/simplecov/simplecov_generator'

module Mecha
  module Generators
    class SimplecovGeneratorTest < BaseGeneratorTest
      tests Mecha::Generators::SimplecovGenerator

      test '.simplecov is created' do
        create_gemfile
        create_test_dir
        run_generator

        assert_file '.simplecov', /SimpleCov.start do/
        assert_file 'test/test_helper.rb', /require 'simplecov'/
      end
    end
  end
end
