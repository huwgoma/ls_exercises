// Merge Sorted Lists
// Write a function that takes two sorted arrays as arguments and 
// returns a new array, containing all elements from both input
// arrays in sorted order.

// Rules:
// - Your solution may not sort the result array before returning it. 
// - The result array must be built one element at a time.
// - The input arrays should not be mutated.
// - Will the input arrays contain values of different types?
// => No - assume the elements in the input arrays will be safely
//    comparable.
// - If two elements are equal, add the one from the first array first.

// Data:
// > Input: 2 arrays (assume sorted)
// Preliminary approach?
// - Maintain 2 indexes, one for each array
// - Compare elements from each array eg. a[0] <=> b[0]
// - Add the smaller element to result
// - Increment the index of the smaller element 
// - Repeat eg. a[1] <=> b[0]
// - If either index reaches the end (< array.length), add all 
//   remaining elements from the other array (from otherIndex..end)

// > Output: new array (contains all elements from the 2 given
//   arrays in sorted order)

// Algorithm:
// Given 2 arrays as input, arrayA and arrayB:
// result = []
// 1) Initialize two indexes, one for each array: indexA, indexB (0)
// 2) Initialize a loop - while indexA is less than arrayA.length and
//    also while indexB is less than arrayB.length:
// 3) Retrieve elements from arrayA and arrayB
//    > arrayA[indexA], arrayB[indexB]
// 4) Compare the two elements (<=>)
//    - If elementA is less than or equal to element B, add element A
//      to the result array, and increment indexA by 1
//    - Otherwise, add element B to result and increment indexB by 1

// >> This is if the loop condition is "loop while both indexes are less than
//    their array lengths"
// 5) At the end of iteration, add all remaining elements to result:
//    > Whichever array was finished, its index will equal its length
//      - Therefore slicing from index will return an empty array
//    > The other array's index will be somewhere between 0 and its 
//      array length -1 
//      - Therefore slicing from index -> end will return the remaining
//        elements
//    > Concatenate arrayA.slice(indexA) and arrayB.slice(indexB) to
//      result
// 6) Return result

function merge(arrayA, arrayB) {
  let [ indexA, indexB ] = [ 0,  0 ];
  let result = [];

  while (indexA < arrayA.length && indexB < arrayB.length) {
    let elementA = arrayA[indexA];
    let elementB = arrayB[indexB];

    if (elementA <= elementB) {
      result.push(elementA);
      indexA += 1;
    } else {
      result.push(elementB);
      indexB += 1;
    }
  }
  // Add leftover elements to result
  return result.concat(arrayA.slice(indexA), arrayB.slice(indexB));
}

// Example:
console.log(merge([1, 5, 9], [2, 6, 8]));      // [1, 2, 5, 6, 8, 9]
console.log(merge([1, 1, 3], [2, 2]));         // [1, 1, 2, 2, 3]
console.log(merge([], [1, 4, 5]));             // [1, 4, 5]
console.log(merge([1, 4, 5], []));             // [1, 4, 5]