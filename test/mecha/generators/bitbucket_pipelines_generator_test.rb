require 'test_helper'
require 'mecha/generators/bitbucket_pipelines/bitbucket_pipelines_generator'

module Mecha
  module Generators
    class BitbucketPipelinesGeneratorTest < BaseGeneratorTest
      tests Mecha::Generators::BitbucketPipelinesGenerator

      test 'bitbucket_pipelines.yml is created' do
        run_generator([destination_root, '--database', 'postgresql'])
        assert_file 'config/database.bitbucket.yml', /database: tmp_test/
        assert_file 'config/database.bitbucket.yml', /username: tmp_test/
        assert_file 'config/database.bitbucket.yml', /password: tmp_test/
        assert_file 'config/database.bitbucket.yml', /template: template0/
        assert_file 'bitbucket-pipelines.yml', /- sudo -u postgres sh -c 'createuser tmp_test & createdb tmp_test'/
      end
    end
  end
end
