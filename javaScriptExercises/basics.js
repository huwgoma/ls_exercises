// Building Strings
// const paragraph = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed \
//                 ligula at risus vulputate faucibus. Aliquam venenatis nibh ut justo dignissim \
//                 dignissim. Proin dictum purus mollis diam auctor sollicitudin. Ut in bibendum \
//                 ligula. Suspendisse quam ante, dictum aliquam tristique id, porttitor pulvinar \
//                 diam. Maecenas blandit aliquet ipsum. Integer vitae sapien sed nulla rutrum \   
//                 hendrerit ac a urna. Interdum et malesuada fames ac ante ipsum primis in faucibus.';

// console.log(paragraph);
// - This code should raise a SyntaxError, due to the trailing whitespace after the 
//   backslash on Line 6. When using the \ syntax to concatenate a multi-line
//   string, trailing whitespace cannot be present, or JavaScript will raise a 
//   SyntaxError.

// - Even after removing the trailing whitespace, the text output will contain
//   several spaces that are probably unintended, due to the indenting after each
//   newline. We can fix this by replacing the backslash concatenation syntax with
//   the regular concatenation syntax (+), although we would need to add a space for
//   each newline.

// ======================================================================

// Conditionals (Part 1)
// What is output by the program? Why?
// const myBoolean = true;
// const myString = 'hello';
// const myArray = [];
// const myOtherString = '';

// if (myBoolean) {
//   console.log('Hello'); // 'Hello' (myBoolean is true)
// }

// if (!myString) {
//   console.log('World'); // No output (myString is truthy, so !myString is false)
// }

// if (!!myArray) {
//   console.log('World'); // World (myArray is truthy, so !!myArray is true)
// }

// if (myOtherString || myArray) {
//   console.log('!');     // ! (myOtherString is falsy, but myArray is truthy -> true)
// }

// This code will output 'Hello' on Line 7, 'World' on Line 15, and '!' on Line 19,
// with no output on Line 11.
// - On Line 7, myBoolean has a value of true, so the conditional evaluates to true
//   and the enclosed code block is executed, outputting 'Hello' to the console.
// - On Line 11, myString has a value of 'hello', which is considered truthy. Therefore,
//   negating myString (!) produces a value of false, and the enclosed code block is
//   not executed.
// - On Line 15, myArray has a value of [], which is also considered truthy. Therefore,
//   negating myArray twice (!!) produces a value of true, and the enclosed code block
//   is executing, outputting 'World'.
// - On Line 19, myOtherString has a value of '', which is considered falsy. Therefore,
//   JavaScript moves on to evaluating the next operand, which is myArray ([]; truthy).
//   Since the || operator only requires one operand to be truthy to evaluate to truthy,
//   the enclosed code block is executed, outputting '!'.


// Conditionals Part 2 - How many unique execution paths are possible?
// if (condition1) {
//   // ...
//   if (condition2) {
//     // ...
//   } else {
//     // ...
//   }
// } else {
//   // ...
//   if (condition4) {
//     // ...
//     if (condition5) {
//     // ...
//     }
//   }
// }

// 1 - if condition 1 is true, and condition 2 is true
// 2 - if condition 1 is true, and condition 2 is false
// 3 - if condition 1 is false, and condition 4 and 5 are both true.
// 4 - if condition 1 is false, condition 4 is true, and condition 5 is false
// 5 - if condition 1, 4, and 5 are all false.

// ======================================================================

// String Assignment
// - What does this code log to the console? Why?
// const myName = 'Bob';
// const saveName = myName;
// myName.toUpperCase();
// console.log(myName, saveName);

// This code should output 'Bob Bob'.
// Lines 1 and 2 initialize two constants, myName and saveName, and assign them to
// the same string ('Bob').
// Line 3 calls the toUpperCase() method on myName, returning an uppercased version
// of the string ('BOB'). However, this does not mutate the original string, as 
// strings are immutable in JavaScript.
// Therefore, on Line 4, myName and saveName both still reference the string 'Bob'.

// How is a primitive value ('Bob') able to call a method (toUpperCase())?
// - JavaScript creates a temporary String object which acts as a wrapper around
//   the string value, which has access to all methods defined on String.prototype.
//   the method is executed on the temporary String object, and the wrapper is 
//   discarded after the method returns. 

// ======================================================================

// Arithmetic Integer
// Write a program that prompts the user for two positive integers, then prints the
// results of the following operations on the two integers: addition, subtraction,
// product, quotient, remainder, and power. 
// - Do not worry about validation.
// let rlSync = require('readline-sync');
// let firstNumber = parseInt(rlSync.question('Enter the first number:\n'));
// let secondNumber = parseInt(rlSync.question('Enter the second number:\n'));

// console.log(`${firstNumber} + ${secondNumber} = ${firstNumber + secondNumber}`);
// console.log(`${firstNumber} - ${secondNumber} = ${firstNumber - secondNumber}`);
// console.log(`${firstNumber} * ${secondNumber} = ${firstNumber * secondNumber}`);
// console.log(`${firstNumber} / ${secondNumber} = ${Math.floor(firstNumber / secondNumber)}`);
// console.log(`${firstNumber} % ${secondNumber} = ${firstNumber % secondNumber}`);
// console.log(`${firstNumber} ** ${secondNumber} = ${firstNumber ** secondNumber}`);

// ======================================================================
// Count Characters
// - Write a program that asks the user for a phrase, then outputs the number of
//   characters in the phrase.

// let rlSync = require('readline-sync');
// let phrase = rlSync.question('Please enter a phrase: ');

// console.log(`There are ${phrase.length} characters in "${phrase}".`)

// // - Next, refactor the program so it ignores spaces.
// let removedSpaces = phrase.replaceAll(/\s/g, '');
// console.log(`Ignoring spaces, there are ${removedSpaces.length} characters in` +
//             ` "${phrase}".`)

// // - Finally, refactor the program so it only counts alphabetic characters.
// let alphabeticOnly = phrase.replaceAll(/\W/g, '');
// console.log(`Counting only alphabetic characters, there are` +
//             ` ${alphabeticOnly.length} characters in "${phrase}".`);

// ======================================================================
// Convert a String to a Number
// - Write a function that takes a string of digits as an argument and returns
//   the appropriate number. 
// - Do not use any built-in conversion string->number functions
// - Do not worry about leading +/- signs, and do not worry about invalid characters.

// const DIGITS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

// function stringToInteger(string) {
//   const DECIMAL_BASE = 10;

//   let stringDigits = string.split('').reverse();
  
//   return stringDigits.reduce(function(sum, strDigit, index) {
//     let digit = DIGITS[strDigit];
//     let weight = digit * (DECIMAL_BASE ** index);

//     return sum + weight;
//   }, 0);
// }

// console.log(stringToInteger('4321')); //=> 4321
// console.log(stringToInteger('570'));  //=> 570

// Convert a String to a Signed Number
// - Modify the previous function to optionally accept a leading sign (+/-) and
//   return the corresponding number. If no sign, return a positive number.

// const DIGITS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
// const DECIMAL_BASE = 10;

// function stringToSignedInteger(string) {
//   let firstChar = string.charAt(0);
//   let polarity = 1;

//   if (/[+-]/.test(firstChar)) { 
//     string = string.slice(1);
//     polarity = (firstChar == '-') ? -1 : 1;
//   }

//   let stringDigits = string.split('').reverse();
  
//   let absoluteSum = stringDigits.reduce(function(sum, strDigit, index) {
//     let digit = DIGITS[strDigit];
//     let weight = digit * (DECIMAL_BASE ** index);

//     return sum + weight;
//   }, 0);

//   return absoluteSum * polarity;
// }

// Solution reusing previous function:
// function stringToSignedInteger(string) {
//   switch (string.charAt(0)) {
//     case '+':
//       return stringToInteger(string.slice(1));
//     case '-': 
//       return -stringToInteger(string.slice(1));
//     default: 
//       return stringToInteger(string);
//   };
// }

// function stringToInteger(string) {
//   let stringDigits = string.split('').reverse();
  
//   return stringDigits.reduce(function(sum, strDigit, index) {
//     let digit = DIGITS[strDigit];
//     let weight = digit * (DECIMAL_BASE ** index);

//     return sum + weight;
//   }, 0);
// }

// console.log(stringToSignedInteger('4321'));  //=> 4321
// console.log(stringToSignedInteger('-570'));  //=> -570
// console.log(stringToSignedInteger('+100'));  //=> 100


// ======================================================================
// Convert Number to String
// - Write a function that takes a positive or zero integer and converts it
//   to a string representation.
// - Do not use any standard conversion functions such as String(), toString, or
//   '' + number.

// const STRING_DIGITS = { 
//   0: '0', 1: '1', 2: '2', 3: '3', 4: '4', 
//   5: '5', 6: '6', 7: '7', 8: '8', 9: '9' 
// };

// const DECIMAL_BASE = 10;

// function integerToString(int) {
//   if (int === 0) return '0';

//   let string = ''

//   for (let placeValue = 1; placeValue <= int; placeValue *= DECIMAL_BASE) {
//     let placeDigit = Math.floor(int / placeValue) % 10;

//     string = STRING_DIGITS[placeDigit] + string;
//   }

//   return string;
// }

// Alternate solution that guards against the 0 case without an explicit guard clause
// - Iterate through digits from ones, working right
// For each digit:
// - Divide number by 10 and take the remainder (4321 % 10 -> 1)
//  - Set number = number without the last digit (4321 -> 432)
//    - Do this by dividing number by 10 (4321 -> 432.1) and flooring (432)
//  - Convert digit to string and add to front of string
// - Repeat while number is greater than 0

// const STRING_DIGITS = { 
//   0: '0', 1: '1', 2: '2', 3: '3', 4: '4', 
//   5: '5', 6: '6', 7: '7', 8: '8', 9: '9' 
// };

// const DECIMAL_BASE = 10;

// function integerToString(int) {
//   let string = '';

//   do {
//     let placeDigit = int % 10;
//     int = Math.floor(int / 10);
//     string = STRING_DIGITS[placeDigit] + string;
//   } while (int > 0);

//   return string;
// };

// // Examples:
// console.log(integerToString(4321));      // "4321"
// console.log(integerToString(0));         // "0"
// console.log(integerToString(1));         // "1"
// console.log(integerToString(10));         // "10"
// console.log(integerToString(5000));      // "5000"


// Convert a Signed Number to a String
// - Extend the previous number->string function by adding the ability to represent
//   signed (+/-) numbers.
const STRING_DIGITS = { 
  0: '0', 1: '1', 2: '2', 3: '3', 4: '4', 
  5: '5', 6: '6', 7: '7', 8: '8', 9: '9' 
};

const DECIMAL_BASE = 10;

function integerToString(int) {
  let string = '';

  do {
    let placeDigit = int % 10;
    int = Math.floor(int / 10);
    string = STRING_DIGITS[placeDigit] + string;
  } while (int > 0);

  return string;
};

function signedIntegerToString(int) {
  if (int > 0) {
    return `+${integerToString(int)}`;
  } else if (int < 0) {
    return `-${integerToString(Math.abs(int))}`;
  } else {
    return integerToString(int);
  }
}

// Examples:
console.log(signedIntegerToString(4321));      // "+4321"
console.log(signedIntegerToString(-123));      // "-123"
console.log(signedIntegerToString(0));         // "0"

// Further Exploration
console.log(signedIntegerToString(-0) === '-0'); //=> false; outputs "0"
// This outputs 0 because JavaScript considers 0 and -0 to be equal; therefore, 
// accessing STRING_DIGITS[-0] will return '0'.

// To fix this, we could extend the negative case in signedIntegerToString to
// additionally check for -0, and therefore prepend '-' to -0:
// eg. else if (int < 0) or (Object.is(-0, int))
//      return - integerToString(Absolute(int))

// function signedIntegerToString(int) {
//   if (int > 0) {
//     return `+${integerToString(int)}`;
//   } else if (int < 0 || Object.is(-0, int)) {
//     return `-${integerToString(Math.abs(int))}`;
//   } else {
//     return integerToString(int);
//   }
// }