# Fix the program so it will work properly. Assume that the Car class has a complete
#   implementation - make the smallest possible change to ensure that individual
#   cars have access to #drive.

module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive