# Write a minitest assertion that fails if value is not nil.

# frozen_string_literal: true

require "minitest/autorun"

class TestExample < Minitest::Test
  def test_nil
    value = nil
    assert_nil(value)
  end
end
