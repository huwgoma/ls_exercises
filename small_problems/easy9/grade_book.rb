# Grade Book
# Write a method that determines the average of the 3 scores given and 
#   returns the letter value associated with that grade.
# Assume all values will be within 0-100.

# Input: 
#   3 integers (representing test scores)
# Output:
#   A string representing the letter grade corresponding to the average
#   of the 3 given integer grades
#   90-100 => 'A'; 80-89 => 'B'; 70-79 => 'C';
#   60-69 => 'D'; 0-59 => 'F'

# Examples:
# get_grade(95, 90, 93) == "A"
# get_grade(50, 50, 95) == "D"

# Data:
#   The 3 integers given as input - will need to calculate average
#   A hash to score the correspondences between number grades and letter grades
#   - possibly use ranges as the keys? or values? idk
#   (90..100) => 'A' OR 
#   'A' => (90..100) (probably this one)

# Algorithm:
# Given 3 integers as input, score1, score2, score3:
# Calculate the sum average of the scores.
# Retrieve the corresponding letter grade:
#   From GRADES hash?
#     Return the key from GRADES for which the corresponding value range includes
#     the given score average
#     Selection: Iterate over GRADES. For each key-value pair, grade-range:
#       If average is within the range, select that key-value pair
#     => A hash containing one key-value pair
#     - Retrieve the key of that key-value pair
#   or use if/elses/case

GRADES = {
  'A' => 90..100, 'B' => 80..89, 'C' => 70..79,
  'D' => 60..69, 'F' => 0..59
}

def get_grade(score1, score2, score3)
  average = (score1 + score2 + score3) / 3
  grade = GRADES.select { |_, range| range.include?(average) }
  grade.keys.first
end


p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# With #case:
def get_grade(score1, score2, score3)
  average = [score1, score2, score3].sum / 3
  case average
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  when 0..59   then 'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# Further Exploration: 
# How would you handle if there were extra credit grades causing it to be 
#   possible to exceed 100?
# Probably add an additional case (or key-value pair), 100..120? => 'A+'