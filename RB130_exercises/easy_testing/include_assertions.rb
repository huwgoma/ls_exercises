# Write a minitest assertion that fails if 'xyz' is not included in the `list`
# Array.

require 'minitest/autorun'

class TestExample < Minitest::Test
  def test_include_xyz
    list = ['xyz', 'aaaa']
    assert_includes(list, 'xyz')
  end
end

