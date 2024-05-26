# Write a minitest assertion that will fail unless `employee.hire`
# raises a NoExperienceError exception.

require 'minitest/autorun'

class NoExperienceError < StandardError

end

class Employee
  def hire
    raise NoExperienceError # if employee does not have experience
  end
end

class TestExample < Minitest::Test
  def setup
    @employee = Employee.new
  end
  
  def test_experience_error
    assert_raises(NoExperienceError) { @employee.hire }
  end
end
