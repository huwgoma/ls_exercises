# Write an assertion that fails if the `list` Array is not empty.

require "minitest/autorun"


class TestExample < Minitest::Test
  def test_empty
    list = []
    assert_empty(list)
  end
end
