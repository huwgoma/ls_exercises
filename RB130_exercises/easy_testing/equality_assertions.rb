# Write a minitest assertion that fails if value.downcase does not return 'xyz'.

require 'minitest/autorun'
# require the file

class TestExample < Minitest::Test
  def test_xyz
    value = 'XYZ'
    assert('xyz', value.downcase)
  end
end
