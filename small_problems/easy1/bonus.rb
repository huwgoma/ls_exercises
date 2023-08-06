# Bonus? 

# Input: Positive integer (salary)
#        Boolean (bonus_given?)
#  If bonus_given is true, bonus $ should be half the salary
#  If bonus_given is false, bonus $ should be 0

# Output: Integer (Salary + Bonus)

# eg. 
# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000

# Alg: 
#   Given two arguments, salary and bonus_given
#   Calculate bonus: 
#     If bonus_given is true, bonus = salary / 2.0
#     If bonus_given is false, bonus = 0
#   Return bonus

def calculate_bonus(salary, bonus_given)
  bonus_given ? (salary / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000