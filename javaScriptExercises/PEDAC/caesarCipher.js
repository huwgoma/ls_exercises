// Caesar Cipher
// Write a function that implements the Caesar Cipher:
// - Each letter in the plain text is substituted by the letter at ___ positions
//   away in the alphabet.
//   eg. A => Shift 3 Right => D

// - This shift value (eg. +3) is called the -key-.
//   - If the given key value exceeds the length of the alphabet, it wraps around
//     eg. Right-shift 26 => 0 (A shifted 26 characters is just A again)
//   - If the shifted letter exceeds Z, it also wraps around again.
//     eg.      V + right-shift 6:
//     (index 21) + 6 => 27; 2 past the maximum index (25) => 2(nd char) => B

// - Non-alphabetic characters are left as-is.
// - Encrypted letters preserve their original case.

// Questions:
// 1) Can the key ever be negative, representing a left shift?
// => Yes.

// Data: 
// Q: 0-indexing or 1-indexing?
// 0 Index:
//   0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
//   A B C D E F G H I J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z 
// Access Patterns:
// - Shifting (Positive):
//   A + 5 => 0 + 5 => 5; ALPHABET[5] => F
// - Wrapping (Positive):
//   Y + 3 => 24 + 3 => 27; modulo by 26 (27 % 26 => 1); ALPHABET[1] => B

// Key Processing:
// - If the key is negative, convert it into a positive
// eg. Key = -5 is the same as Key = 21 (5 from the back)
// > Key = 26 - 5

// - If the absolute value of key is greater than 25, coerce it back to 0..25 range
// eg. Key = 26 is the same as Key = 0 (overflows)
// > Key % 26 => 0
//     Key = 30 is equivalent to Key = 4 ( 30 % 26 => 4)

// eg. Key = -26 is the same as Key = 0 ( Abs(Key) % 26 => 0)
//     Key = -30:
//     > Abs(Key) % 26 => -4 => 26 - 4 => 22

// Input: 
// - String (to be encrypted)
// - Number (specifying how much to shift each letter by)
//   - Can be positive (shift right) or negative (shift left)
// Output: 
// - New string (shifted letters)
// - Non-letters are included but not shifted

// Data:
// - Create a String for the alphabet 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
// - Represent letters using 0-indexing
// - Iterate over the given string. For each character:
//   Transform the current character.
//   - If the current character is a letter, shift the current letter by `key` 
//     number of places, then return that character.
//     eg. 'A', 5 => (placeInAlphabet(A) (1)) + 5 => 6 
//         ALPHABET[6]

// Algorithm: 
// Given a string and number as input, `string` and `key`:
// 1) Standardize the key value.
//    - If the absolute value of key is greater than 25, coerce it back to the 
//      0-25 range by dividing by 26 and taking the remainder.
//    - If key is negative, subtract the absolute in-range value from 26 to get
//      the positive version of the negative key.
//    * 26 is the number of letters in the alphabet; ALPHABET_SIZE
// 2) Iterate over string. For each character, transform the current character:
//    - If the current character is a letter, rotate the character by `key` spaces:
//      - ALPHABET [ index of character in ALPHABET + key ]
//    - If letter is lowercase, return rotatedChar.toLower; otherwise, return
//      rotatedChar.toUpper
//    - If current character is not a letter, return it as-is
// 3) => Array of transformed characters
// 4) Join transformed characters back into a string.

const ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
const ALPHABET_SIZE = ALPHABET.length;

function caesarEncrypt(string, key) {
  let standardizedKey = standardizeKey(key);

  return string.split('').map(char => {
    if (isLetter(char)) {
      let indexOfChar = ALPHABET.indexOf(char.toUpperCase());
      let rotatedIndex = (indexOfChar + standardizedKey) % ALPHABET_SIZE;
      let rotatedLetter = ALPHABET[rotatedIndex];
      
      return isLowerCase(char) ? rotatedLetter.toLowerCase() : rotatedLetter.toUpperCase();
    } else {
      return char;
    }
  }).join('');
}

// Return a standardized (positive, 0-25) key
function standardizeKey(key) {
  let keyWasNegative = key < 0;
  let absoluteKey = Math.abs(key);
  
  // Standardize to 0-25 range
  if (absoluteKey >= ALPHABET_SIZE) { key = absoluteKey % ALPHABET_SIZE };
  // Invert to positive value
  if (keyWasNegative && key !== 0) { key = ALPHABET_SIZE - Math.abs(key) }

  return key;
}

function isLetter(char) {
  return /[a-zA-Z]/.test(char);
}

function isLowerCase(char) {
  return char.toLowerCase() === char;
}

// Examples:
// Simple Examples:
console.log(caesarEncrypt('A', 0)); //=> 'A'
console.log(caesarEncrypt('A', 3)); //=> 'D'
// Left (Negative) Shifting:
console.log(caesarEncrypt('A', 0));  //=> 'A'
console.log(caesarEncrypt('A', -5)); //=> 'V'

// // If a right shift exceeds Z, wrap-around:
console.log(caesarEncrypt('A', 26)); //=> 'A'
console.log(caesarEncrypt('T', 10)); //=> 'D' (20 + 10 -> 30 => wraps to #4, D)

// // If a left shift exceeds A, wrap-around:
console.log(caesarEncrypt('A', -26)); //=> 'A'
console.log(caesarEncrypt('B', -3)); //=> 'Y' (2 - 3 => -1 => 26 - 1 => 25, Y)

// // If the key is greater than the length of the alphabet (26), wrap it back into
// // the 1-26 range.
console.log(caesarEncrypt('A', 31)); //=> 'F' (A + 26 is A again, so A + 5 is F)
// Likewise for negative keys:
console.log(caesarEncrypt('A', -31)); //=> 'V' (A - 26 is A again, so A - 5 is V)

// // Multiple Letters:
console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25)); // "ZABCDEFGHIJKLMNOPQRSTUVWXY"
console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', -1)); // "ZABCDEFGHIJKLMNOPQRSTUVWXY"

// // Casing is Preserved:
console.log(caesarEncrypt('ABCdef', 4)); //=> EFGhij
console.log(caesarEncrypt('ABCdef', -4)); //=> WXYzab

// // Non-Letters are ignored:
console.log(caesarEncrypt('Hello, 123!', 3)); // Khoor, 123!