# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc        
#=> String representation of `my_proc`
puts my_proc.class  
#=> Proc
my_proc.call        
#=> "This is a ." 
# Procs have lenient arity; the Proc expects an argument (`thing`), but can be
#   invoked even if a matching argument is not given.
my_proc.call('cat')
#=> "This is a cat."


# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
#=> String representation of `my_lambda`
puts my_second_lambda
#=> String representation of `my_second_lambda`
puts my_lambda.class
#=> Proc (lambdas are a special type of Proc)
my_lambda.call('dog')
#=> "This is a dog."

#my_lambda.call
#=> ArgumentError (given 0, expected 1)
# Lambdas have strict arity, meaning they must be invoked with a number of 
#   arguments matching the number of expected arguments.

#my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
#=> Uninitialized constant Lambda
# Lambdas are not a distinct type of object from Procs; they are a special 
#   type of Proc, but they are still a Proc.


# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
#=> "This is a ."
# Blocks have lenient arity; the block expects an argument (`seal`), but 
#   can be invoked without any arguments at all.

# block_method_1('seal')
#=> LocalJumpError (yield but no block given)


# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
#=> "This is a turtle."

block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
#=> "This is a turtle and a ."
# Another example of lenient arity - the block expects to receive 2 arguments, but
#   is only invoked with one ('turtle'). Despite this discrepancy, no error is 
#   raised - 'turtle' is assigned to the block parameter `turtle`, and `seal` is 
#   assigned the value of `nil`.

block_method_2('turtle') { puts "This is a #{animal}."}
#=> Undefined local variable or method name `animal`
# This block does not define any block parameters; although it can be invoked with
#   arguments ('turtle'), those arguments are not assigned to any block variables.
#   Since no `animal` variable was initialized either in the block or in the scope 
#   of the block's definition, a NameError will be raised.


