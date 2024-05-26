# Write a minitest assertion that fails if `value` is not an instance of the 
# Numeric class exactly (ie. cannot be an instance of a Numeric subclass.)

require 'minitest/autorun'

class TestExample < Minitest::Test
  def test_numeric
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end
end
