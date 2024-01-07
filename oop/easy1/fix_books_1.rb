# Complete the program so it produces the desired output.
class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
# The author of Snow Crash is Neil Stephenson.
puts %(book = #{book}.)
# book = "Snow Crash", by Neil Stephenson.

# Further Exploration
# What are the differences between attr_reader/attr_writer/attr_accessor?
# Why did we use attr_reader instead of the other two? Would it be okay to use 
# one of the others? Why or why not?
#   attr_reader defines a getter method for the instance variable corresponding
#     to the given symbols; attr_writer defines a setter method; attr_accessor
#     defines both a getter and setter method.
#   We used attr_reader because it was only necessary to retrieve the value of 
#     the instance variable, not change it. Conceptually, it also makes sense that
#     the ability to change a book's title or author should not be public.
#   It would be okay (albeit unnecessary) to use attr_accessor, as it would 
#     still define the getter method. If we used attr_writer, it would not define
#     a getter, and the `book.title` method call would raise an error.

# If, instead of `attr_reader :title, :author`, we added the following methods:
# def title 
#   @title
# end

# def author
#   @author
# end
# Would this change the behavior of the class in any way? Why or why not? Are there
#   any advantages of this code?

# This change would not change the behavior of the class, as the two defined methods
#   are simply retrieving and returning the value of the corresponding instance 
#   variable. There are no advantages to this code; however, if we wanted to return 
#   a modified version of the instance variable's value, we would have to manually
#   define the getter method instead of using `attr_reader`.