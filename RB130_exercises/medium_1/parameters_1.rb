# Passing Parameters Part 1
# Modify the #gather method so that the display/output of `items` is moved to
# a block, and its implementation is left to the user of the `gather` method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) do |items|
  puts "#{items.join(', ')}"
end