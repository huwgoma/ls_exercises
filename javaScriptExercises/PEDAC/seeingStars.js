// Seeing Stars
// Write a function that displays an 8-pointed star in a NxN grid, where N is an
// odd integer given as an argument.
// - The smallest value for n will be 7.

// Questions:
// 1) Can we assume that n will always be an odd integer >= 7?
// => Yes
// 2) Can we assume that every non-midpoint row will always contain 3 stars?
// => Yes

// Input: 
// - A Number (odd integer, greater than/equal to 7)
// - Represents the 'size' of the star
// Output:
// - An '8-pointed star', in an NxN grid (log to console)

// Rules/Patterns:
// - The number of rows and columns are equal (both = n)
// - The middle row consists solely of stars (N stars wide)
// - All other rows contain 3 stars
//   - The spaces between each star decreases by 1 for each row (before midpoint)
//     and increases by 1 for each row after midpoint
//     - spaces between can be calculated as distance from midpoint - 1

//   - The number of spaces before the first star in each row starts at 0 and 
//     increases by 1 for each row before midpoint/decreases by 1 for each row
//     after midpoint
//     - spaces before can be calculated by first building the stars + spaces
//       string, then calculating the left Pad size (n - string.length) / 2

// - The middle row can be calculated as ceiling (n / 2)
//   - Middle row just consists of n stars (no spaces)

// Data:
// - Build and log n strings
// - Midpoint: ceiling(n / 2)

// Algorithm
// Given a number as input, n:
// - Calculate midpoint ceil(n / 2)
// Iterate from 1..n. For each iteration, build and log a string representing the
// current row of the star
// - If current row === midpoint, string => '*'.repeat(n)
// Otherwise:
// - Calculate distance of current row from midpoint
//   > Abs(midpoint - currentRowNumber)
// - Calculate spacesBetween for the current row
//   > distanceFromMidpoint - 1
// - Build the string
//   > 3 stars, joined with spacesBetween
// - Pad the string on the left side with (n - string.length) / 2 spaces
//   (Centering the string with spaces to n length, but only one half)
// - Log the string

function star(n) {
  const STARS = ['*', '*', '*'];
  const MIDPOINT = Math.ceil(n / 2);

  for (let row = 1; row <= n; row++) {
    if (row === MIDPOINT) {
      console.log('*'.repeat(n));
    } else {
      let distanceFromMidpoint = Math.abs(MIDPOINT - row);
      let spacesBetween = ' '.repeat(distanceFromMidpoint - 1);
      let rowString = STARS.join(spacesBetween);

      console.log(center(rowString, n));
    }
  }
}

function center(string, padLength, padChar = ' ') {
  let padEachSide = (padLength - string.length) / 2;
  let padding = padChar.repeat(padEachSide);

  return `${padding}${string}${padding}`;
}

// Examples:
// - Smallest N Value:
star(7);
// *  *  *
//  * * *
//   ***
// *******
//   ***
//  * * *
// *  *  *

// N = 9 
star(9);
// *   *   *
//  *  *  *
//   * * *
//    ***
// *********
//    ***
//   * * *
//  *  *  *
// *   *   *