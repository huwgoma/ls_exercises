// Triangle Sides
// A triangle is classifed as follows:
// 1) Equilateral - All 3 sides are equal
// 2) Isosceles   - 2 sides are equal, 1 is different
// 3) Scalene     - All 3 sides are different

// For a triangle to be valid, the 2 shortest side lengths must be greater than the
// length of the longest side, and every side must be longer than 0.

// Write a function that takes 3 numbers representing the side lengths of a 
// triangle and returns a string classifying the triangle.
// > equilateral, isosceles, scalene, or invalid.

// Rules/Patterns:
// - A triangle is only considered valid if:
//   1) Its 2 shortest sides are cumulatively longer than its longest side.
//      eg. [2, 3, 7] => 2 + 3 (5) is less than 7 => invalid
//   2) All sides are positive (greater than 0)
// - If the triangle is valid, classify it based on the uniqueness of its lengths:
//   - 3 unique => scalene
//   - 2 unique => isosceles
//   - 1 unique => equilateral

// Data: 
// Input: 3 numbers 
// 1) Validate
// => Array of numbers eg. [3, 4, 5]
//    a) Validate that lengths are all > 0
//    b) Validate that the two shortest sides > the longest side
// 2) Classify
// => Convert the array of lengths to a Set (stores primitive values uniquely by
//    value)
//    - Classify based on the #size of the Set (3 => scalene, 2 => isosceles,
//      1 => equilateral)
// Output: String (classifying the triangle type)

// Algorithm:
// Given 3 numbers as input:
// 1) Determine the validity of the triangle:
//    a) Place the numbers in an array
//    b) Interrogate - All numbers must be > 0
//    c) Sort the array in ascending order
//    d) Confirm that array (first 2 elements) > array (last element)
//    - If at any point validation fails, return 'invalid'

// 2) If the triangle is valid, classify it:
//    a) Convert the lengths array to a Set
//    b) Match the Set#size to an integer between 1-3:
//    => 1 => equilateral
//    => 2 => isosceles
//    => 3 => scalene

function triangle(lengthA, lengthB, lengthC) {
  let lengths = [ lengthA, lengthB, lengthC ];

  if (!isTriangleValid(lengths)) return 'invalid';

  let uniqueLengths = new Set(lengths);
  switch (uniqueLengths.size) {
    case 1:
      return 'equilateral';
    case 2:
      return 'isosceles';
    case 3:
      return 'scalene';
  }
}

function isTriangleValid(lengths) {
  lengths = lengths.toSorted((a, b) => Number(a) - Number(b));

  return lengths.length === 3 && 
         lengths.every(length => length > 0) &&
         lengths[0] + lengths[1] > lengths[2];
}

// Examples:
console.log(triangle(3, 3, 3));        // "equilateral"
console.log(triangle(3, 3, 1.5));      // "isosceles"
console.log(triangle(3, 4, 5));        // "scalene"
console.log(triangle(0, 3, 3));        // "invalid"
console.log(triangle(3, 1, 1));        // "invalid"