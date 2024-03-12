# Community Library
# On Line 48, we intend to display information regarding the books that are
# currently checked in to our community library. Instead, an exception is raised.
#   Determine the cause of this error and fix the code so that the data is displayed
#   as expected.

# class Library
#   attr_accessor :address, :phone, :books

#   def initialize(address, phone)
#     @address = address
#     @phone = phone
#     @books = []
#   end

#   def check_in(book)
#     books.push(book)
#   end
# end

# class Book
#   attr_accessor :title, :author, :isbn

#   def initialize(title, author, isbn)
#     @title = title
#     @author = author
#     @isbn = isbn
#   end

#   def display_data
#     puts "---------------"
#     puts "Title: #{title}"
#     puts "Author: #{author}"
#     puts "ISBN: #{isbn}"
#     puts "---------------"
#   end
# end

# community_library = Library.new('123 Main St.', '555-232-5652')
# learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
# little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
# wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

# community_library.check_in(learn_to_program)
# community_library.check_in(little_women)
# community_library.check_in(wrinkle_in_time)

# community_library.books.display_data

# Cause of Error: 
# The #display_data instance method is called on `community_library.books`, which
#   returns an Array object, which does not have a defined #display_data method.

# How to Fix:
# We can iterate through `books` to expose each `Book` object, then call `Book#
# display_data` on each one.
# eg.
# class Library
#   attr_accessor :address, :phone, :books

#   def initialize(address, phone)
#     @address = address
#     @phone = phone
#     @books = []
#   end

#   def check_in(book)
#     books.push(book)
#   end
# end

# class Book
#   attr_accessor :title, :author, :isbn

#   def initialize(title, author, isbn)
#     @title = title
#     @author = author
#     @isbn = isbn
#   end

#   def display_data
#     puts "---------------"
#     puts "Title: #{title}"
#     puts "Author: #{author}"
#     puts "ISBN: #{isbn}"
#     puts "---------------"
#   end
# end

# community_library = Library.new('123 Main St.', '555-232-5652')
# learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
# little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
# wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

# community_library.check_in(learn_to_program)
# community_library.check_in(little_women)
# community_library.check_in(wrinkle_in_time)

# community_library.books.each(&:display_data)


# Alternate Solution:
# We can also add a #display_books method to Library#display_books, 
#   and refactor Book#display:
class Library
  attr_accessor :address, :phone, :books

  def initialize(address, phone)
    @address = address
    @phone = phone
    @books = []
  end

  def check_in(book)
    books.push(book)
  end

  def display_books
    books.each(&:display)
  end
end

class Book
  attr_accessor :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def display
    puts "---------------"
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "ISBN: #{isbn}"
    puts "---------------"
  end
end

community_library = Library.new('123 Main St.', '555-232-5652')
learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

community_library.check_in(learn_to_program)
community_library.check_in(little_women)
community_library.check_in(wrinkle_in_time)

community_library.display_books