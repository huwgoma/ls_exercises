// Triangles can be classified according to their internal angles as follows:
// 1) Right: One angle is 90 degrees exactly
// 2) Acute: All 3 angles are < 90 degrees
// 3) Obtuse: One angle is greater than 90 degrees

// For a triangle to be considered valid, the angles must sum to exactly 180 
// degrees, and every angle must be greater than 0.

// Write a function that takes the 3 angles of a triangle and returns one of 
// four strings: right, acute, obtuse, or invalid.

// Rules/Patterns
// - Assume that all angles have integer values, and are represented in degrees.

// Data: 
// > Input: 3 numbers (representing the angles of the triangle in degrees)
// 1) Validate the triangle
//   > A triangle is considered valid if:
//     a) All angles are > 0
//     b) The sum of all angles is exactly 180
// => 'invalid' if triangle is not valid

// 2) Classify the triangle
//   > Look at the largest given angle
//   - If maxAngle > 90   => obtuse
//   - If maxAngle === 90 => right
//   - If maxAngle < 90   => acute

// > Output: String (represents the classification of the triangle)

function triangle(angleA, angleB, angleC) {
  let angles = [ angleA, angleB, angleC ];

  if (!isValidTriangle(angles)) return 'invalid';

  let maxAngle = Math.max(...angles);
  if (maxAngle > 90) {
    return 'obtuse';
  } else if (maxAngle < 90) {
    return 'acute';
  } else { 
    return 'right';
  }
}

function isValidTriangle(angles) {
  return angles.length === 3 &&
         angles.every(angle => angle > 0) &&
         angles.reduce((sum, angle) => sum + angle, 0) === 180;
}

// Examples

console.log(triangle(60, 70, 50));       // "acute"
// [50, 60, 70]
console.log(triangle(30, 90, 60));       // "right"
// [30, 60, 90]
console.log(triangle(120, 50, 10));      // "obtuse"
// [10, 50, 120]
console.log(triangle(0, 90, 90));        // "invalid" (0 side)
console.log(triangle(50, 50, 50));       // "invalid" (sum !== 180)