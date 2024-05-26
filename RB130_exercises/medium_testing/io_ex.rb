require 'stringio'

output = StringIO.new
output.puts("Hello")
output.puts("World")
p output.string #=> "Hello\nWorld\n"

p output.gets #=> nil - because the stream pointer is at the end
p output.pos #=> 12
output.rewind 
p output.pos #=> 0

p output.gets #=> "Hello\n"
p output.gets #=> "World\n"

