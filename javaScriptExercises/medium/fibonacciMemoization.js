// Fibonacci Numbers (Memoization)
// - One way to improve the performance of recursive functions is to use
//   memoization.
// - Memoization involves saving a computed answer for future reuse instead of 
//   computing it from scratch every time.
//   eg. For Fib(4) => Fib(3) + Fib(2) <-- This Fib(2) call does not need to be made
//                      /         \        - Because Fib(2) was already calculated
//              Fib(2) + Fib(1)    1         during the Fib(3) call.
//                /         \
//               1           1

// Data: 
// Initialize an object (fibValues = { 1: 1, 2: 1 }
// - As we recurse through each value of n:
//   - Before calling Fib(n), check if n exists in fibValues (ie. was already
//     computed); if it does, skip the call and use the memoized value instead
//   - Otherwise, call Fib(n)
//   - Register the computed value to fibValues

// Algorithm:
// Given a number as input, n:
// 1) ? Convert n to BigInt ?

// *  If n <= 2 return 1 (base)

// 2) Initialize a new object, memo, as optional arg (default { 1:, 2: 1 })
// 3) Calculate the number at n - 1:
//    * If memo[n - 1] exists, use that value; only if no such value is memoized,
//      call Fib(n - 1) (pass memo)
//    * If memo[n - 1] doesn't exist, register the return value of Fib(n - 1)
//      to memo
// 4) Calculate the number at n - 2 (Should exist in memo)
// 5) Add fibN-1 + fibN-2 and return

function fibonacci(n, memo = { 1: 1, 2: 1 }) {
  if (n <= 2) return 1;

  let lastNumber       = memo[n - 1] || fibonacci(n - 1, memo);
  memo[n - 1]        ||= lastNumber;

  let secondLastNumber = memo[n - 2];

  return lastNumber + secondLastNumber;
}

// Refactor: Check the memo for the current number at the start of each function 
// call.

function fibonacci(n, memo = { 1: 1, 2: 1 }) {
  if (memo[n]) return memo[n];
  
  let fibNumber = fibonacci(n - 1, memo) + fibonacci(n - 2, memo);
  memo[n]       = fibNumber;

  return fibNumber;
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