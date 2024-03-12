# Write a class that produces the desired output.

class Transform
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def uppercase
    data.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
# ABC
puts Transform.lowercase('XYZ')
# xyz


# Further Exploration
# A class method can also be called a 'singleton method'.