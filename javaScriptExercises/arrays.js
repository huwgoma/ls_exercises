// 1 - Array Copy (1)
// What does the following code log to the console at Lines 7, 8, 11, and 12?

// let myArray = [1, 2, 3, 4];
// const myOtherArray = myArray;

// myArray.pop();
// console.log(myArray);
// console.log(myOtherArray);

// myArray = [1, 2];
// console.log(myArray);
// console.log(myOtherArray);

// This code will output [ 1, 2, 3 ] on Lines 7 and 8, [ 1, 2 ] on Line 11, and
// [ 1, 2, 3 ] again on Line 12.
// The underlying mechanism is the difference between mutation and reassignment.
// Lines 3 and 4 initialize a variable and constant that both reference the same
// array; therefore, when the array referenced by `myArray` is mutated on Line 6
// via the `pop()` method, both `myArray` and `myOtherArray` will reflect the 
// change, producing the same output `[ 1, 2, 3 ]`.
// Conversely, Line 10 reassigns `myArray` to another array; this operation only 
// affects the `myArray` variable, and does not have any impact on other variables
// referencing the original object, such as `myOtherArray`. Therefore, Line 11
// will output `[1, 2]`, while Line 12 outputs `[1, 2, 3]`.



// 2 - Array Copy (2)
// - Implement 2 ways of copying the values of the array, but not the reference,
//   on the line `const myOtherArray = myArray;`.

// let myArray = [1, 2, 3, 4];
// // const myOtherArray = myArray;           // Instead of this:
// const myDifferentArray1 = myArray.slice(); // We can do this:

// const myDifferentArray2 = [];
// for (let i = 0; i < myArray.length; i++) { // Or this:
//   myDifferentArray2.push(myArray[i]);
// }


// myArray.pop();
// console.log(myOtherArray);

// myArray = [1, 2];
// console.log(myOtherArray);



// 3 - Array Concat (1)
// Write a function that returns a new array containing all values from the first
// argument (array) and the second argument (array or value).
// - Argument 1 will always be an array
// - Argument 2 can be an array or another value.
// - Elements should appear in the same order as specified by arguments.
// - Object arguments should be copied into the return value's new array

// function concat(array, other) {
//   let result = array.slice();

//   if (Array.isArray(other)) {
//     for (let i = 0; i < other.length; i++) result.push(other[i])
//   } else {
//     result.push(other);
//   }

//   return result;
// }

// // Examples:
// console.log(concat([1, 2, 3], [4, 5, 6]));          // [1, 2, 3, 4, 5, 6]
// console.log(concat([1, 2], 3));                     // [1, 2, 3]
// console.log(concat([2, 3], ['two', 'three']));      // [2, 3, "two", "three"]
// console.log(concat([2, 3], 'four'));                // [2, 3, "four"]


// const obj = { a: 2, b: 3 };
// const newArray = concat([2, 3], obj);
// console.log(newArray);                 // [2, 3, { a: 2, b: 3 }]
// obj.a = 'two';
// console.log(newArray);                 // [2, 3, { a: "two", b: 3 }]

// const arr1 = [1, 2, 3];
// const arr2 = [4, 5, obj];
// const arr3 = concat(arr1, arr2);
// console.log(arr3);                     // [1, 2, 3, 4, 5, { a: "two", b: 3 }]
// obj.b = 'three';
// console.log(arr3);                     // [1, 2, 3, 4, 5, { a: "two", b: "three" }]

// arr3[5].b = 3;                         // or, `arr3[5]['b'] = 3;`
// console.log(obj);                      // { a: "two", b: 3 }


// 4 - Array Concat (2)
// - Extend the concat function to allow for two or more arrays/values to be 
//   concatenated to the values of the first array.

// function concat(...args) {
//   let result = [];

//   args.forEach(function(arg) {
//     if (Array.isArray(arg)) {
//       for (let i = 0; i < arg.length; i++) result.push(arg[i]);
//     } else {
//       result.push(arg);
//     }
//   });

//   return result;
// }

// // Examples:
// console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9])); // [1, 2, 3, 4, 5, 6, 7, 8, 9]
// console.log(concat([1, 2], 'a', ['one', 'two']));     // [1, 2, "a", "one", "two"]
// console.log(concat([1, 2], ['three'], 4));            // [1, 2, "three", 4]


// 5 - Array Pop and Push
// Implement your own version of pop() and push(): 
// - pop() removes the last element from the given array and returns that element.
//   - If called on an empty array, returns undefined.
// - push() adds one or more elements to the end of an array and returns the new
//   length of the array.
// Both methods are mutating.

// function pop(array) {
//   let popped = array[array.length - 1];

//   if (array.length > 0) array.length = array.length - 1;

//   return popped;
// }

// function push(array, ...values) {
//   values.forEach(value => array[array.length] = value);

//   return array.length;
// }


// // pop
// const array1 = [1, 2, 3];
// console.log(pop(array1));                        // 3
// console.log(array1);                // [1, 2]
// console.log(pop([]));                           // undefined
// console.log(pop([1, 2, ['a', 'b', 'c']]));      // ["a", "b", "c"]

// // push
// const array2 = [1, 2, 3];
// console.log(push(array2, 4, 5, 6));              // 6
// console.log(array2);                // [1, 2, 3, 4, 5, 6]
// console.log(push([1, 2], ['a', 'b']));          // 3
// console.log(push([], 1));                       // 1
// console.log(push([]));                          // 0

// Buggy Solution - Where are the bug(s)?
// function pop(array) {
//   const poppedElement = array[array.length];
//   array.splice[array.length];

//   return poppedElement;
// }

// function push(array, ...args) {
//   const length = args.length;

//   for (let i = 1; i < length; i += 1) {
//     array[i] = args[i];
//   }

//   return array.length;
// }

// let arr = [1, 2, 3]
// console.log(pop(arr)); //=> undefined
// console.log(arr);      //=> [1, 2, 3]

// console.log(push(arr, 4, 5)); //=> []
// console.log(arr);             //=> [1, 5, 3]

// This implementation of the `pop` function has 2 bugs:
// 1) `poppedElement` will always reference undefined; because it extracts from
//    `array[array.length]`, it will always reference an index value that is one
//    beyond the maximum index of the array.
// 2) `array.splice[array.length]` is invalid syntax; arguments should be passed
//    using parentheses `()` instead of square brackets. Furthermore, the first 
//    argument passed to `splice` represents the starting index for where to begin
//    removing elements; since the given index is the array length, the starting
//    point will again be out-of-bounds, and no elements will be removed.

// This implementation of the `push` function also has 2 bugs:
// 1) The `for` loop's condition will end iteration one loop early; if `args` has
//    3 elements, it will only loop twice, and will skip the first element (since
//    `i` begins at 1 and not 0.)
// 2) Instead of adding elements from `args` to the end of `array`, the code within
//    the `for` loop will replace the elements in `array`, starting from index 1.
//    - A side effect of this bug is that the `array.length` value that is returned
//      will always be derived from either the length of the original array or 
//      the length of the `args` array (whichever is greater).



// 6 - Array/String reverse
// - Implement your own version of the Array reverse method, with 2 main differences:
//  - It should accept either a string or array as argument
//  - It should return a new string or array, respectively.

// function reverse(toBeReversed) {
//   let reversed = Array.isArray(toBeReversed) ? [] : '';

//   for (let i = toBeReversed.length - 1; i >= 0; i--) {
//     reversed = reversed.concat(toBeReversed[i]);
//   }

//   return reversed;
// }

// console.log(reverse('Hello'));           // "olleH"
// console.log(reverse('a'));               // "a"
// console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
// console.log(reverse([]));                // []

// const array = [1, 2, 3];
// console.log(reverse(array));             // [3, 2, 1]
// console.log(array);                      // [1, 2, 3]

// Buggy Solution:
// function reverse(inputForReversal) {
//   if (Array.isArray(inputForReversal)) {
//     return reverseArray(inputForReversal);
//   } else {
//     return reverseString(inputForReversal);
//   }
// }

// function reverseArray(inputForReversal) {
//   const reversed = [];
//   const length = inputForReversal.length;

//   for (let i = 0; i < length; i += 1) {
//     reversed[length - i] = inputForReversal[i];
//   }

//   return reversed;
// }

// function reverseString(inputForReversal) {
//   const stringArray = inputForReversal.split(' ');
//   return reverseArray(stringArray).join(' ');
// }

// The reverseArray function has one bug: it will leave the `reversed` array with
// one empty element at the beginning. This is because of the interaction between
// the index's initial value (`0`) and `reversed[length - i]`; the `reversed` array
// will begin populating at `length - 0`, which will result in elements being shifted
// over by one index to the right, and subsequently an empty element at index 0.

// The reverseString function also has one major bug: because the split condition
// is a space (`' '`), the characters in the given string are not reversed - only 
// the order of words. For example, given the string 'Hello Hi', this function will
// return ' Hi Hello' (the empty space at the start is due to the bug in `reverseArray`
// where an empty element is present at the beginning of the `reversed` array.)



// 7 - Array Shift and Unshift
// Implement your own versions of Array shift and unshift.
// - shift removes and returns the first element of the given array.
//   - If the array is empty, shift returns undefined.
// - unshift adds one or more elements to the start of the given array, and returns
//   the new length of the array
// Both methods mutate the original array.

// Using splice():
// function shift(array) {
//   return array.splice(0, 1)[0];
// }

// // Without splice():
// function shift(array) {
//   let first = array[0];

//   for (let i = 0; i < array.length; i++) {
//     array[i] = array[i + 1];
//   }

//   if (array.length > 0) array.length = array.length - 1;

//   return first;
// }

// Without splice():
// function unshift(array, ...elements) {
//   let newLength = array.length + elements.length;

//   for (let i = newLength - 1; i >= 0; i--) {
//     if (i >= elements.length) {
//       array[i] = array[i - elements.length];
//     } else {
//       array[i] = elements[i];
//     }
//   }

//   return newLength;
// }

// With splice():
// - splice() as we know it takes 2 arguments: startIndex and deleteCount.
// However, it can also accept an unlimited number of arguments after the initial 2,
// representing elements to be added. Elements are added starting from startIndex.
// - eg. [1, 2, 3].splice(0, 0, 4, 5, 6)
// "Start at 0, remove 0 elements, and add elements 4, 5, 6 to array"
// - elements are added in the specified order eg. [4, 5, 6, 1, 2, 3]

// function unshift(array, ...elements) {
//   array.splice(0, 0, ...elements);

//   return array.length;
// }


// console.log(shift([1, 2, 3]));                // 1
// console.log(shift([]));                       // undefined
// console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]

// console.log(unshift([1, 2, 3], 5, 6));        // 5
// console.log(unshift([1, 2, 3]));              // 3
// console.log(unshift([4, 5], [1, 2, 3]));      // 3

// const testArray = [1, 2, 3];
// console.log(shift(testArray));                // 1
// console.log(testArray);                       // [2, 3]
// console.log(unshift(testArray, 5));           // 3
// console.log(testArray);                       // [5, 2, 3]



// 8 - Slice and Splice
// - Implement your own version of slice and splice:

// Slice: 
// - Takes 3 arguments: Array, begin, and end. 
//   - Assume begin and end are always integers > 0.
//   - If either value is greater than the array length, round it down to the 
//     array length.
// - Returns a new array containing elements from array, starting from begin and 
//   up to (excluding) end.
// - Does not mutate the original array.

// function slice(array, begin, end) {
//   begin = floor(begin, array.length);
//   end   = floor(end, array.length);

//   let result = [];

//   for (let i = begin; i < end; i++) {
//     result.push(array[i]);
//   }

//   return result;
// }

// function floor(value, maxValue) {
//   return (value > maxValue) ? maxValue : value;
// }

// console.log(slice([1, 2, 3], 1, 2));               // [2]
// console.log(slice([1, 2, 3], 2, 0));               // []
// console.log(slice([1, 2, 3], 5, 1));               // []
// console.log(slice([1, 2, 3], 0, 5));               // [1, 2, 3]

// const arr1 = [1, 2, 3];
// console.log(slice(arr1, 1, 3));                     // [2, 3]
// console.log(arr1);                                  // [1, 2, 3]

// Splice: 
// - Deletes and/or adds elements to the given array (destructively).
// - 3+ arguments:
//   1) array 2) start index 3) delete count 4+) elements to be added.
// - Removes delete count # of elements, starting from start index.
// - If elements are given, they are inserted into the array, starting at start.
//   - order is preserved; eg. [1, 2, 3].slice(add 4, 5) => [4, 5, 1, 2, 3]
// - Returns a new array containing the deleted elements ([] if none deleted);
//   mutates the original array

// - Assume start and deleteCount will always be >= 0
// - If start is greater than array length, floor it down to array length
// - If delete Count is greater than the number of elements from start to end of
//   array, set delete count = array.length - start
// - If no elements to add are given, splice only removes elements from the array.

// function splice(array, startIndex, deleteCount, ...elements) {
//   // Coerce Arguments
//   startIndex = floor(startIndex, array.length);
//   deleteCount = floor(deleteCount, array.length - startIndex);

//   // Delete
//   let removed = [];

//   for (let i = startIndex; i < array.length; i++) {
//     if (removed.length < deleteCount) removed.push(array[i]);

//     array[i] = array[i + deleteCount];
//   }

//   array.length = array.length - deleteCount;

//   // Add
//   newLength = array.length + elements.length;

//   for (let i = newLength - 1; i >= startIndex; i--) {
//     // Post-Splice Zone
//     if (i >= startIndex + elements.length) {
//       array[i] = array[i - elements.length];
//     } else { // Splice Zone
//       array[i] = elements[i - startIndex];
//     }
//   }

//   array.length = newLength;

//   return removed;
// }

// function floor(value, maxValue) {
//   return (value > maxValue) ? maxValue : value;
// }

// console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
// console.log(splice([1, 2, 3], 1, 3));              // [2, 3]
// console.log(splice([1, 2, 3], 1, 0));              // []
// console.log(splice([1, 2, 3], 0, 1));              // [1]
// console.log(splice([1, 2, 3], 1, 0, 'a'));         // []

// const arr2 = [1, 2, 3];
// console.log(splice(arr2, 1, 1, 'two'));             // [2]
// console.log(arr2);                                  // [1, "two", 3]

// const arr3 = [1, 2, 3];
// console.log(splice(arr3, 1, 2, 'two', 'three'));    // [2, 3]
// console.log(arr3);                                  // [1, "two", "three"]

// const arr4 = [1, 2, 3];
// console.log(splice(arr4, 1, 0));                    // []
// console.log(splice(arr4, 1, 0, 'a'));               // []
// console.log(arr4);                                  // [1, "a", 2, 3]

// const arr5 = [1, 2, 3];
// console.log(splice(arr5, 0, 0, 'a'));               // []
// console.log(arr5);                                  // ['a', 1, 2, 3]



// 9 - Oddities
// The oddities function takes an array as argument and returns a new
// array containing every other element from the input array (first, third, fifth,
// etc.)

// function oddities(array) {
//   const oddElements = [];

//   for (let i = 0; i < array.length; i += 2) {
//     oddElements.push(array[i]);
//   }

//   return oddElements;
// }

// oddities([2, 3, 4, 5, 6]) === [2, 4, 6];      // false
// oddities(['abc', 'def']) === ['abc'];         // false

// The comparisons above will evaluate to false because of how JavaScript handles
// object comparison using `===`; in JavaScript, `===` will only return true when
// comparing objects if the two operands reference the same object in memory. 
// The array returned by `oddities` and the array literal used as the 
// right-side operand are not the same object; therefore, `===` returns false.



// 10 - Array Comparison
// Modify the function below so that two arrays with the same values (but in
// potentially different order) are considered equal.
// - Without using sort:
// - Iterate through one array (left). For each element in left:
//   - Check if the current left element exists in the right array.
//     - If it does, remove that element from the right array 
//       (^<- Make a copy of the right array at the beginning to avoid mutating
//        the argument, then splice() the element after matching)
//     - If it doesn't return false
// - At the end of iteration, if right array still has any elements, return false.

function areArraysEqual(left, right) {
  if (left.length !== right.length) return false;

  let rightCopy = right.slice();

  for (let index = 0; index < left.length; index += 1) {
    let leftElement = left[index];
    let rightCopyIndex = rightCopy.indexOf(leftElement);

    if (rightCopyIndex === -1) return false; // leftElement doesn't exist in rightCopy

    rightCopy.splice(rightCopyIndex, 1); // Remove leftElement from rightCopy
  }

  return rightCopy.length === 0;
}

// Examples
console.log(areArraysEqual([1, 2, 3], [1, 2, 3]));                  // true
console.log(areArraysEqual([1, 2, 3], [3, 2, 1]));                  // true
console.log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']));      // true
console.log(areArraysEqual(['1', 2, 3], [1, 2, 3]));                // false
console.log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]));            // true
console.log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]));            // false
console.log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]));            // false
console.log(areArraysEqual([1, 1, 2], [1, 2, 2]));                  // false
console.log(areArraysEqual([1, 1, 1], [1, 1]));                     // false
console.log(areArraysEqual([1, 1], [1, 1]));                        // true
console.log(areArraysEqual([1, '1'], ['1', 1]));                    // true