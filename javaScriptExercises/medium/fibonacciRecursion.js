// Fibonacci Numbers (Recursion)
// - The Fibonacci series is a sequence of numbers derived by calculating each
//   number in the sequence as the sum of the previous 2 numbers.
// - The first 2 numbers are 1 and 1 by definition.

// Write a recursive function that computes the `n`th Fibonacci number.

// Questions:
// 1) Can we assume that n will always be given as a positive integer?
// => Yes
// 2) Can n be Infinity?
// => No (positive and finite integer)

// Rules/Patterns:
// - The first 2 numbers are 1 by definition.
// - All other numbers can be calculated as the sum of the previous two numbers
//   in the sequence.
//   > To obtain the previous two numbers, we can call fib(n - 1) and fib(n - 2)
//     for any value of n that is greater than 2
//   > If n is less than/equal to 2, return 1 (base case)

// Data
//  Input: 
// - A Number (representing the position of the Fibonacci number we want to return)
//  Output:
// - Another Number (Represents the value of the Fibonacci number at position n)

// For any given value of n:
// - If n <= 2, return 1 (BASE CASE)
// - Otherwise, calculate the Fibonacci Numbers at the previous 2 locations
//   > Fib(n - 1) + Fib(n - 2)
//   > Recurse by calling Fib() with progressively smaller values of n until 
//     n reaches 2 or 1 => 1
//   > Result of recursion in each loop is used to calculate the sum of the two
//     previous Fibonacci numbers in that loop.

function fibonacci(n) {
  if (n <= 2) return 1;

  return fibonacci(n - 1) + fibonacci(n - 2);
}

// Examples:
console.log(fibonacci(1));       // 1
console.log(fibonacci(2));       // 1
console.log(fibonacci(3));       // 2
console.log(fibonacci(4));       // 3
console.log(fibonacci(5));       // 5
console.log(fibonacci(12));      // 144
console.log(fibonacci(20));      // 6765
