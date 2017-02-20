require 'test_helper'

class TripodTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Tripod::VERSION
  end

  def test_that_it_has_a_ruby_version_number
    refute_nil ::Tripod::RUBY_VERSION
  end

  def test_that_it_has_a_rails_version_number
    refute_nil ::Tripod::RAILS_VERSION
  end
end
