// Now I know my ABCs
// A collection of spelling blocks has 2 letters per block, as shown below:

// B:O   X:K   D:Q   C:P   N:A
// G:T   R:E   F:S   J:W   H:U
// V:I   L:Y   Z:M

// Words spelled using this pairing system can only use one letter from each block,
// and each block only once.

// Write a function that takes a string as an argument (word) and returns true 
// if `word` can be spelled using the letterblock system above, false otherwise.

// Questions:
// 1) Can we assume that `word` will always be present, valid, and/or non-empty?
// => Yes to all
// 2) Will `word` ever contain any non-alphabetic characters?
// => Yes (Ignore them)

// Rules/Patterns:
// - Letters are case-insensitive (ie. if 'B' is used, you cannot reuse 'B', 'b',
//   'o', or 'O)
// 

// Data:
// - Standardize casing and remove non-alphabetic characters before parsing 
// - Define a 2-way map for the letter blocks:
//   eg. { B: 'O', O: 'B', X: 'K', K: 'X', ...}
//   - Repeating key/value pairs (flipped) allows for 2-way access
// - Initialize a blocksUsed object that tracks which letter blocks have been used
//   as we iterate over the string (next)
// - Iterate over the cleaned string and check if each character's letter block 
//   has been used.
//   if (blocksUsed[currentChar]) => return false
//   > Otherwise, register the current character, along with its partner, to 
//     blocksUsed 
//     > partnerChar = LETTERBLOCKS[currentChar]
//       blocksUsed[currentChar] = true, blocksUsed[partnerChar] = true
// - If end of iteration is reached, return true

const LETTER_BLOCKS = {
  B: 'O', O: 'B',   X: 'K', K: 'X',   D: 'Q', Q: 'D',
  C: 'P', P: 'C',   N: 'A', A: 'N',   G: 'T', T: 'G',
  R: 'E', E: 'R',   F: 'S', S: 'F',   J: 'W', W: 'J',
  H: 'U', U: 'H',   V: 'I', I: 'V',   L: 'Y', Y: 'L',
  Z: 'M', M: 'Z',
}

function isBlockWord(word) {
  let cleanedWord = word.toUpperCase().replaceAll(/[^A-Z]/g, '');

  let blocksUsed = {};

  // Every character in word must be block-unique (no repeats of blocksUsed)
  return cleanedWord.split('').every(char => {
    if (blocksUsed[char]) return false;

    let partnerChar = LETTER_BLOCKS[char];
    blocksUsed[char] = true;
    blocksUsed[partnerChar] = true;

    return true;
  });
}

// Examples:
// Cannot repeat the same letter
console.log(isBlockWord('meet')); // false ('e' appears twice)
// Cannot repeat partner letters
console.log(isBlockWord('merk')); // false ('e' and 'r' are partners)

// Case-insensitive:
console.log(isBlockWord('meEt')); // false ('e' and 'E' are repeats)
console.log(isBlockWord('mErk')); // false ('E' and 'r' are partners)

// Non-alphabetic characters are ignored
console.log(isBlockWord('batch111')); // true
console.log(isBlockWord('batch!!!')); // true

// Given:
console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true