// Bubble Sort
// - The bubble sort works by making multiple passes through an array.
// - On each pass, consecutive element pairs are compared. If the 1st
//   value is greater than the 2nd, the two elements are swapped; 
//   otherwise, they remain in place. 
// - This process repeats until a complete pass is made without 
//   performing any swaps, at which point the array is considered 
//   fully sorted.

// Questions:
// 1) Can the array ever be missing or non-array?
// => No
// 2) Can the array be empty or only contain one element?
// => Yes => Return array as-is
// 3) Can the array contain non-primitive values?
// => No
// 4) What should the function return?
// => undefined


// Example:
// [6, 2, 7, 1, 4]
// Pass 1:
//  [6, 2]: 6 > 2 => Swap    => [2, 6, 7, 1, 4]
//  [6, 7]: 6 < 7 => No Swap => [2, 6, 7, 1, 4]
//  [7, 1]: 7 > 1 => Swap    => [2, 6, 1, 7, 4]
//  [7, 4]: 7 > 4 => Swap    => [2, 6, 1, 4, 7]

// Pass 2:
//  [2, 6]: 2 < 6 => No Swap => [2, 6, 1, 4, 7]
//  [6, 1]: 6 > 1 => Swap    => [2, 1, 6, 4, 7]
//  [6, 4]: 6 > 4 => Swap    => [2, 1, 4, 6, 7]
// * Each pass of a bubble sort will fully sort the nth largest element
//   - So each subsequent pass can look at one fewer element pair 

// Pass 3:
//  [2, 1]: 2 > 1 => Swap    => [1, 2, 4, 6, 7]
//  [2, 4]: 2 < 4 => No Swap => [1, 2, 4, 6, 7]

// Pass 4: 
//  All elements are fully sorted (no swaps will occur)


// Write a function that takes an array as an argument and sorts
// it in-place (mutating) using the bubble sort algorithm.

// Rules / Patterns:
// For any array of length n:
// - We will make n - 1 passes through the array before it is fully 
//   sorted.
//   > for (let pass = 1; pass < array.length)

// - On the first pass, the number of iterations is identical to the
//   number of total passes required
// - On each subsequent pass, the number of iterations decreases by 1
//   on each iteration, because each pass will fully sort the 
//   p-th largest element.
// > In other words, each pass will involve array.length - passNumber
//   # of iterations

// - On each pass, we iterate (array.length - passNumber) times;
//   > for (let index = 0; index < array.length - passNumber)

// - On each iteration, we retrieve the element at the current index
//   as well as the next index, and compare them: 
//   - If a > b, swap the elements in-place
//   - Otherwise, do nothing (continue)

// Data: 
// > Input: Array of elements
// - Keep as array
// - Make array.length - 1 passes through the array
// - On each pass, iterate x times, where x = array.length - passNumber
//   eg. For an array of 5 elements, on pass 1, we iterate 4 times.
//       On Pass 2, we iterate 3 times; etc...


// Algorithm:
// Given an array of elements as input:
// 1) [GUARD] - If the array length is less than 2, return array as-is
// 2) Initialize a loop for the number of passes through the array, 
//    which can be calculated as 1 up to the array's length - 1. 
// For each pass:
// 3) Initialize a loop for iterating through -some of- the array 
//    elements; the indexes of interest can be calculated as index 0
//    to index array.length - current pass number.
// For each iteration:
// 4) Compare the current element array[index] with the next element
//    array[index + 1]
// 5) If currentElement > nextElement, swap the two elements in-place:
//    [ array[index], array[index + 1] = [ array[index + 1], array[index] ]
// At the end of all passes, the array should be fully sorted.
// Return undefined.

// function bubbleSort(array) {
//   const arrayLength = array.length;
//   if (arrayLength < 2) return array;

//   // Passes
//   for (let passNumber = 1; passNumber < arrayLength; passNumber++) {
//     // Iterations
//     console.log(passNumber)
//     for (let index = 0; index < arrayLength - passNumber; index++) {
//       let [ currentElement, nextElement ] = [ array[index], array[index + 1] ];
      
//       if (currentElement > nextElement) {
//         [ array[index], array[index + 1]] = [ array[index + 1], array[index] ];
//       }
//     }
//   }
// }

// Refactor: Implement a swapped check so that if a complete pass is
// made without any swaps, the pass-through iteration can end (because
// the array might be fully-sorted in less than the max number of
// passes.)

// How?
// - On each pass, set a variable (swapped = false) before iteration
//   begins
// - During iteration, if a swap is made, set swapped = true
// - at the end of each pass, if swapped is still false, exit pass
//   iteration

function bubbleSort(array) {
  const arrayLength = array.length;
  if (arrayLength < 2) return array;

  // Passes
  for (let passNumber = 1; passNumber < arrayLength; passNumber++) {
    let noSwapsMade = true;
    // Iterations
    for (let index = 0; index < arrayLength - passNumber; index++) {
      let [ currentElement, nextElement ] = [ array[index], array[index + 1] ];
      
      if (currentElement > nextElement) {
        [ array[index], array[index + 1]] = [ array[index + 1], array[index] ];
        noSwapsMade = false;
      }
    }

    if (noSwapsMade) break;
  }
}


// Examples:
let arrayLength5 = [6, 2, 7, 1, 4];
bubbleSort(arrayLength5);
console.log(arrayLength5); //=> [1, 2, 4, 6, 7];

let arrayLength2 = [2, 1];
bubbleSort(arrayLength2);
console.log(arrayLength2); //=> [1, 2]

let alreadySorted = [1, 2, 3, 4, 5];
bubbleSort(alreadySorted);
console.log(alreadySorted); //=> [1, 2, 3, 4, 5]


// String Sorting
let stringArray = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
bubbleSort(stringArray);
console.log(stringArray); // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]

// Edge Cases:
// - Empty Array
let emptyArray = [];
bubbleSort(emptyArray);
console.log(emptyArray); // []

// - One-element Array
let arrayLength1 = [1];
bubbleSort(arrayLength1); 
console.log(arrayLength1); // [1]
