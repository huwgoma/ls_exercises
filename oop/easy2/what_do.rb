# What will the following code print, and why?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata # => ByeBye
puts thing.dupdata # => HelloHello

# Line 18 will print the string ByeBye. This is because the method that is called 
#   is the Something::dupdata *class* method, which is defined on Lines 12-14, and
#   simply returns a String with the value 'ByeBye'.

# Line 19 will print the string HelloHello. This occurs because we are calling the
#   Something#dupdata *instance* method, defined on Lines 8-10. When a new Something
#   object is instantiated, the @data instance variable is initialized and assigned
#   to the String 'Hello'; that String's value is concatenated to itself in the
#   Something#dupdata instance method, resulting in a String with the value 
#   'HelloHello' being returned.