# Create a module named Transportation that contains 3 classes: Vehicle, Truck, 
#   and Car. 
# Truck and Car should both inherit from Vehicle.

module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

vehicle = Transportation::Vehicle.new 
truck = Transportation::Truck.new
car = Transportation::Car.new