// (Please note that this is copy-pasted from my editor, so some of the lines may be off. However, you should be able to use the relative line distances to infer which line number corresponds to each line of code. If this is an issue, please let me know for future reference.)

// Local vs. Global - Part 1
// What will the following code log to the console, and why?
// var myVar = 'This is global';

// function someFunction() {
//   var myVar = 'This is local';
// }

// someFunction();
// console.log(myVar);

// This code will output 'This is global' on Line 10. This occurs due to the function-
// scoping behavior of `var` variables; they are scoped (limited) to the closest
// encompassing function from their definition. 
// In this case, that means the `myVar` variable on Line 6 is a locally-scoped 
// variable *declaration*, which does not affect the value of the globally-scoped
// `myVar` variable declared on Line 3, and will be rendered inaccessible once the
// function returns. Therefore, Line 10 will output the value of the globally-scoped
// `myVar` variable - `'This is global'`.


// Local vs. Global - Part 2 
// What will the following code log to the console, and why?
// var myVar = 'This is global';

// function someFunction() {
//   var myVar = 'This is local';
//   console.log(myVar);
// }

// someFunction();

// This code will output `'This is local'` on Line 30, invoked from Line 33.
// When `someFunction` is invoked on Line 33, a local function-scoped variable,
// `myVar`, is declared on Line 29. Since this variable shares the same name as the
// globally-scoped `myVar` declared on Line 26, it shadows (blocks) the outer-scoped
// variable. Therefore, when `myVar` is logged on Line 30, the locally-scoped `myVar` 
// will be referenced, outputting `'This is local'`.


// Local vs. Global - Part 3
// What will the following code log to the console, and why?
// var myVar = 'This is global';

// function someFunction() {
//   myVar = 'This is local';
// }

// someFunction();
// console.log(myVar);

// This code will output `'This is local'` on Line 52. This occurs because functions
// in JavaScript behave similarly to blocks in Ruby, scope-wise: inner scopes, such
// as function bodies, can access variables declared in outer scopes (but not vice-versa).
// In this case, when `someFunction` is invoked, the assignment on Line 48 
// (`myVar = 'This is local'`) is actually a *re-assignment* of the same `myVar` 
// variable that was declared on Line 45; since there is no locally-scoped `myVar`
// variable in `someFunction`, JavaScript searches in the outer scope (ie. its closure)
// for a matching variable. Therefore, Line 52 will output the newly-reassigned
// value of `myVar`, `'This is local'`.


// Variable Lookup ===========================================================
// What will the following code output, and why?
// var myVar = 'This is global';

// function someFunction() {
//   console.log(myVar);
// }

// someFunction();

// This code will output `'This is global'` on Line 70. 
// On Line 67, the function-scoped (`var`) `myVar` variable is declared; since there
// is no enclosing function for the variable, it defaults to being globally-scoped.
// Next, Line 73 invokes the `someFunction` function. Within `someFunction`, `myVar`
// is referenced and logged; since there is no declaration of a locally-scoped
// `myVar` variable within `someFunction`, JavaScript searches in its closure (ie.
// the outer scope) for a matching variable, finding it on Line 67. Therefore, Line
// 70 will log the value of `myVar` on Line 67 - `'This is global'`.


// Variable Scope
// What will the following code output, and why?
// function someFunction() {
//   myVar = 'This is global';
// }

// someFunction();
// console.log(myVar);

// This code will output `'This is global'` on Line 92. 
// On Line 91, `someFunction` is invoked. Within the function body, the `myVar` variable
// is declared with the value `'This is global'`. Importantly, in JavaScript, if a 
// variable is declared without any declaration keywords (eg. `let`, `var`, or
// `const`), the resulting variable is declared with *global scope*. Therefore,
// when Line 92 accesses and logs the value of `myVar` it will access the variable
// from Line 88, with the value `'This is global'`.


// Arguments - Part 1 ===========================================================
// What will the following code output, and why?
// let a = 7;

// function myValue(b) {
//   b += 10;
// }

// myValue(a);
// console.log(a);

// This code will output the original value of `a` on Line 112, `7`.
// On Line 105, the `a` variable is declared and initialized to the value `7`. Next,
// Line 111 invokes `myValue`, passing in the value of `a` as an argument; within
// `myValue`, the value `7` is bound to the local parameter `b`. On Line 108, `b`
// is reassigned to the result of `b + 10` (`17`). However, this only changes the 
// binding between the local function variable `b` and `7`; it does not alter the
// binding between the original variable `a` and its value `7`.
// Therefore, on Line 112, `a`'s value is still its original value - `7`.


// Arguments - Part 2 ===========================================================
// What will the following code output, and why?
// let a = 7;

// function myValue(a) {
//   a += 10;
// }

// myValue(a);
// console.log(a);

// This code will output the original value of the globally-scoped `a` variable, `7`,
// on Line 133.
// On Line 126, the `a` variable is declared and initialized to the value `7` within
// the global scope. Next, Line 132 invokes `myValue`, passing `7` - the value 
// referenced by `a` - as an argument. Within `myValue`, `7` is bound to the 
// *local function parameter* `a`. Importantly, this version of `a` is a different
// variable from the one declared on Line 126.
// Within the body of `myValue`, the local parameter `a` is reassigned to the 
// result of `a + 10` (`17`). However, this only changes the binding of the local
// parameter `a` from `7` to `17`; it does not affect the binding between the 
// globally-scoped `a` and its value (`7`).
// Therefore, when `myValue` returns, the parameter `a` is destroyed; referencing
// `a` on Line 133 will reference the globally-scoped `a` from Line 126, with its
// original value of `7`.


// Arguments - Part 3 ===========================================================
// What will the following code output, and why?
// let a = [1, 2, 3];

// function myValue(b) {
//   b[2] += 7; // b[2] = b[2] + 7
// }

// myValue(a);
// console.log(a);

// This code will output a mutated array on Line 160 - [1, 2, 10].
// On Line 153, the `a` variable is declared and initialized to an array (`[1, 2, 3]`).
// Line 159 then invokes the `myValue` function, passing in the array referenced
// by `a`, which is bound to the local function parameter `b`. Within `myValue`,
// the array is mutated through `b`, replacing its index-2 element with the result
// of the index-2 element + 7 (ie. `3 + 7 = 10`).
// Because JavaScript handles object arguments using a pass-by-reference strategy,
// all variables referencing the array (global `a` and local `b`) will reflect the
// mutation performed through `b`. Therefore, when `a` is logged on Line 160, its 
// value will be mutated with a different 3rd element: `[1, 2, 10]`.


// Variable Declarations ========================================================
// What will the following code output, and why?
// console.log(a);

// var a = 1;

// This code will output `undefined` on Line 176. This occurs due to the way 
// JavaScript parses/hoists variables: variables declared with `var` are registered
// before execution with an initial value of `undefined`. Therefore, attempting to
// access `a` on Line 176 - before its assignment on Line 178 - will return and 
// log `undefined`.


// Function Declarations
// What will the following code output, and why?
// logValue();

// function logValue() {
//   console.log('Hello, world!');
// }

// This code will output `'Hello, world!'` on Line 192, invoked from Line 189.
// This occurs due to JavaScript's hoisting/parsing behavior; function declarations
// are hoisted with their full definition prior to execution, so when `logValue` is
// invoked on Line 189, the corresponding function is already fully initialized.

// Further Exploration
var logValue = 'foo';

function logValue() {
  console.log('Hello, world!');
}

console.log(typeof logValue);

// This updated code will output 'string' on Line 207. Before execution, JavaScript
// will parse the code to find and register all identifiers. When there are two 
// identifiers with conflicting names, with one `var` and one `function`, the 
// `function` identifier will take priority, and the `var` identifier will be
// considered redundant. In this case, prior to execution, `logValue` references the
// corresponding function object.
// However, on the first line of execution, `logValue` is immediately reassigned to
// a new value - `'foo'`. Therefore, on Line 207, the type of `logValue` will be
// a `'string'`.