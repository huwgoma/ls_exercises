// Rotation (1)
// Write a function that rotates an array by moving the first element to the end
// of the array. Do not modify the original array.
// - If the input is not an array, return undefined.
// - If the input is empty, return an empty array.

// Rules/Patterns
// - Do not mutate the original array (ie. create and return a new array)
// - The new array should have the first element from the old array 
//   in the last position

// Data:
// - Input: Array of elements
//   - If input is not an array, return undefined
//   - If input is empty, return input as-is []
// 1) Create a copy of the given array by taking its elements from index 1
//    (2nd element) to the end
// 2) Push the first element (which wasn't extracted in step 1) to the end of 
//    the new array
//    * Edge Case: What if array has a single element?
//      eg. [1]
//      Slicing (1) from a 1-element array will return an empty array
//      Then pushing arr[0] will add the first (only) element to new empty array
//      > Works ok
// 3) Return the new array

// - Output: A new array, with elements [1...end] + [0]


// function rotateArray(array) {
//   if (!Array.isArray(array)) return undefined;
//   if (array.length === 0)    return array;

//   let newArray = array.slice(1);
//   newArray.push(array[0]);

//   return newArray;
// }


// // Examples:
// console.log(rotateArray([7, 3, 5, 2, 9, 1]));       // [3, 5, 2, 9, 1, 7]
// console.log(rotateArray(['a', 'b', 'c']));          // ["b", "c", "a"]
// console.log(rotateArray(['a']));                    // ["a"]
// console.log(rotateArray([1, 'a', 3, 'c']));         // ["a", 3, "c", 1]
// console.log(rotateArray([{ a: 2 }, [1, 2], 3]));    // [[1, 2], 3, { a: 2 }]
// console.log(rotateArray([]));                       // []

// // return `undefined` if the argument is not an array
// console.log(rotateArray());                         // undefined
// console.log(rotateArray(1));                        // undefined

// // the input array is not mutated
// const array = [1, 2, 3, 4];
// console.log(rotateArray(array));                    // [2, 3, 4, 1]
// console.log(array);                                 // [1, 2, 3, 4]



// ========================================================================
// Rotation (2):
// - Write a function that rotates the last n digits of a number. 
// - 'Rotation': Move the first digit (in the n range) to the end

// eg. 735291, rotate last 4 digits:
// - The last 4 digits of 735291 are 5291; rotating this involves moving 5 to the
//   end of the sequence (2915); final number is 732915.

// Questions:
// 1) Is it possible for either number or n to be 0, negative, NaN, missing, or
//    non-numbers?
// => No
// 2) Is it possible for n to exceed the number of digits in number?
// => No
// 3) Can the number be a float, or integers only?
// => Integers only

// Rules/Patterns
// 

// Data:
// Inputs: `number` and `n`
// - Convert number to a string
// - Split the string into halves: 1) leadingDigits and 2) lastNDigits
// - Move the first character in lastNSequence to the end
// - Concatenate leadingDigits and lastNDigits as string
// - Convert back to number

// Output: A number derived from rotating the last n digits of `number`, where 
// 'rotation' means moving the first digit in the last n sequence to the end

// Algorithm:
// Given two numbers as input, `number` and `n`:
// 1) Convert `number` to a string
// 2) Divide numberString into 2 halves:
//    a) leadingDigits (the digits that have nothing to do with the rotation)
//    b) trailingDigits (the last n digits, to be rotated)
// * How?
//   eg. '735291', n = 3   ||    '735291', n = 2
//        012345 => '291'  ||     012345 => '91'
// String#slice actually supports negative indexes which is nice
// > '735291'.slice(-3) => '291'; '735291'.slice(-2) => '91'; 
// Leading Digits:
// > Slice from index 0 up to and excluding index (str.length - n)


// If this feature didn't exist, we could do something like string.length - n
// to obtain the starting index for slice, then omit the second argument to slice
// through to the end.

// Alternative with regex matching?
// - Match substrings between 1 and x characters, where x = string.length - n
//   eg. '735291' (string length = 6), n = 3
//   > Match substrings between 1-3 characters => [735, 291]


// 3) Rotate trailingDigits:
//  - Create a new string with characters at (1..end) + character at (0).
// 4) Join leadingDigits and rotated trailingDigits back together as string
// 5) convert back to number and return

// function rotateRightmostDigits(number, n) {
//   let numberString = number.toString();
//   let trailingDigits = numberString.slice(-n);
//   let leadingDigits  = numberString.slice(0, numberString.length - n);

//   let rotatedTrailingDigits = trailingDigits.slice(1) + trailingDigits[0];
//   return Number(leadingDigits + rotatedTrailingDigits);
// }

// // Examples:
// console.log(rotateRightmostDigits(735291, 1));      // 735291
// console.log(rotateRightmostDigits(735291, 2));      // 735219
// console.log(rotateRightmostDigits(735291, 3));      // 735912
// console.log(rotateRightmostDigits(735291, 4));      // 732915
// console.log(rotateRightmostDigits(735291, 5));      // 752913
// console.log(rotateRightmostDigits(735291, 6));      // 352917


// ========================================================================
// Rotation (3)
// - Take the number 735291 and rotate it by one digit to the left (ie. first ->
//   last) => 352917.
// - Next, keep the first digit fixed and rotate the remaining digits 
//   => 329175
// - Then keep the first 2 digits fixed and rotate remaining => 321759
// etc... - This is called the 'maximum rotation' of a number.

// Write a function that takes an integer and returns the maximum rotation of 
// that integer.
// - You may reuse the rotateRightmostDigits function

// Questions:
// 1) Is it possible for the given input to be a non-integer? For example,
//    can the input be a float, NaN, Infinity, or a non-Number type?
// => No
// 2) Is it possible for the given input to be 0 or negative?
// => No

// Rules/Patterns/Edge Cases:
// - If, during any intermediate rotation, a 0 becomes leading, it is dropped.
//   eg. 105: #1 => 051; The leading 0 is dropped and the remaining digits (51)
//                       are rotated; #2 => 15
//   * Need to convert 051 to 51, not 41 (octal)
//     - Number('051') does convert to 51 correctly.

// - For any given integer, the number of rotations will be the number of digits 
//   minus one (because the true last rotation will only have 1 digit, so it can
//   be skipped).

// Rotation Rules:
// 1) Rotate the entire number
// 2) Rotate the entire number, minus the first digit
// 3) Rotate the entire number, minus the first 2 digits
// 4) Repeat how many times?
// ***
// Rotations occur as a string eg. '200601' => '006012'

// 'Lock' the first digit
// > Extract the first digit
// > Extract the 2nd-last digits and send that to rotate helper
// Concatenate the String(number) returned from rotate helper to the first digit

// Repeat until the unlocked digits length is 1 - at that point, concatenate the
// unlocked (last) digit to the rest of the string and return it

// After each rotation, remove any leading zeros '006012' => '6012'
// > replaceAll (/^0*/g) - match and replace any 0s occuring at the start (^) of
//   the string

// Algorithm:
// Given a number as input, `number`:
// 1) Convert number into a string (numberString)
// 2) Initialize a counter variable to keep track of how many leading digits to
//    lock (lockedDigitCount = 0)
// 3) Initialize a loop; while lockedDigitCount is less than the length of 
//    numberString:
//    - Extract the leading (locked) digits: numString.slice(0, lockedDigitCount)
//    - Extract the remainder (unlocked) digits: numStr.slice(lockedDigitCount + 1)
//    - Rotate the unlocked digits (move the first char to the end)
//    - Concatenate the locked digits to the rotated unlocked digits and assign the
//      result to numberString
//    - Incrmeent lockedDigitCount by 1
// 4) Return numberString


// function maxRotation(number) {
//   let numberString = String(number);
//   let lockedDigitCount = 0;

//   while (lockedDigitCount < numberString.length) {
//     let lockedDigits   = numberString.slice(0, lockedDigitCount);
//     let trailingDigits = numberString.slice(lockedDigitCount);

//     let rotatedTrailingDigits = rotateString(trailingDigits);
    
//     numberString = lockedDigits + rotatedTrailingDigits;
//     lockedDigitCount += 1;
//   }

//   return Number(stripLeadingZeros(numberString));
// }

// function rotateString(string) {
//   let firstChar = string[0];
//   let trailingChars = string.slice(1);

//   return trailingChars + firstChar;
// }

// function stripLeadingZeros(numberString) {
//   return numberString.replaceAll(/^0*/g, '');
// }


// Refactor: Reuse rotateRightmostDigits as-is ===================================
// HELPER: rotateRightmostDigits(number, n) => number (with last n digits rotated)


function rotateRightmostDigits(number, n) {
  let numberString = number.toString();
  if (n > numberString.length) { n = numberString.length };

  let trailingDigits = numberString.slice(-n);
  let leadingDigits  = numberString.slice(0, numberString.length - n);

  let rotatedTrailingDigits = trailingDigits.slice(1) + trailingDigits[0];
  return Number(leadingDigits + rotatedTrailingDigits);
}

// Examples:
console.log(maxRotation(735291));          // 321579
console.log(maxRotation(200601));          // 61020

console.log(maxRotation(3));               // 3
console.log(maxRotation(35));              // 53
console.log(maxRotation(105));             // 15 -- the leading zero gets dropped
console.log(maxRotation(8703529146));      // 7321609845