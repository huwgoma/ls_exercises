# Modify Truck#start_engine by appending 'Drive fast, please!' to the return
#   value of Vehicle#start_engine. The 'fast' in 'Drive fast, please!' should 
#   be the string value of the `speed` parameter in Truck#start_engine.

class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    "#{super()} Drive #{speed}, please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')
# Ready to go! Drive fast, please!
puts truck1.start_engine('slow')
# Ready to go! Drive slow, please!