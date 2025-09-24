// Sum Square - Square Sum
// Write a function that takes a number (n) and calculates two numbers:
// 1) The square of the sum of the first n positive integers,
// 2) The sum of the squares of the first n positive integers,
// Then returns the difference between 1 and 2 (1 - 2).

// Questions:
// 1) Is it possible for the input n to be missing, negative,
//    or a non-number?
// => Yes => Return undefined
// 2) Is it possible for n to be 0?
// => Yes => Return 0
// 3) Is it possible for Infinity to be an input?
// => Yes => Return Infinity

// Rules / Patterns
// 1) Square of Sums:
// - Sum all integers between 0 and n (0 for 0-inclusivity)
// - Square the resulting sum (**2)
// 2) Sum of Squares:
// - Calculate the square (**2) for each integer between 0..n
// - Sum the resulting squares

// Data: 
// > Input: Number (represents the limit of iteration from 0 - n, 
//   inclusive)
// - validate input:
//   - Must be >= 0
//   - If n = Infinity, return n
// - Create an array of numbers from 0-n
// a) Calculate the sum of the numbers, then square the result
// b) Concurrently transform each number to its square, then sum the
//   results.
// - Calculate and return the difference between a and b.

// > Output: Number (Derived from subtracting Square(sums) - Sum(squares))

// Algorithm:
// Given a number as input, n:

// 1) Validate the input n
// > If n is not a valid integer greater than/equal to 0, return undefined
// > If n is Infinity, return Infinity

// 2) Create an array of all values between 0 to n.

// 3) Calculate the square of sums
// > Sum the numbers in the array created in step 2
// > Square the result

// 4) Calculate the sum of squares
// > Transform the array into an array of squares
// > Then compute the sum from the resulting transformation

// 5) Calculate and return the difference between 3) and 4)

function sumSquareDifference(n) {
  if (!(n >= 0))      return undefined;
  if (n === Infinity) return Infinity;

  let range = Array.from({ length: n + 1 }, (_, i) => i);

  let squareOfSums = sum(range) ** 2;
  let sumOfSquares = sum(range.map(num => num ** 2));

  return squareOfSums - sumOfSquares;
}

function sum(numbers) {
  return numbers.reduce((memo, num) => memo + num, 0);
}

// Refactor: Only use one loop.
// - Initialize two new variables: sum and sumOFSquares
// - Initialize a loop from 1 to n*. For each iteration:
//   * If n = 0 no iteration occurs
// 1) Increment sum by current number
// 2) Increment sumOfSquares by current number ** 2
// 3) After iteration ends, square sum
// 4) Then return squared sum - squareSum

function sumSquareDifference(n) {
  if (!(n >= 0))      return undefined;
  if (n === Infinity) return Infinity;  

  let sum = 0;
  let sumOfSquares = 0;
  for (let i = 1; i <= n; i++) {
    sum += i;
    sumOfSquares += (i ** 2);
  }

  return (sum ** 2) - sumOfSquares;
}

// Examples:
console.log(sumSquareDifference(4));   // 70 (10 ** 2) - (1 + 4 + 9 + 16)
console.log(sumSquareDifference(3));   // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
console.log(sumSquareDifference(10));  // 2640
console.log(sumSquareDifference(1));   // 0
console.log(sumSquareDifference(100)); // 25164150

// Edge Cases:
// 0-Input => 0
console.log(sumSquareDifference(0));   // 0
// Invalid (missing, negative, or NaN) Input => undefined
console.log(sumSquareDifference());         // undefined
console.log(sumSquareDifference(-1));       // undefined
console.log(sumSquareDifference(-Infinity)) // undefined
console.log(sumSquareDifference(NaN));      // undefined
// Infinity => Infinity
console.log(sumSquareDifference(Infinity)); // Infinity
