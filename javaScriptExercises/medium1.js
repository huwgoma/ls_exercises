// Logical Operation
// - What will this code output? 
// console.log((false && undefined));                            
// // false (&& short-circuits because the first operand is false(y))
// console.log((false || undefined));                            
// // undefined (|| evaluates both operands if the first operand is falsy)
// console.log(((false && undefined) || (false || undefined)));  
// // undefined (false (short-circuited) || undefined) => undefined
// console.log(((false || undefined) || (false && undefined)));
// // false (undefined || false) => false
// console.log(((false && undefined) && (false || undefined)));
// // false (false && (short-circuited))
// console.log(((false || undefined) && (false && undefined)));
// // undefined (undefined && (short-circuited))
// console.log(('a' || (false && undefined) || ''));
// // 'a' (|| short-circuits if the first operand is truthy)
// console.log(((false && undefined) || 'a' || ''));
// // 'a' (undefined || 'a' || (short-circuited))
// console.log(('a' && (false || undefined) && ''));
// // undefined ('a' && undefined && (short-circuit))
// console.log(((false || undefined) && 'a' && ''));
// // undefined (undefined && short-circuit)


// Conditional Loop
// - The following program is expected to log each number between 0-9 (inclusive)
//   that is a multiple of 3. Will it produce the expected result? Why or why not?
// let i = 0;
// while (i < 10) {
//   if (i % 3 === 0) {
//     console.log(i);
//   } else {
//     i += 1;
//   }
// }

// This code will result in an infinite loop, outputting 0 on every iteration. 
// This occurs because the initial value of `i` (0) is evenly divisible by 3, 
// meaning the `if` branch is executed. Because the incrementation of `i` occurs
// in the `else` branch, which is never executed, `i`'s value will always be 0,
// and the exit condition will never be met.


// Multiplication Table
// - The following program is expected to log a multiplication table for the numbers
//   1-10 to the console. Will it produce the expected result? Why or why not?

// function padLeft(number) {
//   const stringNumber = String(number);
//   switch (stringNumber.length) {
//     case 1:  return `  ${stringNumber}`;
//     case 2:  return ` ${stringNumber}`;
//     default: return stringNumber;
//   }
// }

// for (let i = 1; i < 10; i += 1) {
//   let row = '';
//   for (let j = 1; j <= 10; j += 1) {
//     row += `${padLeft(i * j)} `;
//   }

//   console.log(row);
// }

// The output from this code should be a multiplication table with 10 columns 
// (1-10), but only 9 rows (1-9). This is due to the condition of the outer `for`
// loop; since the loop will exit when `i < 10` evaluates to false, this means the
// loop will skip the iteration where `i` is 10, since `10 < 10` is false. 


// Selected Columns
// - The getSelectedColumns function selects and extracts specific columns to
//   a new array. Currently, this function is not working as intended. Identify
//   the problem and provide a solution.

// function getSelectedColumns(numbers, cols) {
//   var result = [];

//   // Iterate over each subarray
//   for (var i = 0, length = numbers.length; i < length; i += 1) {
//     // Iterate over each column index
//     for (var j = 0, length = cols.length; j < length; j += 1) {
//       if (!result[j]) {
//         result[j] = [];
//       }

//       result[j][i] = numbers[i][cols[j]];
//     }
//   }

//   return result;
// }

// const array1 = [[1, 2, 3], 
//                 [4, 5, 6], 
//                 [7, 8, 9]];

// const array2 = [[1, 2, 3], 
//                 [1, 2, 3], 
//                 [1, 2, 3]];

// console.log(getSelectedColumns(array1, [0]));     // [[1]];            expected: [[1, 4, 7]]
// console.log(getSelectedColumns(array1, [0, 2]));  // [[1, 4], [3, 6]]; expected: [[1, 4, 7], [3, 6, 9]]
// console.log(getSelectedColumns(array2, [1, 2]));  // [[2, 2], [3, 3]]; expected: [[2, 2, 2], [3, 3, 3]]

// This function currently returns an array of truncated column sub-arrays, based
// on the length of the `cols` array. 
// The primary cause is due to the exit condition of the nested `for` loop, which
// is responsible for iterating over each index of `cols`; because the exit condition
// occurs when `j` equals or exceeds the length of `cols.length`, this means that the
// nested arrays will only contain `n` elements, where `n` is the number of elements
// in `cols`.
// - Also, the structure of iteration is difficult to read; the function first iterates
//   over each subarray in numbers, which would typically mean that the `result`
//   array should have `numbers.length` number of subarrays (3). However, the `length`
//   variable is reassigned by the inner `for` loop to the length of `cols.length`, so 
//   this particular oddity is hidden. However, I would still like to refactor this
//   logic to be more legible.

// To fix this code, I would change the iteration structure and conditions:
// - Initialize a result array, []
// - The final result array should have a number of subarrays corresponding to
//   the number of elements in the given `cols` array; therefore, iterate over 
//   `cols` first.

// - For each column index, we need to retrieve the corresponding element from all
//   rows (ie. from all subarrays in numbers); therefore, iterate over rows.

// - For each row, retrieve the element at the current column index and add it to
//   the correct subarray in results

// function getSelectedColumns(numbers, cols) {
//   var result = [];

//   for (let i = 0; i < cols.length; i++) {
//     result[i] ??= [];
//     let colIndex = cols[i];

//     for (let rowIndex = 0; rowIndex < numbers.length; rowIndex++) {
//       result[i][rowIndex] = numbers[rowIndex][colIndex];
//     }
//   }

//   return result;
// }

// const array1 = [[1, 2, 3], 
//                 [4, 5, 6], 
//                 [7, 8, 9]];

// const array2 = [[1, 2, 3], 
//                 [1, 2, 3], 
//                 [1, 2, 3]];

// console.log(getSelectedColumns(array1, [0]));     // [[1, 4, 7]]
// console.log(getSelectedColumns(array1, [0, 2]));  // [[1, 4, 7], [3, 6, 9]]
// console.log(getSelectedColumns(array2, [1, 2]));  // [[2, 2, 2], [3, 3, 3]]


// Counter
// - What will the following code snippets log?

// var counter = 5;
// var rate = 3;
// console.log('The total value is ' + String(counter * rate));

// function counter(count) {
//   // ...
// }

// This code will output the string `'The total value is 15'`. During the creation
// phase, JavaScript 'hoists' the `counter` function declaration above the `var` 
// identifier `counter` (in reality, they are parsed top-down, but the function
// declaration takes priority over the `var` variable). Next, during execution,
// `counter` is assigned to a value of 5 (Line 163). Therefore, the result of 
// `counter * rate` will be `5 * 3`, or `15`.


// function counter(count) {
//   // ...
// }

// console.log('The total value is ' + String(counter * rate));

// var counter = 5;
// var rate = 3;

// This code will output `'The total value is NaN'`.
// - During the creation phase, the `counter` and `rate` identifiers are registered;
//   `counter` is initialized to the corresponding function definition, while `rate`
//   is initialized as `undefined`. Although these variables are assigned later during
//   execution, this does not happen before the `console.log` call on Line 182.
//   Therefore, the result of `counter * rate` is equivalent to a function object
//   * undefined, which will return `NaN` due to the operands being non-mathematical.


// var counter = 5;
// var rate = 3;

// function counter(count) {
//   // ...
// }

// console.log('The total value is ' + String(counter * rate));

// This code will output `'The total value is 15'`. During the creation phase, 
// the `counter` and `rate` identifiers are registered; `counter` is initialized
// to the corresponding function definition, with the second identifier (`var counter`)
// ignored, while `rate` is initialized as `undefined`.
// During execution, `counter` and `rate` are reassigned to `5` and `3`, respectively.
// Therefore, `counter * rate` on Line 205 will evaluate to `5 * 3` => `15`.


// let counter = 5;
// let rate = 3;

// function counter(count) {
//   // ...
// }

// console.log('The total value is ' + String(counter * rate));

// This code will raise a `SyntaxError` (`counter` has already been declared) on
// Line 218. The underlying mechanism is how JavaScript parses identifiers before
// execution, as well as how it handles `let` identifiers.
// - Before execution, JavaScript parses identifiers in top-down order, registering
//   `counter` on Line 215 and `rate` on Line 216. The next identifier would be
//   `counter` again on Line 218; however, because `counter` was declared with the
//   `let` keyword, which does not allow duplicate identifiers in the same scope,
//   a `SyntaxError` will be raised.



// Logger
// - Why does the following code output 'debugging'?
// function debugIt() {
//   const status = 'debugging';
//   function logger() {
//     console.log(status);
//   }

//   logger();
// }

// debugIt();

// The code above will output `'debugging'` due to how closure and scoping rules
// work in JavaScript.
// - Within the `debugIt` function, the `status` constant is declared and 
//   initialized on Line 238. Next, Lines 239-241 declare the `logger` function, 
//   which logs the value of `status` on Line 240. When this function is defined,
//   it encapsulates the variables in the scope of its definition within its closure,
//   which in this case includes the `status` variable. Therefore, when `logger` is
//   invoked on Line 243, it is able to access the value of `status` and outputs
//   `'debugging'`.



// Invoice: 
// - The invoiceTotal function calculates the total amount for an invoice containing
//   4 line items. Refactor the function so that it will work with any number of
//   line items.

// function invoiceTotal(...amounts) {
//   return amounts.reduce((sum, amount) => sum + amount);
// }

// console.log(invoiceTotal(20, 30, 40, 50));          // works as expected
// console.log(invoiceTotal(20, 30, 40, 50, 40, 40));  // does not work; how can you make it work?



// Product of Sums
// - The productOfSums function is expected to return the product of the sums of
//   two arrays of numbers. 
//   - ie. sum elements of each array, then multiply sum1 by sum2
// - Will this produce the expected result? Why or why not?

// function productOfSums(array1, array2) {
//   let result = total(array1) * total(array2);
//   return result;
// }

// function total(numbers) {
//   let sum;

//   for (let i = 0; i < numbers.length; i += 1) {
//     sum += numbers[i];
//   }

//   sum;
// }

// console.log(productOfSums([1, 2, 3], [4, 5, 6]));
// expected: 6 * 15 => 90; actual: NaN

// This code will not return the expected result - it will always return NaN. 

// The first point of failure is on Line 291; since there is no explicit `return` 
// statement, the `total` function will always return `undefined`, regardless of 
// what elements are in the given array. Therefore, Line 280 will always be 
// equivalent to `undefined * undefined`, which results in `NaN`.

// The second point of failure is on Line 285. Because `sum` is declared with
// no initial value, its value upon access will be `undefined`. Therefore, Line
// 288's reassignment is equivalent to `sum = undefined + numbers[i]`, which will
// always return `NaN`. Therefore, even if we were to add an explicit return on
// line 291, the return value of `total` would always be `NaN`, which would 
// propagate through `productOfSums` and force its return value to also be `NaN`.