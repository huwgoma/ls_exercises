// Rotating Matrix
// Given a matrix represented as a 2-D array:
// [
//   [1, 5, 8],
//   [4, 7, 2],
//   [3, 9, 6],
// ]

// A 90-degree rotation of a matrix produces a new matrix in which the
// sides of the matrix are rotated, like so:
//  1 5 8  =>  3 4 1
//  4 7 2  =>  9 7 5
//  3 9 6  =>  6 2 8

// The same rule applies to a non-square matrix:
//  3 4 1  => 9 3
//  9 7 5  => 7 4
//         => 5 1

// Write a function that takes an MxN matrix, rotates it clockwise by 
// 90 degrees, and returns the result as a new 2-D array.
// - Do not mutate the original matrix.

// Patterns:
// - In the rotated matrix, each row is equivalent to the corresponding
//   column, but upside-down.
//   eg. [3, 4, 1] is equivalent to column 1 from the original matrix
//       [1, 4 3], but flipped.

// Data:
// > Input: A 2-D array of subarrays, where each subarray represents 
//   a row in the matrix

// - Iterate 0..n times, where n is the number of columns (row width).
//   For each iteration:
//   - Build and return an array representing the new value of the 
//     row after rotation
//   - Which corresponds to the elements in the matching column, but
//     in reverse order.

// > Output: A new 2-D array of subarrays, where each row represents
//   a row in the rotated matrix (rotating outer edges clockwise 90 degrees)

// Algorithm:
// Given a 2-D array as input, matrix:
// 1) Iterate over the indexes of the first matrix row => colIndexes.
//    For each column index:
// 2) Build a reversed column array:
//    > Retrieve the elements at current colIndex from each row
//    > Reverse the resulting column array (destructive so be careful)
//    => Return reversed column array
// => 2-D array of reversed columns (rotated) => Return

function rotate90(matrix) {
  return matrix[0].map((_, colIndex) => {
    return matrix.map(row => row[colIndex]).reverse();
  });
}

// Examples:
const matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
];

const matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8],
];

const newMatrix1 = rotate90(matrix1);
const newMatrix2 = rotate90(matrix2);
const newMatrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))));

console.log(newMatrix1);      // [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
console.log(newMatrix2);      // [[5, 3], [1, 7], [0, 4], [8, 2]]
console.log(newMatrix3);      // `matrix2` --> [[3, 7, 4, 2], [5, 1, 0, 8]]
console.log(matrix1);
console.log(matrix2);