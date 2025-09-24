// Next Featured Number Higher Than ____

// A 'featured number' is an odd number that follows the given rules:
// 1) Is an odd number
// 2) Is a multiple of 7
// 3) Consists of all unique digits

// Write a function that takes an integer as an argument and returns the featured
// number that is the closest featured number proximal to the given integer.
// - If there is no possible number, return an error message.

// Rules/Patterns
// - Featured numbers must be odd, divisible by 7, and contain unique digits.
//   - Because of this, the largest possible featured number is 9876543201

// Data:
// > Input: 
//   - A Number (representing the baseline number whom the return value must be
//     greater than)
//     - Begin iteration at this number + 1
// - From baseline + 1, find the next number that is both odd and divisible by 7
// - From this number (firstOdd7Multiple), iterate by 7 until finding a number 
//   whose digits are totally unique.

// > Output:
//   - A number (represents the 'featured number' that occurs closest to the 
//     given baseline number)
//   - Or a string (error message if no such number exists; ie. the given baseline
//     equals or exceeds the limit 9876543201)

// Algorithm:
// Given a number as input, baseline:
// *  If baseline >= LIMIT return error message

// 1) Find the next-biggest number from baseline that is both odd and evenly
//    divisible by 7.
//    > Divide baseline by 7 and take the remainder; this represents how far from
//      the next multiple of 7 baseline is if you were to add 7
//    > Add 7 to baseline, then subtract the remainder calculated from step 2. 
//    > If the resulting number is odd, return the result; otherwise, return 
//      result + 7
// 2) Starting from firstOdd7Multiple, iterate in multiples of 14. For each num:
//    a) Check if the current number consists of unique digits
//       > Convert to String => Array of characters
//       > Make a working copy of the chars array as a Set, then convert the Set
//         back into an Array (duplicate chars will be removed)
//       > Compare length of original chars vs. Set (unique) chars
//         - If the original number's digits were all unique, the lengths should be
//           equal (since no characters were removed during the Set transition)
//    b) If true, return current number.

function findNextMultipleOf(n) {
  return function(baseline) {
    return (baseline + n) - (baseline % n);
  }
}

function findNextOddMultipleOf7(baseline) {
  const findNextMultipleOf7 = findNextMultipleOf(7);

  let multipleOf7 = findNextMultipleOf7(baseline);

  return isEven(multipleOf7) ? findNextMultipleOf7(multipleOf7) : multipleOf7;
}

function isEven(number) {
  return number % 2 === 0;
}

function isUnique(array) {
  let uniqueArray = Array.from(new Set(array));

  return uniqueArray.length === array.length;
}

function featured(baseline) {
  const MAX_FEATURED_NUMBER = 9876543201;
  let featuredNumberCandidate = findNextOddMultipleOf7(baseline);
  
  while (featuredNumberCandidate <= MAX_FEATURED_NUMBER) {
    let digits = String(featuredNumberCandidate).split('');
    if (isUnique(digits)) return featuredNumberCandidate;

    featuredNumberCandidate += 14; // Next Odd Multiple of 7
  }

  return "There is no possible number that fulfills those requirements.";
}




// Examples:
console.log(featured(12));           // 21
// => The next multiple of 7 from 12 is 14 (but not odd) => 21
// => 21 does consist of unique digits, so it is a valid featured number


console.log(featured(20));           // 21
console.log(featured(21));           // 35

console.log(featured(997));          // 1029
console.log(featured(1029));         // 1043
console.log(featured(999999));       // 1023547
console.log(featured(999999987));    // 1023456987
console.log(featured(9876543186));   // 9876543201
console.log(featured(9876543200));   // 9876543201
console.log(featured(9876543201));   // "There is no possible number that fulfills those requirements."