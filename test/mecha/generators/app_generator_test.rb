require 'test_helper'
require 'mecha/generators/app/app_generator'

module Mecha
  module Generators
    class AppGeneratorTest < BaseGeneratorTest
      tests Mecha::Generators::AppGenerator

      test 'app is created' do
        run_generator([destination_root])

        assert_file 'README.md', /# Tmp/
        assert_file 'Gemfile', /  gem 'pry'/
        assert_file '.gitignore', /.DS_Store/

        assert_file 'config/database.example.yml', /database: tmp_test/
        assert_file 'config/database.example.yml', /database: tmp_development/
        assert_file 'config/database.example.yml', /database: tmp_production/
        assert_file 'config/database.yml', /database: tmp_test/
        assert_file 'config/database.yml', /database: tmp_development/
        assert_file 'config/database.yml', /database: tmp_production/

        assert_file 'config/application.rb', /    config.autoload_paths/
        assert_file 'config/application.rb', /    config.generators do |g|/
      end
    end
  end
end
