# Triangles
# A triangle is classified as follows:
# - Right: One angle is a right angle (90 degrees)
# - Acute: All 3 angles are less than 90 degrees
# - Obtuse: One angle is greater than 90 degrees
# Other triangle rules:
# - Sum of the angles must be exactly 180 degrees
# - All angles must be greater than 0

# Write a method that takes 3 integers and returns a symbol:
# :right, :acute, :obtuse, or :invalid.
# The integers represent the angles of the triangle, in degrees
# - You may assume the angles are integer values (no float errors)

# Input: 3 integers
# - represent the angles of the 'triangle'
# Output: A symbol 
# - represent the type of triangle (acute/right/obtuse/invalid)

# Examples:
# triangle(60, 70, 50) == :acute
# triangle(30, 90, 60) == :right
# triangle(120, 50, 10) == :obtuse
# triangle(0, 90, 90) == :invalid
# triangle(50, 50, 50) == :invalid

# Data:
# - The 3 integer angles given as input
# - Probably store them in an array
# - Check if the triangle is valid first
# - If valid, then check which type it is

# Algorithm:
# Given 3 integers as input, angle1..angle3:
# Create an array to store the angles, angles = [...]
# Check if the angles form a valid triangle
#   - All angles are greater than 0, AND the sum of all angles must be 
#     exactly 180 
#   Return :invalid if triangle isn't valid
# If triangle is valid, calculate what type of triangle it is:
#   If all angles are less than 90 -> acute
#   If any angle is 90 -> right
#   If any angle is greater than 90 -> obtuse
#   - Check the value of the greatest angle
#     - If less than 90, acute; if 90, right; if more than 90, obtuse

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  return :invalid unless valid_triangle?(angles)
  
  largest_angle = angles.max
  return :right if largest_angle == 90
  largest_angle > 90 ? :obtuse : :acute 
end

def valid_triangle?(angles)
  angles.size == 3 && angles.all?(&:positive?) &&
    angles.sum == 180
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid