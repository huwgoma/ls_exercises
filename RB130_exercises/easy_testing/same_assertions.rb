# Write a test that fails if `list` and the return value of `list.process`
# are different objects.
require 'minitest/autorun'

class List
  def process
    self
  end
end


class TestExample < Minitest::Test
  def test_same_list
    list = List.new
    assert_same(list, list.process)
  end
end
