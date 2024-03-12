# Files
# You started writing a class for handling files. However, when you begin to write
# some test code, you get a NameError, with the message 'uninitialized constant
# File::FORMAT'.

# What is the problem? What are some possible ways to fix it?

# class File
#   attr_accessor :name, :byte_content

#   def initialize(name)
#     @name = name
#   end

#   alias_method :read,  :byte_content
#   alias_method :write, :byte_content=

#   def copy(target_file_name)
#     target_file = self.class.new(target_file_name)
#     target_file.write(read)

#     target_file
#   end

#   def to_s
#     "#{name}.#{FORMAT}"
#   end
# end

# class MarkdownFile < File
#   FORMAT = :md
# end

# class VectorGraphicsFile < File
#   FORMAT = :svg
# end

# class MP3File < File
#   FORMAT = :mp3
# end

# # Test

# blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
# blog_post.write('Content will be added soon!'.bytes)

# copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

# puts copy_of_blog_post.is_a? MarkdownFile     # true
# puts copy_of_blog_post.read == blog_post.read # true

# puts blog_post

# The source of this error occurs when the `File#to_s` method is implicitly called
#   on `blog_post`, an object of the `MarkdownFile` class, during the `puts blog_post`
#   method invocation. Since `MarkdownFile` does not have its own `#to_s` method,
#   Ruby will use the inherited `File#to_s` method instead. Within `File#to_s`, a
#   reference to the constant `FORMAT` is used.
# When Ruby tries to resolve a constant, it first searches the structure of the 
#   constant reference. Since the structure that referenced the constant was `File`
#   (via `File#to_s`), and `File` does not have a `FORMAT` constant definition,
#   Ruby will try again with the inheritance tree of the referencing structure; 
#   since none of those classes/modules have a `FORMAT` definition, Ruby will finally
#   try searching the main scope. Since none of those searches encounter a definition
#   for `FORMAT`, Ruby raises an error.


# How to Fix: 
#   Assuming we will never directly call `to_s` on a `File` object (ie. it will
#   only be called on objects that subclass from `File`), we can specify `File#to_s`
#   to search for the `FORMAT` constant in the class of the calling object. 
# eg:

class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post


# Further Exploration:
# alias_method(new_name, old_name)
# - Creates a new method (#new_name) that is an alias (ie. copy) of
#   the #old_name method. 
# - Can be used to retain access to a method that is overridden.
# (Creating a new reference to the method)