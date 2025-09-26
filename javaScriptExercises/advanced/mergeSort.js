// Merge Sort
// - Merge sort is a recursive sorting algorithm that works by
//   dividing an array's elements into nested sub-arrays, then combining
//   those subarrays back together in sorted order.

// Example:
// > [9, 5, 7, 1, 8, 2, 0, 6]
// 1) Recursively divide the array into nested subarrays:
// [ [9, 5, 7, 1], [8, 2, 0, 6] ]
// [ [ [9, 5], [7, 1] ], [ [8, 2], [0, 6] ] ]
// [ [ [ [ [9], [5] ], [ [7], [1] ] ], [ [ [8], [2] ], [ [0], [6] ] ] ] ]

// 2) Merge each pair of nested arrays back together in sorted order.
// > [9], [5] => [5, 9]
// > [7], [1] => [1, 7]
// ...
// > [5, 9], [7, 1] => [1, 5, 7, 9]

// Rules:
// - You may reuse the `merge` function from last exercise.
// - Assume that all elements will be of the same type
// - When dividing an array with an odd number of elements, the
//   extra element should go into the second array

// Recursion?
// - What do we do once we have the super-nested array?
// - Somehow convert it back into a flat (sorted) array
// - Merging each pair of arrays into one 
// - But we cannot merge two arrays if they themselves contain more
//   arrays
// - We need to go deeper - we can only merge two arrays if each array
//   does not contain any nested arrays.
// == Example ==
// [ [ [6], [2] ], [ [7], [1] ] ]
// We cannot merge this whole array as-is because its two arrays
// ([ [6], [2] ] and [ [7], [1] ]) each contain arrays of their own
// - Therefore we go deeper:
// 1) [ [6], [2] ] - This is mergeable (each subarray [6] and [2]) is
//                   flat 
//    => Pass [6] and [2] to merge => [2, 6] (merged array)
// > Reduction? (not transformation)


// Data: 
// > Input: An array
// What is the shape of this problem?
// > Simplest Example: [5, 3]
//   => [ [5], [3] ]
//   Return merge(array[0], array[1])
// > +1 Example: [5, 3, 1]
//   => [ [5], [3, 1] ] => [ [5], [ [3], [1] ] ]
//   Return merge array[0], array[1]
//   - But array[1] cannot be merged - it contains arrays of its own
//   array[1] = merge(array[1][0], array[1][1])


// 1) Convert the given array into an array of (very) nested 1-element
//    subarrays
//    > How to correctly access arrays of unknown depth?
//    > Start from the top (2 subarrays)
//    > If there are 2 elements (2 subarrays), we need to go deeper
//    > When there is only one element, we are at the bottom level
// 2) Merge each subarray pair back into one subarray (sorted)
//    > At every level, the array will have 2 elements.
//    > Base Case: When both array A and array B are flat (no elements
//      are arrays)
//    > recursiveMerge(arrayA, arrayB)
//      - if (isNested(arrayA)) => arrayA = rMerge(arrayA[0], arrA[1])
//      - if (isNested(arrayB)) => arrayB = rMerge(arrayB[0], arrB[1])
//      return merge (arrA, arrB)

// > Output: A new array (sorted using merge sort)


// // Step 1: Partition
// function recursivePartition(array) {
//   // Base Case
//   if (array.length === 1) return array; 

//   let midpoint = Math.floor(array.length / 2);

//   let leftHalf  = array.slice(0, midpoint);
//   let rightHalf = array.slice(midpoint);

//   let partitioned = [ leftHalf, rightHalf ];

//   partitioned[0]  = recursivePartition(leftHalf);
//   partitioned[1]  = recursivePartition(rightHalf);

//   return partitioned;
// }

// // Step 2: Unfold + Sort
// function recursiveMerge(arrayA, arrayB) {
//   // Base Case: When arrayA and arrayB are both flat (not nested)
//   if (isNested(arrayA)) { arrayA = recursiveMerge(arrayA[0], arrayA[1]) }
//   if (isNested(arrayB)) { arrayB = recursiveMerge(arrayB[0], arrayB[1]) }

//   return merge(arrayA, arrayB);
// }

// function isNested(array) {
//   return array.some(element => Array.isArray(element));
// }

// function merge(arrayA, arrayB) {
//   let [ indexA, indexB ] = [ 0,  0 ];
//   let result = [];

//   while (indexA < arrayA.length && indexB < arrayB.length) {
//     let elementA = arrayA[indexA];
//     let elementB = arrayB[indexB];

//     if (elementA <= elementB) {
//       result.push(elementA);
//       indexA += 1;
//     } else {
//       result.push(elementB);
//       indexB += 1;
//     }
//   }
//   // Add leftover elements to result
//   return result.concat(arrayA.slice(indexA), arrayB.slice(indexB));
// }

// // Step 3: Put folding and unfolding together
// function mergeSort(array) {
//   if (array.length < 2) return array;

//   let partitionedArray = recursivePartition(array);

//   return recursiveMerge(partitionedArray[0], partitionedArray[1]);
// }


// ========== Refactor ===========
// - Implement the solution in a way where there is only one recursive
//   function.

// Algorithm:
// Given an array as input:
// 1) Slice the array in half
// 2) Pass each half to merge 
//    => Returns a new array with elements sorted
//    ** Only works with flat arrays
//    => Therefore, before passing the half-array to merge, run it
//       through mergeSort again
// Base Case of mergeSort:
// - If array length is 0 or 1, return array as-is without slicing.

function mergeSort(array) {
  // Base Case:
  if (array.length < 2) return array;

  let midpoint  = Math.floor(array.length / 2);
  let leftHalf  = array.slice(0, midpoint);
  let rightHalf = array.slice(midpoint);

  return merge(mergeSort(leftHalf), mergeSort(rightHalf));
}

// arrayA + arrayB => arrayC (sorted)
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

// Examples:
console.log(mergeSort([9, 5, 7, 1]));               // [1, 5, 7, 9]
console.log(mergeSort([5, 3]));                     // [3, 5]
console.log(mergeSort([5, 3, 1]));                  // [1, 3, 5]
console.log(mergeSort([6, 2, 7, 1, 4]));            // [1, 2, 4, 6, 7]
console.log(mergeSort([9, 2, 7, 6, 8, 5, 0, 1]));   // [0, 1, 2, 5, 6, 7, 8, 9]

console.log(mergeSort(['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie']));
// // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]

console.log(mergeSort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]));
// // [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

console.log(mergeSort([])); // []
console.log(mergeSort([1])); // [1]