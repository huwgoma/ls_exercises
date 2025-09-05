// 1 - Daily Double
// Write a function that takes a string argument and returns a new string containing
// the value of the original string, with all consecutive duplicate characters
// collapsed into a single character.

// function crunch(string) {
//   let result = '';

//   for (let i = 0; i < string.length; i++) {
//     let char = string[i];

//     if (char !== result[result.length - 1]) result += char;
//   }

//   return result;
// }

// Further Exploration: Solve this problem using a regular expression.
// - Match all occurrences where one character appears two or more times
//   consecutively
// - Replace with one occurrence of that character.
// /(\w)\1+/g - Match and capture alphanumeric word characters (\w), then match
// the same captured character (\1) - 1 or more times (for the second+ chars)
// - Replace each match with one character of the captured value:
// "$1" (references the capture group's number)

// function crunch(string) {
//   return string.replaceAll(/(\w)\1+/g, "$1");
// }

// console.log(crunch('ddaaiillyy ddoouubbllee'));   // "daily double"
// console.log(crunch('4444abcabccba'));              // "4abcabcba"
// console.log(crunch('ggggggggggggggg'));            // "g"
// console.log(crunch('a'));                          // "a"
// console.log(crunch(''));                           // ""


// 2 - Bannerizer
// Write a function that takes a string as input and writes it to the console
// within a box.

// function logInBox(text) {
//   let innerWidth = text.length + 2;

//   let borderLine = buildLine('+', '-', innerWidth);
//   let paddingLine = buildLine('|', ' ', innerWidth);
//   let textLine = '|' + padCenter(text, ' ', innerWidth) + '|';

//   console.log(borderLine);
//   console.log(paddingLine);
//   console.log(textLine);
//   console.log(paddingLine);
//   console.log(borderLine);
// }

// function buildLine(edge, body, width) {
//   return edge + body.repeat(width / body.length) + edge;
// }

// function padCenter(text, pad, width) {
//   let result = '';
//   result = text.padStart(text.length + (width - text.length) / 2, pad);

//   result = result.padEnd(width, pad);
//   return result;
// }


// 3 - Stringy Strings
// Write a function that takes one argument - a positive integer - and returns
// a string of alternating '1's and '0's, always starting with a '1'. The length
// of the returned string should match the given integer.

// function stringy(length) {
//   let string = '';
//   let nextNum = 1;

//   for (let i = 0; i < length; i++) {
//     string += nextNum;
//     nextNum = Number(!nextNum);
//   }

//   return string;
// }

// console.log(stringy(6));    // "101010"
// console.log(stringy(9));    // "101010101"
// console.log(stringy(4));    // "1010"
// console.log(stringy(7));    // "1010101"


// 4 (SKipped for now)


// 5 - Right Triangles
// - Write a function that takes a positive integer n as an argument and outputs 
//   a right triangle whose sides each have n stars. The hypotenuse should slope 
//   from the upper-right to lower-left corners.

// function triangle(n) {
//   for (let i = 1; i <= n; i++) {
//     let spaces = ' '.repeat(n - i);
//     let stars = '*'.repeat(i);

//     console.log(spaces + stars);
//   }
// }

// triangle(5);
//     *
//    **
//   ***
//  ****
// *****


// 6 - Madlibs
// - Create a madlib program that prompts for a noun, verb, adverb, and adjective,
//   then inserts them into a story.

// const rlSync = require('readline-sync');

// let noun = rlSync.question('Enter a noun: ');
// let verb = rlSync.question('Enter a verb: ');
// let adjective = rlSync.question('Enter an adjective: ');
// let adverb = rlSync.question('Enter an adverb: ');

// console.log(`Do you ${verb} your ${adjective} ${noun} ${adverb}? That's hilarious!`);


// 7 - Double doubles
// A double number is an even-length number whose left-side digits are the same as
// its right-side digits. 
// - eg. 44 (4/4), 103103 (103/103), etc.
// - 444 (44/4), 334433(334/433), and 107 (10/7) are NOT.
// Write a function that takes a number and returns it multiplied by 2. If the 
// argument is a double number, return it as-is (no multiply)

// function twice(number) {
//   if (isDouble(number)) {
//     return number;
//   } else {
//     return number * 2;
//   }
// }

// function isDouble(number) {
//   let strNum = String(number);
//   let halfIndex = strNum.length / 2;

//   let firstHalf = strNum.slice(0, halfIndex);
//   let secondHalf = strNum.slice(halfIndex);

//   return firstHalf === secondHalf;
// }

// // // Examples:
// console.log(twice(37));          // 74
// console.log(twice(44));          // 44; double
// console.log(twice(334433));      // 668866
// console.log(twice(444));         // 888
// console.log(twice(107));         // 214
// console.log(twice(103103));      // 103103; double
// console.log(twice(3333));        // 3333; double
// console.log(twice(7676));        // 7676; double


// 8 - Grade Book
// Write a function that determines the average of 3 given scores, and 
// returns the letter associated with that grade.
// 90 <= score <= 100: 'A'
// 80 <= score < 90: 'B'
// 70 <= score < 80: 'C'
// 60 <= score < 70: 'D'
// 0 <= score < 60: 'F'
// - Assume all grades will be between 0-100.

// function getGrade(score1, score2, score3) {
//   const GRADE_FLOORS = { 100: 'A', 90: 'A', 80: 'B', 70: 'C', 60: 'D' };

//   let average = (score1 + score2 + score3) / 3;
//   let flooredAverage = Math.floor(average / 10) * 10;

//   return GRADE_FLOORS[flooredAverage] || 'F';
// }

// // Examples:
// console.log(getGrade(95, 90, 93));    // "A"
// console.log(getGrade(50, 50, 95));    // "D"


// 9 - Clean up Words
// Write a function that takes a string and returns a new string with all non-alphabetic
// characters replaced by spaces.
// - If one or more non-alphabetic characters occur consecutively, they should be
//   replaced with only one space.

// function cleanUp(string) {
//   return string.replaceAll(/\W+/g, ' ');
// }

// // Example
// console.log(cleanUp("---what's my +*& line?"));    // " what s my line "


// 10 - What century is that?
// Write a function that takes a year as input and returns the century. The 
// return value should be a string that begins with the century number, and ends with
// st, nd, rd, or th as appropriate for that number. 
// eg. 1901-2000 => 20th century

function century(year) {
  const NUMBER_SUFFIXES = { 1: 'st', 2: 'nd', 3: 'rd' };

  let centuryNumStr = String(Math.ceil(year / 100));

  let lastChar = centuryNumStr[centuryNumStr.length - 1];
  let secondLastChar = centuryNumStr[centuryNumStr.length - 2];

  let centurySuffix = '';

  if (secondLastChar === '1') {
    centurySuffix = 'th';
  } else {
    centurySuffix = NUMBER_SUFFIXES[lastChar] || 'th';
  }

  return centuryNumStr + centurySuffix;
}

// Examples
console.log(century(2000));        // "20th"
console.log(century(2001));        // "21st"
console.log(century(1965));        // "20th"
console.log(century(256));         // "3rd"
console.log(century(5));           // "1st"
console.log(century(10103));       // "102nd"
console.log(century(1052));        // "11th"
console.log(century(1127));        // "12th"
console.log(century(11201));       // "113th"