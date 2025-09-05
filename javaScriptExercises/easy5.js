// Double Char (1)
// - Write a function that takes a string, doubles every character in the string,
//   and returns the result as a new string.

// function repeater(string) {
//   let stringChars = string.split('');

//   return stringChars.map(char => char.repeat(2)).join('');
// }

// console.log(repeater('Hello'));        // "HHeelllloo"
// console.log(repeater('Good job!'));    // "GGoooodd  jjoobb!!"
// console.log(repeater(''));             // ""


// Double Char (2)
// - Write a function that takes a string, doubles every consonant character in
//   the string, and returns the result as a new string.
// - do not double vowels (aeiou), digits, punctuation, or whitespace - only 
//   consonants

// function doubleConsonants(string) {
//   const CONSONANTS = /[b-df-hj-np-tv-z]/i;

//   let stringChars = [...string];

//   return stringChars.map(char => {
//     return (CONSONANTS.test(char)) ? char.repeat(2) : char;
//   }).join('');
// }

// console.log(doubleConsonants('String'));          // "SSttrrinngg"
// console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
// console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
// console.log(doubleConsonants(''));                // ""


// Reverse Number
// - Write a function that takes a positive integer and returns a new number with
//   the digits of the given number reversed.

// function reverseNumber(integer) {
//   let stringDigits = integer.toString().split('');

//   return parseInt(stringDigits.reverse().join(''), 10);
// }

// console.log(reverseNumber(12345));    // 54321
// console.log(reverseNumber(12213));    // 31221
// console.log(reverseNumber(456));      // 654
// console.log(reverseNumber(12000));    // 21 -- Note that zeros get dropped!
// console.log(reverseNumber(1));        // 1


// Get the middle character
// - Write a function that takes a non-empty string and returns the middle 
//   character(s).
// - If string is odd length, return the middle character (eg. Lunch -> n)
// - If even, return the middle 2 characters (eg. Launch -> un)

// function centerOf(string) {
//   const substringSize = (string.length % 2 === 0) ? 2 : 1;
//   let startIndex = (string.length - substringSize) / 2;
//   let endIndex = startIndex + substringSize;

//   return string.slice(startIndex, endIndex);
// }

// console.log(centerOf('I Love JavaScript')); // "a"
// console.log(centerOf('Launch School'));     // " "
// console.log(centerOf('Launch'));            // "un"
// console.log(centerOf('Lunch'));            // "n"
// console.log(centerOf('Launchschool'));      // "hs"
// console.log(centerOf('x'));                 // "x"


// Always return negative
// - Write a function that takes a number as an argument. If the argument is a 
//   positive number, return the negative of that number; if it's a negative 
//   number, return it as-is.

// function negative(number) {
//   return -Math.abs(number);
// }

// console.log(negative(5));     // -5
// console.log(negative(-3));    // -3
// console.log(negative(0));     // -0


// Counting Up
// - Write a function that takes an integer argument and returns an array 
//   containing all integers between 1 and the argument (inclusive) in
//   ascending order.
// - assume the argument will always be a positive integer.

// function sequence(limit) {
//   let range = [];

//   for (let i = 1; i <= limit; i++) {
//     range.push(i);
//   }

//   return range;
// }

// console.log(sequence(5));    // [1, 2, 3, 4, 5]
// console.log(sequence(3));    // [1, 2, 3]
// console.log(sequence(1));    // [1]


// Name Swapping
// - Write a function that takes a string argument consisting of a first name,
//   space, and last name, and returns a new string consisting of the last name,
//   comma, space, and first name.

// function swapName(name) {
//   let [ firstName, lastName ] = name.split(' ');

//   return `${lastName}, ${firstName}`;
// }

// console.log(swapName('Joe Roberts'));    // "Roberts, Joe"

// Further Exploration: What if the person has more than one first name?
// - Refactor the current solution to accomodate this.

// function swapName(name) {
//   // Assumes that there is only one last name
//   let [ lastName, ...firstNames ] = name.split(' ').reverse();
//   let firstName = firstNames.reverse().join(' ');

//   return `${lastName}, ${firstName}`;
// }

// Alternate Solution
// function swapName(name) {
//   // Assumes that there is only one last name
//   let names = name.split(' ');
//   let lastName = names.pop();
//   let firstName = names.join(' ');

//   return `${lastName}, ${firstName}`;
// }

// console.log(swapName('Joe Roberts'));    // "Roberts, Joe"
// console.log(swapName('Hugo Alexander Ma'));  // Expected output: "Ma, Hugo Alexander"


// Sequence Count
// - Write a function that takes two integers as arguments:
//   - count
//   - start of sequence
// - Returns an array with `count` elements, where each element is a multiple of
//   the starting number.
// - count will always be >= 0 (if 0, return [])
// - starting number can be any number.

// function sequence(count, start) {
//   let result = [];

//   for (let i = 1; i <= count; i++) {
//     let nextInSequence = start * i;
//     result.push(nextInSequence);
//   }

//   return result;
// }


// console.log(sequence(5, 1));          // [1, 2, 3, 4, 5]
// console.log(sequence(4, -7));         // [-7, -14, -21, -28]
// console.log(sequence(3, 0));          // [0, 0, 0]
// console.log(sequence(0, 1000000));    // []


// Reverse it (1)
// - Write a function that takes a string argument and returns a new string 
//   containing the words from the string argument in reverse order.
// - Assume that words are space-separated.

// Buggy Solution
// function reverseSentence(string) {
//   return string.split('').reverse().join('');
// }

// This solution will reverse the order of -characters- in the string, not the 
// order of words. The point of failure is in the delimiter argument passed to
// `String.split()` - because we are splitting on empty strings, the resulting
// array will contain every individual character from the given string. From there,
// the array of characters is reversed and joined back together, resulting in a 
// character-reversed string.
// - To fix this, we would need to change the split condition from an empty string
//   (`''`) to a single-space string (`' '`).
// function reverseSentence(sentence) {
//   let words = sentence.split(' ');

//   return words.reverse().join(' ');
// }

// console.log(reverseSentence(''));                       // ""
// console.log(reverseSentence('Hello World'));            // "World Hello"
// console.log(reverseSentence('Reverse these words'));    // "words these Reverse"


// Reverse it (2)
// - Write a function that takes a string argument containing 1+ words and returns
//   a new string. The new string should have:
//   - the words from the given string, with
//   - all 5+ letter words character-reversed
// - assume words are space-separated

function reverseWords(sentence) {
  let words = sentence.split(' ');

  return words.map(word => {
    return word.length >= 5 ? reverseString(word) : word;
  }).join(' ');
}

function reverseString(string) {
  return string.split('').reverse().join('');
}

console.log(reverseWords('Professional'));             // "lanoisseforP"
console.log(reverseWords('Walk around the block'));    // "Walk dnuora the kcolb"
console.log(reverseWords('Launch School'));            // "hcnuaL loohcS"