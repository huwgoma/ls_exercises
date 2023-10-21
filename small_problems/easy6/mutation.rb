# Mutation
# What will the following code print, and why? 
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []

array1.each { |value| array2 << value }
# array2 = [Moe Larry Curly Shemp Harpo Chico Groucho Zeppo]

array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# CURLY SHEMP CHICO
puts array2
#=> [Moe Larry CURLY SHEMP Harpo CHICO Groucho Zeppo]

=begin
This code will output Moe, Larry, CURLY, SHEMP, Harpo, CHICO, Groucho, and Zeppo,
all on separate lines.

On Line 3, we create a shallow copy `array2` by iterating over each element
of `array1` and appending the elements to `array2`. Importantly, the objects that
are being added to `array2` are the same objects that `array1`'s indexes reference.

On Line 4, we again iterate over the elements of `array1` and call the destructive
#upcase! method on each String that begins with 'C' or 'S' - this will mutate the 
Strings `Curly`, `Shemp`, and `Chico` (uppercasing them).

Because `array1` and `array2` contain references to the same String objects, 
`array2` will also reflect the mutations made to those String objects on Line 4.

The underlying concept that is being demonstrated here is the concept of a shallow
copy - `array1` and `array2` are different ARRAY objects, but the objects that their
indexes reference are the same STRING objects. Thus, mutating the elements will
indirectly mutate both Arrays, but mutating one of the Arrays directly 
(eg. `array1.pop`) would not mutate the other Array.
=end