// Fibonacci Number - Location by Length
// 
// The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21)
// that is calculated by adding the 2 previous numbers to obtain the current number.
// > The first two numbers are always 1, by definition.

// Write a function that calculates and returns the index of the first Fibonacci
// number that has the number of digits specified by the argument.
// - The first Fibonacci number's index is 1, not 0.
// - Assume that the argument (number of digits) is always an integer greater 
//   than or equal to 2.

// Example Fibonacci Sequence:
// Sequence: 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597
// Index(1): 1 2 3 4 5 6  7  8  9 10 11  12  13  14  15  16   17


// Questions:
// - Is it possible for two consecutive numbers in the sequence to be so large 
//   that their number of digits skips over a number?
//   eg. 9999 + 9999 results in a number with 5 digits; is it possible for the 
//       numbers being summed to be so large that it skips (for example) 6 digits
//       and jumps straight to 7?
// => No - Adding 2 positive integers can increase the number of digits by at most 1


// Rules/Patterns:
// - JavaScript provides a BigInt type that allows very big integer values to be
//   stored in memory; BigInts are denoted by a trailing `n` appended to number
//   values.
// - digits will always be greater than/equal to 2
// Building the sequence:
// - the first two numbers in the sequence are always 1 [1, 1]
// - each subsequent number in the sequence is calculated by summing the last 2
//   numbers in the sequence

// Data:
// - Input: A Number (represents the number of digits in the fibonacci number
//   we're searching for)
//   eg. 2 => Search for the first fibonacci number with 2 digits
// - Output: Another Number (represents the position (1-based index) of the first
//   fibonacci number with the specified number of digits)
// Calculate the sequence until a number with the specified number of digits is
// found:
// - Start with an array [1, 1] (first 2 nums are 1 by definition)
// - Initialize a loop from 1 to infinity (bad practice?)
//   1) Calculate the next number in the fibonacci sequence
//   2) Parse the calculated number for the number of digits
//   3) If current number's # of digits === digitTarget, return the current value
//      of index

// Algorithm:
// Given a number as input, digitTarget:
// - Maintain a 2-element array of the last 2 numbers in the sequence, so that we
//   can always calculate the next number in the sequence
//   (Don't need to hold the entire sequence in memory).
// - Standardize digitTarget to use BigInt 
//   > digitTarget = BigInt(digitTarget)

// 1) Initialize a new array (lastTwoNumbers = [1, 1])
// 2) Initialize a loop from 3 to Infinity. For each iteration:
//    - Calculate the sum of lastTwoNumbers => currentSequenceNumber
// 3) Calculate the number of digits in currentSequenceNumber (as a BigInt)
// 4) Compare numberOfDigits to digitTarget 
//    - If they match, return index (as a BigInt)
// 5) Add currentSequenceNumber to lastTwoNumbers and remove the first number


function findFibonacciIndexByLength(digitTarget) {
  digitTarget = BigInt(digitTarget);
  let lastTwoNumbers = [1n, 1n];

  for (let index = 3n; index < Infinity; index++) {
    let currentFibNumber = bigSum(lastTwoNumbers);
    let numberOfDigits   = BigInt(String(currentFibNumber).length);

    if (numberOfDigits >= digitTarget) return index;

    lastTwoNumbers = [lastTwoNumbers[1], currentFibNumber];
  }
}

function bigSum(numbers) {
  return numbers.reduce((runningSum, number) => runningSum + number, 0n);
}


// // Examples:
// - Simple Examples
// > The first 2-digit fibonacci number is the 7th number (index 7, 1-based):
console.log(findFibonacciIndexByLength(2n) === 7n);    // 1 1 2 3 5 8 13

// // > The first 3-digit fibonacci number is the 12th number (index 12, 1-based):
console.log(findFibonacciIndexByLength(3n) === 12n);   // 1 1 2 3 5 8 13 21 34 55 89 144

// // - Big Examples
console.log(findFibonacciIndexByLength(10n) === 45n);
console.log(findFibonacciIndexByLength(16n) === 74n);
console.log(findFibonacciIndexByLength(100n) === 476n);
console.log(findFibonacciIndexByLength(1000n) === 4782n);
console.log(findFibonacciIndexByLength(10000n) === 47847n);
