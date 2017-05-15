require 'test_helper'
require 'mecha/generators/tests/tests_generator'

module Mecha
  module Generators
    class TestsGeneratorTest < BaseGeneratorTest
      tests Mecha::Generators::TestsGenerator

      test 'create tests files' do
        create_gemfile
        run_generator

        assert_file 'Gemfile', /  gem 'capybara'/
        assert_file 'Gemfile', /  gem 'faker'/
        assert_file 'test/test_helper.rb', /    include FactoryGirl::Syntax::Methods/
      end
    end
  end
end
