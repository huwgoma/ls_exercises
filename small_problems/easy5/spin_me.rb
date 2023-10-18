# Spin Me 
# You are given a method named #spin_me that takes a string as an argument 
#   and returns a string that contains the same words, but with each word's 
#   characters reversed. Given the method implementation, will the returned 
#   string be the same object as the one passed in or a new object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# This implementation of `spin_me` returns a *new* String.
#   The #split method returns an Array of new String objects obtained from 
#     splitting the calling String. Any operation performed on `word` will 
#     only affect these new Strings, not the original `str` String.
#   Additionally, on Line 10, the Array#join method returns a new String
#    formed from joining the elements of the calling Array together.