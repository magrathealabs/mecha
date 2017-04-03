require 'test_helper'

class StringTest < Minitest::Test
  def test_convert_from_camelcase
    assert_equal 'snake_case', 'SnakeCase'.underscore
  end

  def test_convert_from_camelcase_containing_dash
    assert_equal 'snake_case', 'Snake-Case'.underscore
  end

  def test_convert_from_camelcase_containing_spaces
    assert_equal 'snake_case', 'Snake  Case'.underscore
  end

  def test_convert_from_camelcase_containing_underscores
    assert_equal 'snake_case', 'Snake__Case'.underscore
  end
end
