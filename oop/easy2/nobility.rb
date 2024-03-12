# Nobility need to strut. Create a new class, Noble, that shows their title and name 
#   when walk is called:
# byron = Noble.new('Byron', 'Lord')
# byron.walk 
# # => Lord Byron struts forward

# Both @name and @title should have a public getter method.

#  - gait: 'struts'
#  - Override walk?
#  - super => "Byron struts forward"
#  - concatenate title to super string

module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Noble
  include Walkable
  attr_reader :name, :title
  
  def initialize(name, title)
    @name, @title = name, title
  end
  
  def walk
    "#{title} #{super}"
  end

  private

  def gait
    'struts'
  end
end


byron = Noble.new('Byron', 'Lord')
puts byron.walk 

# Further Exploration: Using Inheritance
# Noble < Person
# Cheetah < Cat
# Person < Animal
# Cat < Animal