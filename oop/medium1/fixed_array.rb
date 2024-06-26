# Fixed Array
# A fixed-length array is an array that always has a fixed number of elements.
# Write a class that implements a fixed length array and provides the necessary
# methods to support the following code:

class FixedArray
  attr_reader :array

  def initialize(size)
    @array = Array.new(size)
  end

  def [](index)
    array.fetch(index)
  end

  def []=(index, element)
    raise IndexError if out_of_bounds?(index)
    array[index] = element
  end

  def to_a
    array.dup
  end

  def to_s
    array.to_s
  end

  private

  def out_of_bounds?(index)
    begin
      array.fetch(index)
      false
    rescue 
      true
    end
  end
    
    # index >= array.size || index <
    #  # [0, 1, 2, 3, 4]
    #  # -
    #  # if element can be fetched, return true - otherwise, false
end

fixed_array = FixedArray.new(5) # [nil, nil, nil, nil, nil]
# Default value is nil
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5 # true

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end