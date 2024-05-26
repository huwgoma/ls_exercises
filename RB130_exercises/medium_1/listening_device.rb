# Listening Device
# The following class is representative of a listening device.
# - Listen for something. If anything is said, record it for later use. If 
#   nothing is said, do not record anything.
# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end
# end

# # Anything that is said is retrieved by the device via a block. If nothing is
# # said, no block is passed in.
# # The device can also output the most recent recording, using a Device#play
# # method.

# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play # Outputs "Hello World!"

# Finish the above program so that the listed specifications are met.


# Listen:
# - If a block is given, create a recording of the given block's message (string)
#   and add it to @recordings via #record.
# - If no block is given, do nothing.
# Play:
# - Print the most recent (last) recording from @recordings.

class Device
  def initialize
    @recordings = []
  end

  def listen
    record(yield) if block_given?
  end

  def play
    puts @recordings.last
  end

  private

  def record(recording)
    @recordings << recording
  end
end



listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"