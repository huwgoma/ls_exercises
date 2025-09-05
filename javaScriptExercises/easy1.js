// 1 - Odd Numbers

// Log all odd numbers from 1-99, inclusive, with each number on a separate line.
// for (let i = 1; i <= 99; i += 2) {
//   console.log(i);
// }

// 1 (FE): Add a way for the user to specify the upper limit of logged numbers.

// const rlSync = require('readline-sync');
// let limit = parseInt(rlSync.question(
//               'Please enter the upper limit for numbers to log: '
//             ), 10);

// for (let i = 1; i <= limit ; i++) {
//   if (i % 2 === 1) console.log(i);
// }


// 2 - Even Numbers (Same as #1, but with evens)

// for (let i = 2; i <= 99 ; i += 2) {
//   console.log(i);
// }


// 3 - Build a program that asks the user to enter the length and width of a room
//     in meters, then logs the room's area in square meters and square feet.
// - 1 square meter == 10.7639 square feet

// const rlSync = require('readline-sync');

// const SQMETERS_TO_SQFEET = 10.7639;

// console.log('Enter the length of the room in meters: ');
// let length = parseInt(rlSync.prompt(), 10);
// console.log('Enter the width of the room in meters: ');
// let width = parseInt(rlSync.prompt(), 10);

// let areaInMeters = length * width;
// let areaInFeet = areaInMeters * SQMETERS_TO_SQFEET;

// console.log(`The area of the room is ${areaInMeters.toFixed(2)} square meters ` +
//             `(${areaInFeet.toFixed(2)} square feet).`);


// 4 - Create a program that prompts the user for a bill amount and a tip rate,
//     then logs both the tip and the total bill amount to the console.
// const rlSync = require('readline-sync');

// let bill = parseInt(rlSync.question('What is the bill amount? '), 10);
// let tipPercent = parseInt(rlSync.question('What is the tip percentage? '), 10) / 100;

// let tipAmount = bill * tipPercent;

// console.log(`The tip is $${tipAmount.toFixed(2)}.`);
// console.log(`The total is $${(bill + tipAmount).toFixed(2)}.`);


// 5 - Write a program that asks the user to enter an integer greater than 0,
// then asks if the user wants to calculate the sum or product of all numbers 
// between 1 and the given integer, inclusive.

// const rlSync = require('readline-sync');
// const MODE_NAMES = { s: 'sum', p: 'product' }

// let limit;

// do {
//   limit = parseInt(rlSync.question('Please enter an integer greater than 0: '), 10);

//   if (limit <= 0 || Number.isNaN(limit)) console.log('Invalid input!');
// } while (limit <= 0 || Number.isNaN(limit));

// let mode = MODE_NAMES[rlSync.question(
//   'Enter "s" to compute the sum, or "p" to compute the product. '
// ).toLowerCase()];

// if (mode === undefined) { 
//   console.log('Invalid mode given - now exiting');
//   process.exit(); 
// }

// let numbers = [];
// for (let i = 1; i <= limit; i++) {
//   numbers.push(i);
// }

// let result; 
// switch (mode) {
//   case "sum":
//     result = numbers.reduce((sum, n) => sum + n, 0);
//     break;
//   case "product":
//     result = numbers.reduce((product, n) => product * n, 1);
//     break;
// }

// console.log(`The ${mode} of the integers between 1 and ${limit} is ${result}.`);


// 6 - Write a function that takes two strings as arguments, determines the length
//     of the two strings, then returns the result of concatenating the shorter
//     string, longer string, and shorter string again.
// - Assume the strings are of different lengths.

// function shortLongShort(str1, str2) {
//   let [short, long] = [str1, str2].sort((a, b) => a.length - b.length);

//   return short + long + short;
// }

// // Examples:
// console.log(shortLongShort('abc', 'defgh'));    // "abcdefghabc"
// console.log(shortLongShort('abcde', 'fgh'));    // "fghabcdefgh"
// console.log(shortLongShort('', 'xyz'));         // "xyz"


// 7 - Write a function that takes an integer representing years (> 0) and returns
//     true if the year is a leap year, and false otherwise.
// - A year is leap if it is divisible by 4
// - If the year is divisible by 100, it is not a leap year unless also divisible
//   by 400

// eg. 2000 is a leap year, but 2100 is not.
// - A year is leap if it is divisible by 400, or if it is divisible by 4 and 
//   not 100

// let divisibleBy400 = createDivisibleByChecker(400);
// let divisibleBy4   = createDivisibleByChecker(4);
// let divisibleBy100 = createDivisibleByChecker(100);

// function isLeapYear(year) {
//   return divisibleBy400(year) || (divisibleBy4(year) && !divisibleBy100(year))
// }

// function createDivisibleByChecker(divisor) {
//   return function(dividend) {
//     return dividend % divisor === 0
//   }
// }

// console.log(isLeapYear(2016));      // true
// console.log(isLeapYear(2015));      // false
// console.log(isLeapYear(2100));      // false
// console.log(isLeapYear(2400));      // true
// console.log(isLeapYear(240000));    // true
// console.log(isLeapYear(240001));    // false
// console.log(isLeapYear(2000));      // true
// console.log(isLeapYear(1900));      // false
// console.log(isLeapYear(1752));      // true
// console.log(isLeapYear(1700));      // false
// console.log(isLeapYear(1));         // false
// console.log(isLeapYear(100));       // false
// console.log(isLeapYear(400));       // true


// 8 - Prior to 1752, leap years occurred in any year evenly divisible by 4.
// - Update the isLeapYear function to determine leap years before and after 1752.
// - Note: 1752 was a leap year.

// function isLeapYear(year) {
//   let divisibleBy400 = createDivisibleByChecker(400);
//   let divisibleBy4   = createDivisibleByChecker(4);
//   let divisibleBy100 = createDivisibleByChecker(100);

//   if (year <= 1752) {
//     return divisibleBy4(year);
//   } else {
//     return divisibleBy400(year) || (divisibleBy4(year) && !divisibleBy100(year));
//   }
// }

// function createDivisibleByChecker(divisor) {
//   return function(dividend) {
//     return dividend % divisor === 0
//   }
// }

// console.log(isLeapYear(2016));      // true
// console.log(isLeapYear(2015));      // false
// console.log(isLeapYear(2100));      // false
// console.log(isLeapYear(2400));      // true
// console.log(isLeapYear(240000));    // true
// console.log(isLeapYear(240001));    // false
// console.log(isLeapYear(2000));      // true
// console.log(isLeapYear(1900));      // false
// console.log(isLeapYear(1752));      // true
// console.log(isLeapYear(1700));      // true
// console.log(isLeapYear(1));         // false
// console.log(isLeapYear(100));       // true
// console.log(isLeapYear(400));       // true


// 9 - Multiples of 3 and 5
// Write a function that calculates the sum of all numbers between 1 and a given
// number, inclusive, that are multiples of 3 or 5.

// function multisum(limit) {
//   let divisibleBy3 = createDivisibleByChecker(3);
//   let divisibleBy5 = createDivisibleByChecker(5);
//   let sum = 0;

//   for (let i = 1; i <= limit; i++) {
//     if (divisibleBy3(i) || divisibleBy5(i)) sum += i;
//   }

//   return sum;
// }

// function createDivisibleByChecker(divisor) {
//   return function(dividend) {
//     return dividend % divisor === 0
//   }
// }

// // Examples:
// console.log(multisum(3));       // 3
// console.log(multisum(5));       // 8
// console.log(multisum(10));      // 33
// console.log(multisum(1000));    // 234168


// 10 - UTF-16 String Value
// Write a function that returns the UTF-16 string value of a given string.
// - UTF-16 string value is the sum of all UTF-16 character values in the string.
// - Use String.prototype.charCodeAt() to determine the UTF-16 value of a character.

function utf16Value(string) {
  let sum = 0;

  for (let i = 0; i < string.length; i++) {
    sum += string[i].charCodeAt();
  }

  return sum;
}

console.log(utf16Value('Four score'));         // 984
console.log(utf16Value('Launch School'));      // 1251
console.log(utf16Value('a'));                  // 97
console.log(utf16Value(''));                   // 0

// The next three lines demonstrate that the code
// works with non-ASCII characters from the UTF-16
// character set.
const OMEGA = "\u03A9";             // UTF-16 character 'Ω' (omega)
console.log(utf16Value(OMEGA));                  // 937
console.log(utf16Value(OMEGA + OMEGA + OMEGA));  // 2811