# Modify the House class to produce the desired output.
# - You may only define one new method in House.

class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other_house)
    price <=> other_house.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# Output
# Home 1 is cheaper
# Home 2 is more expensive

# Discussion: Making Objects Comparable
# 1) Include Comparable mixin
# 2) Define a #<=> method that returns -1, 0, or 1


# Further Exploration: Is this a good way to implement comparison of Houses?
# - Are there other criteria you might use to compare Houses?

# Houses can be compared in multiple other aspects: square ft, price, age, etc.
# It is not especially clear from the user perspective how the house is being 
#   compared (home1 < home2). Instead of comparing Houses directly, it may(?) be 
#   more readable to simply compare the attributes of different houses directly
#   (eg. home1.price < home2.price)

# Comparable is better suited for classes where there is no ambiguity about
#   how the objects should be compared (eg. Integers)