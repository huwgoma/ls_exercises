// Word to Digit
// - Write a function that takes a string (sentence) as argument and returns the
//   same string with every occurrence of a 'number' word ('zero', 'one, 'two',
//   etc.) converted to its corresponding digit number.

// Questions:
// 1) Is it possible for number words to be decimals and/or negative?
//    eg. "negative one" or "one point five"
// => Not right now (further exploration)

// 2) Is there a maximum possible value for number words? 
//    eg. Do we need to handle "fifty five", "one hundred", etc.? Or only 0-9?
// => Only 0-9

// 3) What should be done about compound words (eg. four-score)?
// => Leave them as-is (do not replace)

// 4) Should case be insensitive? (eg. One => 1)
// => Yes

// Input: 
// - A String (sentence)
// Output:
// - A new String: same sentence, but with number words (zero-nine) replaced with
//   the corresponding digits (0-9)

// Data: 
// `sentence` - A string of words (space-separated)
// > Split sentence into words based on spaces
// * This might result in some words being attached to their trailing punctuation
//   eg. 'two three four.' => ['two', 'three', 'four.']

// Create a dictionary mapping numeric words to their digit forms:
// eg. { 'zero': 0, 'one': 1, 'two': 2, ... }

// Iterate over words. For each word:
// -- Transform the word; if it's a standalone number word, convert it to a 
//    digit; otherwise, leave it as-is

// 1) Standardize the casing of the word to lowercase
// 2) Extract the word from the punctuation
//    > Split on word boundaries
//    ** If the word is compound (eg. four-score), we do NOT want to replace the
//       numeric word.
// 3) Check if the extracted word exists in the number dictionary; if it does,
//    replace it with the dictionary[word] value + punctuation. Otherwise, replace
//    it with word + punctuation.
// 4) => Array of transformed words => Join and return

function wordToDigit(sentence) {
  const NUMBER_DICTIONARY = { 
    zero: 0, one: 1, two: 2, three: 3, four: 4,
    five: 5, six: 6, seven: 7, eight: 8, nine: 9,
  }

  let words = sentence.split(' ');

  return words.map(word => {
    let [ wordOnly, punctuation, ...other ] = word.toLowerCase().split(/\b/);
    
    if (NUMBER_DICTIONARY.hasOwnProperty(wordOnly) && other.length === 0) {
      punctuation ||= '';
      return NUMBER_DICTIONARY[wordOnly] + punctuation;
    } else {
      return word;
    }
  }).join(' ');
}

// Alternative Approach (Given): 
// - Instead of iterating through word, iterate through NUMBER DICTIONARY and 
//   replace all occurrences of each number word with the corresponding digit.

function wordToDigit(sentence) {
  const NUMBER_DICTIONARY = { 
    zero: 0, one: 1, two: 2, three: 3, four: 4,
    five: 5, six: 6, seven: 7, eight: 8, nine: 9,
  }

  Object.keys(NUMBER_DICTIONARY).forEach(numericWord => {
    let searchPattern = new RegExp(`(?<!\\w[^ ])\\b${numericWord}\\b(?![^ ]\\w)`, 'ig');
    sentence = sentence.replaceAll(searchPattern, NUMBER_DICTIONARY[numericWord]);
  });

  return sentence;
}

// Examples:
// - Simple Example
console.log(wordToDigit('one two three four')); // 1 2 3 4
// - Case-insensitive
console.log(wordToDigit('One two thRee FOUR')); // 1 2 3 4
// - Can handle punctuation without removing it
console.log(wordToDigit('One! two!! thRee!!! FOUR!!!!')); // 1! 2!! 3!!! 4!!!!

// Compound (hyphen-joined) words involving numbers are not replaced (only standalones)
console.log(wordToDigit('four-score and seven years ago'));
// => "four-score and 7 years ago"
console.log(wordToDigit('score-four and seven years ago'));
// => "score-four and 7 years ago"

// Number words that happen to be part of another word are not replaced
console.log(wordToDigit('weight eight')); // 'weight 8'

// - Given Example
console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."

