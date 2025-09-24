// Vigenere Cipher
// - The Vigenere Cipher encrypts text using a series of Caesar Ciphers, based
//   on the letters of a given keyword.


// Rules:
// - Only the alphabetic characters of the given plaintext are encrypted.
// - For each letter in plaintext, it is shifted by N characters, where N corresponds
//   to the index of the current letter in the keyword.
//   eg. Plaintext: 'Pineapple', Keyword: 'Meat'
//       1) 'P' is shifted right by 12 spaces (M) => B
//       2) 'i' is shifted right by 4 spaces  (E) => m
//       ...
//       5) 'a' is shifted right by 12 spaces again (M) => m
// - Casing is preserved
// - Non-alphabetic characters are preserved but not shifted

// Questions:
// 1) Can the given keyword ever contain any non-alphabetic characters?
// => No
// 2) Can we assume that both inputs will always be valid?
// => Yes (plaintext may validly contain non-alphabetic characters which is fine)

// Data:
// 0-indexed alphabet:
//   0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
//   A B C D E F G H I J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z 
// Plaintext (string)
// - Iterate over characters of plaintext and transform each character
//   > Figure out the current keyword character -> Find the shift value (index)
//     of the current keyword character -> Apply the shift (index of current
//     plaintext character + index of current keyword character)
// - For each character:
//   - Calculate the alphabet index of the current plaintext character
//   - Calculate the alphabet index of the current keyword character
//     > Divide the current index by keyword.length and take the remainder
//       (Modulo => Coerce index to 0...keyword.length range)
//     > keyword[keywordIndex]

// ** MAYBE NOT ** 
// ?? Array of substrings where each substring contains n characters from plaintext?
// eg. ['pine', 'appl', 'e']
// Why? => As we iterate over each substring, the index resets (0..keyword.length - 1)
//         Which we can use to access the current keyword character
// * regex: /.{1, keyword.length}/g (any character between 1 - keyword length times)
// * new RegExp(`/.{1, ${keyword.length}}`, 'g')



// Algorithm:
// Given two strings as input, `plaintext` and `keyword`:
// Initialize a 0-indexed alphabet (string)
// > ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
// 1) Iterate over plaintext. For each character, transform the character:
// 2) If the current plaintext character is a letter, return a shifted version of 
//    the character, based on the current keyword character's index
//    > Standardize case to uppercase
//    > Find the alphabet index of the uppercase plaintext character

//    * Obtain keyword index:
//    > Maintain a separate index manually (can't rely on built-in index because
//      non-letters will mess with it)
//      - Initialize keywordIndex to 0 before loop
//      - Within the letter if-case, increment index by 1 and modulo by keyword length
//        after each letter

//    > Find the alphabet index of the keyword character at keyword Index
//    > Add plaintext alphabet index + keyword alphabet index => Find the character
//      in ALPHABET at the resulting index
//    > If plaintext -WAS- lowercase, return character.toLower; otherwise, char.toUpper
// 3) If the current plaintext character is not a letter, return it as-is
// 4) Join the array of transformed characters back into string => return

const ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

function vigenereCipher(plaintext, keyword) {
  let keywordIndex = 0;

  return plaintext.split('').map(char => {
    if (isLetter(char)) {
      let keywordChar = keyword[keywordIndex];
      let keywordAlphabetIndex = ALPHABET.indexOf(keywordChar.toUpperCase());
      keywordIndex = (keywordIndex + 1) % keyword.length;

      return rotateChar(char, keywordAlphabetIndex);
    } else {
      return char;
    }
  }).join('');
}

function isLetter(char) {
  return /[a-zA-Z]/.test(char);
}

function rotateChar(char, shiftFactor) {
  let wasLowerCase = char.toLowerCase() === char;
  let workingChar  = char.toUpperCase();

  let alphabetIndex = ALPHABET.indexOf(workingChar);
  let rotatedIndex  = (alphabetIndex + shiftFactor) % ALPHABET.length;

  let rotatedChar   = ALPHABET[rotatedIndex];

  return wasLowerCase ? rotatedChar.toLowerCase() : rotatedChar;
}

// Examples:
// Simple example
console.log(vigenereCipher('hello', 'hi')); //=> 'omstv'
// // Case does not matter for either plaintext or keyword:
console.log(vigenereCipher('HELLO', 'hi')); //=> 'OMSTV'
console.log(vigenereCipher('hello', 'HI')); //=> 'omstv'
console.log(vigenereCipher('HELLO', 'HI')); //=> 'OMSTV'

// Non-alphabetic characters are ignored (but preserved)
console.log(vigenereCipher('h ello!!', 'hi')); //=> 'o mstv!!'

// Shift overflows will wrap around:
console.log(vigenereCipher('xyz', 'abc')); //=> xzb

// Given Example:
console.log(vigenereCipher("Pineapples don't go on pizzas!", 'meat')); 
//=> Bmnxmtpeqw dhz'x gh ar pbldal!
