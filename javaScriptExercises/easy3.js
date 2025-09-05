// How old is Teddy?
// - Build a program that randomly generates Teddy's age and logs it to the 
//   console. Age should be random between 20-200, inclusive.

// function randomIntInclusive(min, max) {
//   return Math.floor(Math.random() * (max - min + 1) + min);
// }

// console.log(`Teddy is ${randomIntInclusive(20, 200)} years old!`);

// Further Exploration: 
// - According to the MDN documentation, using Math.round() would cause the
//   randomly-generated numbers to follow a non-uniform distribution (ie. not
//   be distributed randomly).
// - We could guard against the case where `min` and `max` were mixed up by
//   sorting them in order first and reassigning the variables accordingly, before
//   performing any calculations.


// ==============================================================================


// Searching 101
// Write a program that asks the user for 6 numbers and logs a message that
// describes whether the sixth number appears in the first 5 numbers.
// const rlSync = require('readline-sync');

// let numbers = [];
// for (let i = 1; i < 6; i++) {
//   let number = Number(rlSync.question(`Enter the ${ordinalString(i)} number: `));
//   numbers.push(number);
// }

// let lastNumber = Number(rlSync.question('Enter the last number: '));

// if (numbers.includes(lastNumber)) {
//   console.log(`The number ${lastNumber} appears in ${numbers}.`);
// } else {
//   console.log(`The number ${lastNumber} does not appear in ${numbers}.`);
// }

// function ordinalString(number) {
//   const NUMBER_SUFFIXES = { 1: 'st', 2: 'nd', 3: 'rd' };

//   let numberTail = String(number).slice(-2);
//   let lastChar = numberTail[numberTail.length - 1];
//   let secondLastChar = numberTail[numberTail.length - 2];

//   if (secondLastChar === '1') {
//     suffix = 'th';
//   } else {
//     suffix = NUMBER_SUFFIXES[lastChar] || 'th';
//   }

//   return `${number}${suffix}`;
// }

// Further Exploration:
// - If the problem was looking for a number that satisfies a certain condition
//   (eg. greater than 25), would the current solution still work? 
// The current solution would not work, because it uses `includes` to check for
// strictly equal elements. To fix this, we could instead change the final 
// conditional to filter the `numbers` array as needed; for example, checking if 
// there are any numbers greater than the final given number.

// eg. Example Implementation:

// if (numbers.some(num => num > lastNumber)) {
//   console.log(`At least one number in ${numbers} is greater than ${lastNumber}.`);
// } else {
//   console.log(`${lastNumber} is greater than everything in ${numbers}.`);
// }


// =======================================================================


// When will I retire?
// - Build a program that logs when the user will retire, and how many more years
//   the user has to work until retirement.
// const rlSync = require('readline-sync');

// let currentAge = Number(rlSync.question('What is your age? '));
// let retirementGoal = Number(rlSync.question('What age would you like to retire by? '));
// let currentYear = (new Date).getFullYear();

// let yearsTilRetirement = retirementGoal - currentAge;
// let retirementYear = currentYear + yearsTilRetirement;

// console.log(`It's currently ${currentYear}.` + 
//   `You will retire in ${retirementYear}`);

// console.log(`You only have ${yearsTilRetirement} years of work to go!`);

// Further Exploration
// - if the `new` keyword wasn't used in defining the `today` variable on Line 4,
//   the constructor would return a string representation of the corresponding
//   Date object.


// ===========================================================================


// Palindromic Strings (1)
// - Write a function that returns true if the given string is a palindrome, or
//   false otherwise.
// - For this problem, case matters, and all characters should be considered.

// let isPalindrome = function(string) {
//   let reversedString = [...string].reverse().join('');

//   return string === reversedString;
// }

// console.log(isPalindrome('madam'));               // true
// console.log(isPalindrome('Madam'));               // false (case matters)
// console.log(isPalindrome("madam i'm adam"));      // false (all characters matter)
// console.log(isPalindrome('356653'));              // true


// Palindromic Strings (2)
// - Write a version of the isPalindrome function that is case-insensitive, and
//   ignores all non-alphanumeric characters.
// let isPalindrome = function(string) {
//   let reversedString = [...string].reverse().join('');

//   return string === reversedString;
// }

// let isRealPalindrome = function(string) {
//   let cleanedString = string.toLowerCase().replaceAll(/[^0-9a-z]/g, '');

//   return isPalindrome(cleanedString);
// }

// console.log(isRealPalindrome('madam'));               // true
// console.log(isRealPalindrome('Madam'));               // true (case does not matter)
// console.log(isRealPalindrome("Madam, I'm Adam"));     // true (only alphanumerics matter)
// console.log(isRealPalindrome('356653'));              // true
// console.log(isRealPalindrome('356a653'));             // true
// console.log(isRealPalindrome('123ab321'));            // false


// Palindromic Number
// - Write a function that returns true if its integer argument is palindromic, 
//   and false otherwise.

// const isPalindromicNumber = function(integer) {
//   let stringNumber = String(integer);

//   return isPalindrome(stringNumber);
// }

// const isPalindrome = function(string) {
//   let reversedString = [...string].reverse().join('');

//   return string === reversedString;
// }

// console.log(isPalindromicNumber(34543));        // true
// console.log(isPalindromicNumber(123210));       // false
// console.log(isPalindromicNumber(22));           // true
// console.log(isPalindromicNumber(5));            // true

// Further Exploration: 
// - Will this solution still work if the number begins with a 0? Why or why not?
// - The solution will not work if the given number begins with a 0: 
//   - If the number does not contain any digits greater than 8, it will be treated
//     as an octal number, and will be converted to a decimal as part of its 
//     evaluation. This conversion occurs before any other operation; for example,
//     calling String(040) would first convert 040 to 32, then 32 to a string.
//   - If the number does contain 8 or 9, the number is maintained as a decimal,
//     but the leading 0 is stripped. For example, String(090) would convert 090
//     to 90, then 90 to '90'.
// - It would be difficult to address this issue. While it's possible to convert
//   an octal number to a string representation by specifying the base (eg. 
//   `040.toString(8) => '40'`), there would be no way to check for the presence of
//   a leading 0 to possibly add it back to the string.


// ========================================================================


// Running Totals
// - Write a function that takes an array of numbers and returns an array with
//   the same number of elements, but with each element's value being the running
//   total (sum) from the original array.

// function runningTotal(numbers) {
//   let sum = 0;

//   return numbers.map(number => sum += number );
// }

// console.log(runningTotal([2, 5, 13]));             // [2, 7, 20]
// console.log(runningTotal([14, 11, 7, 15, 20]));    // [14, 25, 32, 47, 67]
// console.log(runningTotal([3]));                    // [3]
// console.log(runningTotal([]));                     // []


// Letter Swap
// - Write a function that takes a string of space-separated words and swaps the
//   first and last letters of every word.
// - Assume that every word contains at least one letter, and that the string
//   will always contain at least one word.
// - Assume that each string contains only words and spaces, with no leading or
//   trailing or repeated spaces.

// function swap(sentence) {
//   let words = sentence.split(' ');

//   let swappedWords = words.map(function(word) {
//     if (word.length === 1) return word;

//     return word[word.length - 1] + word.slice(1, -1) + word[0];
//   })

//   return swappedWords.join(' ');
// }

// console.log(swap('Oh what a wonderful day it is'));  // "hO thaw a londerfuw yad ti si"
// console.log(swap('Abcde'));                          // "ebcdA"
// console.log(swap('a'));                              // "a"


// =========================================================
// Letter Counter (1)
// - Write a function that takes a string (containing 1+ space-separated words)
//   and returns an object where the keys are word lengths, and the values are the
//   number of words with that length in the given string.

// function wordSizes(sentence) {
//   let lengthCounts = {};

//   let words = sentence.split(' ');

//   words.forEach(function(word) {
//     let wordLength = word.length;
//     if (wordLength === 0) return;

//     lengthCounts[wordLength] = lengthCounts[wordLength] || 0;
//     lengthCounts[wordLength] += 1;
//   })

//   return lengthCounts;
// }


// console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
// console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 1, "7": 2 }
// console.log(wordSizes("What's up doc?"));                              // { "2": 1, "4": 1, "6": 1 }
// console.log(wordSizes(''));                                            // {}


// Letter Counter (2)
// - Modify the previous solution to exclude non-letters when determining word
//   sizes. 
// - eg. "it's" has a length of 3, not 4.

function wordSizes(sentence) {
  let lengthCounts = {};
  let words = sentence.split(' ');

  words.forEach(function(word) {
    let cleanedWord = word.replaceAll(/[^a-zA-Z]/g, '');
    let wordLength = cleanedWord.length;
    if (wordLength === 0) return;

    lengthCounts[wordLength] = lengthCounts[wordLength] || 0;
    lengthCounts[wordLength] += 1;
  })

  return lengthCounts;
}


console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 2 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 3 }
console.log(wordSizes("What's up doc?"));                              // { "5": 1, "2": 1, "3": 1 }
console.log(wordSizes(''));                                            // {}