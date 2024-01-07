# Create a Towable module that contains a method named #tow, that prints 
#   "I can tow a trailer!" when called. Include the module in Truck, but not Car.

module Towable
  def tow
    puts "I can tow a trailer!"
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new
truck1.tow