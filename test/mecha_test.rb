require 'test_helper'

class MechaTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Mecha::VERSION
  end

  def test_that_it_has_a_ruby_version_number
    refute_nil ::Mecha::RUBY_VERSION
  end

  def test_that_it_has_a_rails_version_number
    refute_nil ::Mecha::RAILS_VERSION
  end
end
