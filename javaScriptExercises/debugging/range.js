// Range
// - We are asked to implement a range function that returns an array of integers,
//   beginning and ending with a specified start and end.
// - If only one argument is given, that number should represent the ending number,
//   and the range should start at 0.

// Why does the following code result in a stack overflow?
// Explain the error and fix the code.

// function range(start, end) {
//   const range = [];

//   for (let element = start; element <= end; element++) {
//     range.push(element);
//   }

//   return range;
// }

// function range(end) {
//   return range(0, end);
// }

// // Examples

// console.log(range(10, 20));
// console.log(range(5));

// == Analysis ==
// Currently, this code will result in a stack overflow because of how the second
// `range` function is implemented; it will repeatedly call itself again and 
// again with the arguments `0` and `end` until the call stack maximum is exceeded.

// Importantly, when multiple functions have the same name, the last function will
// overwrite all earlier versions of that function; therefore, the first `range`
// function effectively does not exist in this program.

// To fix this, we can stick to one `range` function and instead implement some
// preliminary argument validation/transformation, based on the following rules:
// - If end is undefined, start = 0 and end = start
// - Otherwise, leave start/end as-is
// > With this change, the `range` function should now be able to handle 
//   invocations with both 1 and 2 arguments.

function range(start, end) {
  if (end === undefined) {
    [ start, end ] = [ 0, start ];
  }

  const range = [];

  for (let element = start; element <= end; element++) {
    range.push(element);
  }

  return range;
}

// Examples

console.log(range(10, 20));
console.log(range(5));


// Further Exploration
// Why is the following solution not considered a working solution?
function range(start, end) {
  if (!end) {
    start = 0;
    end = start;
  }

  // ...
}

// There are 2 main issues with the code above:
// 1) The condition if (!end) may incorrectly catch cases where `end` is given,
//    but with the value `0` (for example, a range from `-5` to `0`).
// 2) If the `if` clause executes, both `start` and `end` are set to `0`, which is 
//    probably not the desired behavior. 