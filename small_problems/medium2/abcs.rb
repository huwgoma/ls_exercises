# Now I Know My ABCs
# Given a collection of spelling blocks with 2 letters per block:
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# You can only use one letter from each block.
# ie. If B is used in a word, O cannot be used in that word.

# Write a method that returns true if the given word can be constructed from this
# set of letter blocks; otherwise, false

# Input: A String (representing a word)
# Output: A Boolean
# - true if the given word can be spelled using the defined letter blocks
# - false otherwise

# Examples:
# block_word?('BATCH') == true
# - B (cant use O); A (cant use N), T (cant use G), C (cant use P), H (cant use U)
# - No overlap
# block_word?('BUTCH') == false
# - False because once we use U, we cannot use H.
# block_word?('jest') == true

# Data:
#   The String given as input 
#   - Probably iterate through the string char-by-char
#   Need to store the letter blocks somehow
#   - An array of letter block strings [B:O, X:K, etc.]
#   Need to store the usages of those letter blocks
#   -Maybe a nested hash?
#   { B: { used?: false, opposite: O } }
#   - Create a hash
#     - For each element in LETTER BLOCKS:
#     - Split the element on colon (:) to create two strings ('B', 'O')
#     - Create two new key-value pairs:
#         element: { used?: false, opposite: ? }
#     - We can obtain the opposite letter by non-destructively deleting 
#       the colon and the current letter
#       eg. 'B:O'.delete(O:) => B


#       
# Algorithm:
# Given a string as input, word:
# Iterate through each character of word. For each character:
#   Check if the current character has already been used
#   - if yes, return false
#   Check if the current character's opposite character has already been used
#   - If yes, return false
#   Set current character's used? to true; same with opposite character
#   If iteration completes without returning false, return true.

LETTER_BLOCKS = ['B:O', 'X:K', 'D:Q', 'C:P', 'N:A', 'G:T', 'R:E',
                 'F:S', 'J:W', 'H:U', 'V:I', 'L:Y', 'Z:M']

# def block_word?(word)
#   used_letters = LETTER_BLOCKS.each_with_object({}) do |letterblock, hash|
#     letterblock.split(':').each do |letter|
#       opposite = letterblock.delete("#{letter}:")
#       hash[letter] = { used?: false, opposite: opposite }
#     end
#   end
  
#   word.upcase.each_char do |char|
#     opposite_char = used_letters[char][:opposite]
#     return false if used_letters[char][:used?] || 
#       used_letters[opposite_char][:used?]
#     used_letters[char][:used?] = true
#     used_letters[opposite_char][:used?] = true
#   end
#   true
# end

# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true

# Algorithm Refactor:
# Given a string as input, word:
# Create an array LETTER BLOCKS, storing each letter block pairing
# Iterate through LETTER BLOCKS. For each letter block pair:
#   Count how many occurrences of that letterblock pair appear in the 
#     given string. 
#     If, for any letter pair, the count is greater than 2, return false
#   Otherwise, return true.

LETTER_BLOCKS = ['B:O', 'X:K', 'D:Q', 'C:P', 'N:A', 'G:T', 'R:E',
                 'F:S', 'J:W', 'H:U', 'V:I', 'L:Y', 'Z:M']

def block_word?(word)
  LETTER_BLOCKS.each do |letter_pair|
    return false if word.count(letter_pair) > 1
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true