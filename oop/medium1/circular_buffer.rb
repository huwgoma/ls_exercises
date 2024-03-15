# Circular Buffer
# A circular buffer is a collection of objects that is treated like it's connected
# end-to-end, in a circle. When an object is added to this buffer, it is added
# to the end of the buffer; when an object is removed, the object that has been
# in the buffer the longest is removed.

# If the buffer becomes full, adding a new object requires getting rid of an
# existing object (the object that has been in the circle the longest).

# [nil, nil, nil]
# Add 1 [1, nil, nil]
# Add 2 [1, 2, nil]
# Remove (oldest - 1) => [2, nil, nil] (Remove first item, then push a nil)
# Add 3 => [2, 3, nil]
# Add 4 => [2, 3, 4]

# Remove oldest (2) => [3, 4, nil]
# Add 5 => [3, 4, 5]
# Add 6 => [4, 5, 6] * If buffer is full, remove the oldest and push the new item in
# Add 7 => [5, 6, 7]
# Remove oldest => [6, 7, nil]
# Remove oldest => [7, nil, nil]
# Remove oldest => [nil, nil, nil]
# Remove non-existent => nil

# Algorithm:
# #put - Add an object to the end of the buffer. If the buffer is full, remove the
#   oldest (first) element before pushing the element into the buffer
# #get - Remove and return the oldest (first) element; if the buffer is empty, 
#   return nil.
# Assume none of the values are nil (but you can use nil to designate empty spots)

class CircularBuffer
  def initialize(size)
    @buffer = Array.new(size)
  end

  def put(element)
    get if full?
    buffer[first_empty_index] = element
  end

  def get
    buffer.push(nil)
    buffer.shift
  end

  private

  attr_reader :buffer

  def first_empty_index
    buffer.index(nil)
  end

  def full?
    buffer.all?
  end
end


buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil