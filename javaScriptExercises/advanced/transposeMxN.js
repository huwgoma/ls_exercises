// Transpose (MxN)
// Refactor the transpose function from the transpose3x3 exercise so
// that it works with any matrix with the dimensions MxN, where M
// and N are > 0 (ie. the matrix will always have at least one row
// and one column.)

// Questions:
// 1) Can we assume that all rows and all columns will have an identical
//    number of elements to other rows and columns?
// => Yes 

// Algorithm: 

// - Fundamentally, the algorithm does not change.
// 1) Iterate from 0-n, where n is the number of columns, or width of
//    each row. For each iteration:
// 2) Build and return a subarray of the elements in the current column,
//    or the elements at the current index in each row.

function transpose(matrix) {
  return matrix[0].map((_, colIndex) => {
    return matrix.map(row => row[colIndex]);
  });
}

// Examples:
console.log(transpose([[1, 2, 3, 4]]));            
// [[1], [2], [3], [4]]
console.log(transpose([[1], [2], [3], [4]]));      
// [[1, 2, 3, 4]]
console.log(transpose([[1]]));                     
// [[1]]

console.log(transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]));
// [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]