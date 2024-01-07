# Modify the code so that "Hello! I'm a cat!" is printed when Cat.generic_greeting
#   is invoked.
 
class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting


# Further Exploration: What happens if you run kitty.class.generic_greeting?
#   Explain the result.
# kitty = Cat.new 
# kitty.class.generic_greeting
# `kitty` is an object of class Cat; kitty.class will return the Cat class; 
#   Cat.generic_greeting will output "Hello! I'm a cat!"