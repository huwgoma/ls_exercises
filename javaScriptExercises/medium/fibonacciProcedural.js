// Fibonacci Numbers (Procedural)
// Recursive functions can be very slow if not optimized; every recursive function
// can be written as a non-recursive (procedural) function.

// Rewrite your recursive fibonacci function so it computes its results without
// recursion.

// Rules:
// - JavaScript can compute integers accurately up to 16 digits long, which means 
//   that #78 is the largest Fibonacci number that can be accurately computed with
//   simple integer operations.
//   > Use BigInt?

// Algorithm (Procedural):
// Given a number as input, n:
// 1) Convert n to BigInt (for compatibility with big numbers)
// 2) Initialize a new array, lastTwoNumbers = [1, 1]
// 3) Initialize a loop from 3 up to n. For each iteration:
//    - Calculate the sum of lastTwoNumbers => current Fibonacci number
//    - Push currentFibNumber to lastTwoNumbers and remove the first element.
//      (Replace array)
// 4) After iteration, return the 2nd number from lastTwoNumbers (sum/fib number
//    on the last iteration)

function fibonacci(n) {
  n = BigInt(n);
  let lastTwoNumbers = [1n, 1n];

  for (let i = 3n; i <= n; i++) {
    let currentFibNumber = lastTwoNumbers[0] + lastTwoNumbers[1];
    lastTwoNumbers = [lastTwoNumbers[1], currentFibNumber];
  }

  return lastTwoNumbers[1];
}



// Examples:
console.log(fibonacci(1));       // 1
console.log(fibonacci(2));       // 1
console.log(fibonacci(3));       // 2
console.log(fibonacci(4));       // 3
console.log(fibonacci(5));       // 5
console.log(fibonacci(12));      // 144
console.log(fibonacci(20));      // 6765

console.log(fibonacci(50));       // 12586269025
console.log(fibonacci(75));       // 2111485077978050
