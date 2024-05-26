# Write a test that fails if 'xyz' is one of the elements in the Array `list`.
require 'minitest/autorun'

class TestExample < Minitest::Test
  def test_does_not_include_xyz
    list = ['xy']
    refute_includes(list, 'xyz')
  end
end
