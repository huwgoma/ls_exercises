# # Wish you were here
# # On Lines 41 and 42, `grace` and `ada` are located at the same coordinates.
# #   WHy does Line 43 output false? Fix the code to produce the expected output (true)

# class Person
#   attr_reader :name
#   attr_accessor :location

#   def initialize(name)
#     @name = name
#   end

#   def teleport_to(latitude, longitude)
#     @location = GeoLocation.new(latitude, longitude)
#   end
# end

# class GeoLocation
#   attr_reader :latitude, :longitude

#   def initialize(latitude, longitude)
#     @latitude = latitude
#     @longitude = longitude
#   end

#   def to_s
#     "(#{latitude}, #{longitude})"
#   end
# end

# # Example

# ada = Person.new('Ada')
# ada.location = GeoLocation.new(53.477, -2.236)

# grace = Person.new('Grace')
# grace.location = GeoLocation.new(-33.89, 151.277)

# ada.teleport_to(-33.89, 151.277)

# puts ada.location                   # (-33.89, 151.277)
# puts grace.location                 # (-33.89, 151.277)
# puts ada.location == grace.location # expected: true
                                    # actual: false

# Line 43 outputs false because the @location attribute of `ada` and `grace` 
#   reference a `Geolocation` object. Because the `GeoLocation` class has not 
#   defined a `==` method, it inherits the default `BasicObject#==`, which compares
#   for equality based on object identity. `ada` and `grace`'s `@location` instance
#   variables reference two different `GeoLocation` objects (that share the same
#   values for @latitude and @longitude); as such, they are not considered equal 
#   by `BasicObject#==`.

# How to Fix:
#   We can define a `#==` for `GeoLocation` objects that use `@latitude` and 
#   `longitude` for comparison. eg:

class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  def ==(other_location)
    latitude == other_location.latitude &&
      longitude == other_location.longitude
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false





