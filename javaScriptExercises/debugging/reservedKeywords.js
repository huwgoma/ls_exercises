// Currently, the isReserved function below does not produce the 
// expected result. Why? Fix the code so it behaves as intended.

// const RESERVED_KEYWORDS = ['break', 'case', 'catch', 'class', 'const', 'continue',
//   'debugger', 'default', 'delete', 'do', 'else', 'enum', 'export', 'extends', 'finally',
//   'for', 'function', 'if', 'implements', 'import', 'in', 'instanceof', 'interface',
//   'let', 'new', 'package', 'private', 'protected', 'public', 'return', 'static',
//   'super', 'switch', 'this', 'throw', 'try', 'typeof', 'var', 'void', 'while',
//   'with', 'yield'];

// function isReserved(name) {
//   RESERVED_KEYWORDS.forEach(reserved => {
//     if (name === reserved) {
//       return true;
//     }
//   });

//   return false;
// }

// console.log(isReserved('monkey')); // false
// console.log(isReserved('patch'));  // false
// console.log(isReserved('switch')); // expected: true, actual: false

// Currently, the `isReserved` function will always return false, due
// to how the iteration through `RESERVED_KEYWORDS` is implemented using
// `forEach`. 
// - The callback function to `forEach` correctly checks whether each
//   word in `RESERVED_KEYWORDS` matches the `name` given to `isReserved`,
//   returning `true` if a match is found. However, the `forEach` method
//   does not make use of its callback function's return value; therefore,
//   Lines 9-13 are essentially meaningless, and the `isReserved` function
//   will always return `false` from Line 15.

// To fix this, we could either replace the `forEach` method with a 
// lower-level `for` loop that allows us to directly return out of the
// `isReserved` function, or we can use a different abstraction that 
// allows for premature end of iteration, such as `some()`.


const RESERVED_KEYWORDS = ['break', 'case', 'catch', 'class', 'const', 'continue',
  'debugger', 'default', 'delete', 'do', 'else', 'enum', 'export', 'extends', 'finally',
  'for', 'function', 'if', 'implements', 'import', 'in', 'instanceof', 'interface',
  'let', 'new', 'package', 'private', 'protected', 'public', 'return', 'static',
  'super', 'switch', 'this', 'throw', 'try', 'typeof', 'var', 'void', 'while',
  'with', 'yield'];

// With `for`:
function isReserved(name) {
  for (let i = 0; i < RESERVED_KEYWORDS.length; i++) {
    if (name === RESERVED_KEYWORDS[i]) return true;
  }

  return false;
}

// With `some`:
function isReserved(name) {
  return RESERVED_KEYWORDS.some(reserved => name === reserved)
}

console.log(isReserved('monkey')); // false
console.log(isReserved('patch'));  // false
console.log(isReserved('switch')); // true