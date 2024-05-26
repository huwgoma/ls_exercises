# Write a minitest assertion that fails if `value`'s class is not Numeric, or 
# one of Numeric's subclasses (Integer/Float/etc.)

require 'minitest/autorun'

class TestExample < Minitest::Test
  def test_kind_of_numeric
    value = 24
    assert_kind_of(Numeric, value)
  end
end
