// Diamonds
// Write a function that displays a 4-point diamond in a NxN grid, where N is an
// odd integer given as argument.
// - Assume that the argument will always be an odd integer.

// Questions:
// 1) Can the input ever be a negative (odd) integer?
// => No

// Input: 
// - A Number (Odd Integer), representing the dimensions of the diamond to be 
//   built and displayed
// Output:
// - Logs the NxN diamond to the console

// Rules/Patterns:
// For any given value of n:
// - There are n rows
// - Each row has n characters, consisting of a mix of spaces ' ' and stars '*'
// - The widest row occurs at row number n / 2, rounded up, or at 
//   index n / 2, rounded down.
//   eg. If n = 9, the widest row is at row #5, or index 4
// - The number of stars increases by 2 each row until the midpoint is reached,
//   then decreases by 2 thereafter
// - The number of spaces decreases by 1 each row until the midpoint, then increases
//   by 1 thereafter.

// For each row, the number of spaces can be calculated as the absolute difference
// between the midpoint and the current row.
// eg.    n = 7, midpoint is row 4
// row 1: Distance from midpoint is (4 - 1) => 3 (3 preceding spaces)
// row 2: Distance is (4 - 2) => 2 (2 preceding spaces)
// ...
// row 4: Distance is (4-4) => 0 (0 preceding spaces)
// row 5: Distance is (4-5) => 1 (1 preceding space)

// We can then calculate the number of stars based on (n - preceding spaces * 2)
// eg.    n = 7
// row 1: 7 - (3 * 2) => 1 (1 star)
// row 2: 7 - (2 * 2) => 3 (3 stars)
// ...

// Data: 
// > Use 1-indexing
// Calculate the midpoint: (n / 2, round up)
// Iterate from 1 up to n (inclusive). For each iteration (i):
// 1) Calculate the number of stars and spaces for the current row.
//    - 
// 2) Build the string of spaces and stars
// 3) Log the string


// Algorithm:
// Given a positive odd integer as input, n:
// * Calculate the middle row as Ceiling(n / 2)
// 1) Iterate n times. For each iteration:
// 2) Calculate the number of preceding spaces 
//    > Abs(middleRow - currentRow)
// 3) Calculate the number of stars
//    > n - (precedingSpaces * 2)
// 4) Build and log a string using the number of preceding spaces + number of stars

function diamond(n) {
  let midRow = Math.ceil(n / 2);

  for (let row = 1; row <= n; row++) {
    let leftSpaceCount = Math.abs(midRow - row);
    let starCount      = n - (leftSpaceCount * 2);

    console.log(' '.repeat(leftSpaceCount) + '*'.repeat(starCount));
  }
}


// Examples:
diamond(1);
// *


diamond(3);
//  *
// ***
//  *

diamond(5);
//   *    1: 2 spaces, 1 star
//  ***   2: 1 space,  3 stars
// *****  3: 0 spaces, 5 stars
//  ***   4: 1 space,  3 stars
//   *    5: 2 spaces, 1 star

diamond(7);
//    *     Row 1, Index 0, 3 spaces, 1 star    
//   ***    Row 2, Index 1, 2 spaces, 3 stars       
//  *****   Row 3, Index 2, 1 space,  5 stars        
// *******  Row 4, Index 3, 0 spaces, 7 stars (Midpoint)               
//  *****   Row 5, Index 4, 1 space,  5 stars (Distance from Midpoint: 1)                
//   ***    Row 6, Index 5, 2 spaces, 3 stars (Distance from Midpoint: 2)           
//    *     Row 7, Index 6, 3 spaces, 1 star  (Distance from Midpoint: 3)          

diamond(9);
//     *      1: 1 star,  4 preceding spaces
//    ***     2: 3 stars, 3 preceding spaces
//   *****    3: 5 stars, 2 preceding spaces
//  *******   4: 7 stars, 1 preceding space
// *********  5: 9 stars, 0 preceding spaces
//  *******   6: 7 stars, 1 preceding space
//   *****    7: 5 stars, 2 preceding spaces
//    ***     8: 3 stars, 3 preceding spaces
//     *      9: 1 star,  4 preceding spaces