class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# There is nothing technically incorrect about the class, but it may lead to 
#   problems in the future. How can we fix this class to prevent those problems?