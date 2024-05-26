# Write a minitest assertion that will fail if `value.odd?` is not true.
# 
require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_odd
    value = 3
    assert_equal(true, value.odd?)
  end
end

