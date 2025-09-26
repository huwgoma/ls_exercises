// Transpose 3x3
// A 3x3 matrix can be represented using an array of arrays. For example:
//  1 5 8  => [ [ 1, 5, 8 ],
//  4 7 2  =>   [ 4, 7, 2 ],
//  3 9 6  =>   [ 3, 9, 6 ] ]


// The 'transpose' of a 3x3 matrix is the result of swapping the
// rows and columns of the original matrix. For example:

//  1 5 8 - Row 1 [1, 5, 8]; Column 1 [1, 4, 3]
//  4 7 2 - Row 2 [4, 7, 2]; Column 2 [5, 7, 9]
//  3 9 6 - Row 3 [3, 9, 6]; Column 3 [8, 2, 6]

// By swapping the rows and columns above, we would get the matrix:
//  1 5 8  =>  1 4 3
//  4 7 2  =>  5 7 9
//  3 9 6  =>  8 2 6


// Write a function that takes a 2-D array representing a 3x3 matrix,
// and returns a new 2-D array representing the transposed matrix.

// Rules/Patterns/Q&A:
// - Do not modify the original matrix.
// - Can we assume that the input will always be given as described?
// => Yes
// - Can either the top-level or nested arrays be sparse?
// => No

// From the original matrix:
// - Each row can be accessed as a subarray at index row-number - 1. 
//   eg. The first row can be accessed as matrix[0] => [1, 5, 8]
//       The second row can be accessed as matrix[1] => [4, 7, 2]
//       The third row can be accessed as matrix[2] => [3, 9, 6]
// - Columns can be accessed by mapping over each subarray and 
//   retrieving the element at column-number - 1.
//   eg. The first column can be accessed as 
//       matrix.map(row => row[0])
//       etc...
// Once we have the columns 
// => [ [1, 4, 3], [5, 7, 9], [8, 2, 6] ]
// - This is the result we want 

// Data:
// > Input: 2-D array of subarrays
//   3x3, each subarray represents a row

// Transform the given matrix; for each subarray (row):
// - Build and return a new subarray containing the elements at the  
//   corresponding column #
//   eg. On the first iteration, return a subarray containing the
//       first element of each row subarray

// > Output: New 2-D array of subarrays
//   3x3, each subarray represents a column from the original array


// Algorithm:
// Given a 2-D 3x3 subarray as input, matrix:
// 1) Iterate over each index of a matrix row (i = 0..2). For each index:
// 2) Build and return an array of the ith elements from each row
//    of matrix.
//    > matrix.map(row => row[index])
// => array of subarrays where each subarray represents the ith 
//    column elements from the original matrix


function transpose(matrix) {
  // [ 0..matrix.length - 1 ]
  let colIndexes = Array.from({ length: matrix[0].length }, (_, i) => i);

  return colIndexes.map(colIndex => {
    return matrix.map(row => row[colIndex]);
  });
}



// Examples:
const matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
];

const newMatrix = transpose(matrix);

console.log(newMatrix);      // [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
console.log(matrix);         // [[1, 5, 8], [4, 7, 2], [3, 9, 6]]