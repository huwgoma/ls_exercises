# Triangle Sides
# A triangle can be classified as follows:
# - Equilateral: All 3 sides are equal length
# - Isosceles: 2 sides are equal length, the 3rd is different
# - Scalene: All 3 sides are different lengths
# Rules for a valid triangle:
# - The two shortest sides combined must be longer than the longest side
# - All sides must be longer than 0

# Write a method that takes 3 integers representing the lengths of the triangle
#   and returns a symbol:
#   - :equilateral, :isosceles, :scalene, or :invalid

# Input: 3 integers
# - Represent the lengths of the 3 sides of the 'triangle'
# Output: A symbol 
# - Represents the type of triangle (or invalid if triangle is invalid)

# Examples:
# triangle(3, 3, 3) == :equilateral
# triangle(3, 3, 1.5) == :isosceles
# triangle(3, 4, 5) == :scalene
# triangle(0, 3, 3) == :invalid
# triangle(3, 1, 1) == :invalid

# Data:
# - The 3 integers given as input each representing a side
# - First calculate if triangle is valid
# - If valid, then calculate which type it is
# - Maybe store the lengths in an array

# Algorithm:
# Given 3 integers as input, length1..length3:
# Calculate whether the triangle is valid.
#   All lengths must be greater than 0, AND
#     the sum of the two smallest lengths must be greater than the largest length
# If triangle is invalid, return :invalid. Otherwise:
# Calculate the type of triangle.
#   If all lengths have the same value -> return equilateral
#   If all lengths have different values -> return scalene
#   * If 2 lengths are identical and 1 length is different -> return isosceles

# Compress lengths to only include unique values:
#   - If size == 1 -> equilateral
#   - If size == 2 -> isosceles
#   - If size == 3 -> scalene

def triangle(length1, length2, length3)
  lengths = [length1, length2, length3]
  
  return :invalid unless valid_triangle?(lengths)
  
  case lengths.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end

def valid_triangle?(lengths)
  lengths.size == 3 && lengths.all?(&:positive?) && 
    lengths.min(2).sum > lengths.max
end


p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid