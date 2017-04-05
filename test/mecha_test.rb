require 'test_helper'

class MechaTest < ActiveSupport::TestCase
  test 'that it has a version number' do
    refute_nil ::Mecha::VERSION
  end

  test 'that it has a ruby version number' do
    refute_nil ::Mecha::RUBY_VERSION
  end

  test 'that it has a rails version number' do
    refute_nil ::Mecha::RAILS_VERSION
  end
end
