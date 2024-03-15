# Students
# Below, we have 3 classes - Student, Graduate, and Undergraduate. 
# Fill in the implementation so that the following requirements are fulfilled:
# 1) Graduates can use on-campus parking, but Undergraduates cannot
# 2) Graduate and Undergraduates both have an associated name and year.

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking # true or false
  end
end

class Undergraduate < Student; end

# Further Exploration
# Add another Student-related class that uses super() (No arguments)
# - Is this possible? Student#initialize requires 2 arguments, and if we call
#   super(), an ArgumentError will be raised.