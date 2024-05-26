# The following is a list of pioneer names, encrypted using Rot13:
# Rot13: Rotate by 13 places
# - Each letter is replaced with the 13th letter after it.
# eg. 'a' is replaced with 'n' (13 letters after) 
# bcdefghijklmn

# Write a method that deciphers and prints each of these names.

# Input:
# - A string representing a name, encrypted using Rot-13
# Output: 
# - The unencrypted name

# Examples:
# rotate_thirteen(Nqn Ybirynpr) == Ada Lovelace
# rotate_thirteen(Gvz Orearef-Yrr) == Tim Berners-Lee

# Data:
# - String given as input
# - String returned as output
# - Possibly a data structure for linking letters? (eg. a => n)
#   - may not be necessary as we can just shift using ord/chr
#   - would need to ensure overflows are in place (eg. do not increment past
#     122 ('z'), or 90 ('Z'))
# 'a'.ord => 97 ; 'z'.ord => 122
# 'A'.ord => 65 ; 'Z'.ord => 90



# Algorithm:
# Given a string as input, encrypted_name:
# (Transform) Iterate through each character of encrypted name. For each char:
#   - If current character is non-alphabetic, skip to the next character 
#     (return char from block)
#   - Calculate the ASCII # of the current character. 
#     - If ASCII is between 110(n) and 122(z), or between 78(N) and 90(Z),
#       decrement by 13
#     - Otherwise, increment by 13.

#     # Once we have the in/decremented ASCII#, convert the no. to a character.
# => Array of transformed characters -> join together into a string. and print
#   the string.

ALPHABET = Array('a'..'z') + Array('A'..'Z')

def rotate_thirteen(encrypted_name)
  name = encrypted_name.chars.map do |char|
    case char
    when 'a'..'m', 'A'..'M' then (char.ord + 13).chr
    when 'n'..'z', 'N'..'Z' then (char.ord - 13).chr
    else                         char
    end
  end.join
end




p rotate_thirteen('Nqn Ybirynpr')
p rotate_thirteen('Tenpr Ubccre')
p rotate_thirteen('Nqryr Tbyqfgvar')
p rotate_thirteen('Nyna Ghevat')
p rotate_thirteen('Puneyrf Onoontr')
p rotate_thirteen('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p rotate_thirteen('Wbua Ngnanfbss')
p rotate_thirteen('Ybvf Unvog')
p rotate_thirteen('Pynhqr Funaaba')
p rotate_thirteen('Fgrir Wbof')
p rotate_thirteen('Ovyy Tngrf')
p rotate_thirteen('Gvz Orearef-Yrr')
p rotate_thirteen('Fgrir Jbmavnx')
p rotate_thirteen('Xbaenq Mhfr')
p rotate_thirteen('Fve Nagbal Ubner')
p rotate_thirteen('Zneiva Zvafxl')
p rotate_thirteen('Lhxvuveb Zngfhzbgb')
p rotate_thirteen('Unllvz Fybavzfxv')
p rotate_thirteen('Tregehqr Oynapu')