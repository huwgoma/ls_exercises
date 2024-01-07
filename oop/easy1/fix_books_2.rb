# Complete this program to produce the desired output:
class Book
  attr_accessor :author, :title

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
# The author of "Snow Crash" is Neil Stephenson.
puts %(book = #{book}.)
# book = "Snow Crash", by Neil Stephenson.

# Further Exploration: What do you think of this way of creating and initializing
#   Book objects, in two separate steps? Is it better to create and set instance
#   variables together? What potential problems, if any, are introduced by
#   separating the steps?

# I personally think it is better to instantiate and set instance variables in one
#   step. For one, the #initialize method's use case is generally to set instance
#   variables at the time of object instantiation. Setting instance variables as 
#   a separate step afterwards also requires there be a public setter method for 
#   that instance variable, which we may not necessarily want.