# Assume a Tree class that implements a binary tree:
# - A binary tree is a type of collection class; it has an #each method, and 
#   mixes in the Enumerable module for access to iterative methods like 
#   map, reduce, and select.

class Tree
  include Enumerable
  # Every class that mixes in Enumerable needs an #each method
  # to define how to iterate:
  def each
  end
end