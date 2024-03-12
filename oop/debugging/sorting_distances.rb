# Sorting Distances
# When attempting to sort an array of various lengths, an ArgumentError is raised.
# Make the necessary changes to our code so that the various lengths can be 
# properly sorted, and line 67 produces the desired output.

# class Length
#   attr_reader :value, :unit

#   def initialize(value, unit)
#     @value = value
#     @unit = unit
#   end

#   def as_kilometers
#     convert_to(:km, { km: 1, mi: 0.6213711, nmi: 0.539957 })
#   end

#   def as_miles
#     convert_to(:mi, { km: 1.609344, mi: 1, nmi: 0.8689762419 })
#   end

#   def as_nautical_miles
#     convert_to(:nmi, { km: 1.8519993, mi: 1.15078, nmi: 1 })
#   end

#   def ==(other)
#     case unit
#     when :km  then value == other.as_kilometers.value
#     when :mi  then value == other.as_miles.value
#     when :nmi then value == other.as_nautical_miles.value
#     end
#   end

#   def <(other)
#     case unit
#     when :km  then value < other.as_kilometers.value
#     when :mi  then value < other.as_miles.value
#     when :nmi then value < other.as_nautical_miles.value
#     end
#   end

#   def <=(other)
#     self < other || self == other
#   end

#   def >(other)
#     !(self <= other)
#   end

#   def >=(other)
#     self > other || self == other
#   end

#   def to_s
#     "#{value} #{unit}"
#   end

#   private

#   def convert_to(target_unit, conversion_factors)
#     Length.new((value / conversion_factors[unit]).round(4), target_unit)
#   end
# end

# # Example

# puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# => comparison of Length with Length failed (ArgumentError)
# expected output:
# 1 km
# 1 mi
# 1 nmi

# Source of Error:
# Array#sort compares elements using the #<=> method of the objects being compared.
#   If <=> returns 1, the elements are swapped; if it returns 0 or -1, the elements
#   are not swapped; if nil is returned, the elements are incomparable, and
#   the sort will fail (comparison failed).
# Since `Length` objects do not have a defined `#<=>` method, the default 
# `Object#<=>` method is inherited, which returns 0 if the calling object and argument
# are the same object, and `nil` otherwise. Since none of the `Length` objects are
# identical, `nil` is returned to `sort`, and the comparison fails.

# To Fix:
# Define a Length#<=> method, which will return -1 if the calling Length is 
#   smaller than the other Length, 0 if they are equal, and 1 if the calling 
#   Length is greater than the other Length.
# This will override Object#<=>, and will allow `sort` to compare Length objects
#   properly.
# eg:
class Length
  attr_reader :value, :unit

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def as_kilometers
    convert_to(:km, { km: 1, mi: 0.6213711, nmi: 0.539957 })
  end

  def as_miles
    convert_to(:mi, { km: 1.609344, mi: 1, nmi: 0.8689762419 })
  end

  def as_nautical_miles
    convert_to(:nmi, { km: 1.8519993, mi: 1.15078, nmi: 1 })
  end

  def <=>(other)
    # Convert the other length object to a length object of the caller's type,
    # then compare their values
    converted_length = case unit
                       when :km  then other.as_kilometers
                       when :mi  then other.as_miles
                       when :nmi then other.as_nautical_miles
                       end

    value <=> converted_length.value                  
  end

  def to_s
    "#{value} #{unit}"
  end

  private

  def convert_to(target_unit, conversion_factors)
    Length.new((value / conversion_factors[unit]).round(4), target_unit)
  end
end

# Example
puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort

# Further Exploration:
# If we were to convert 10 km to miles, then back to 10km, the resulting length
# would not be exactly 10km due to floating point imprecision.

# When comparing floats for equality, it's often good practice to check that the 
# two floats are close enough (within a specified tolerable difference).