// Cute Angles
// - Write a function that takes one argument - a floating point number,
//   representing an angle from 0-360 degrees - and returns a string, representing
//   that angle in degrees, minutes, and seconds.
// - There are 60 minutes in a degree, and 60 seconds in a minute.

// function dms(degreeAngle) {
//   const DEGREE = '\u00B0';
//   const DMS_BASE = 60;

//   let [ degrees, remainder ] = intFloat(degreeAngle);
//   let [ minutes, minutesRemainder ] = intFloat(remainder * DMS_BASE);
//   let [ seconds ] = intFloat(minutesRemainder * DMS_BASE); 

//   let formattedMinutes = minutes.toString().padStart(2, '0');
//   let formattedSeconds = seconds.toString().padStart(2, '0');

//   return `${degrees}${DEGREE}${formattedMinutes}'${formattedSeconds}"`;
// }

// function intFloat(number) {
//   let integer = parseInt(number, 10);
//   let float = number - integer;

//   return [integer, float];
// }

// console.log(dms(30)) //=== "30°00'00\"");
// console.log(dms(76.73)) //=== "76°43'48\"");
// console.log(dms(254.6)) //=== "254°35'59\"");
// console.log(dms(93.034773)) //=== "93°02'05\"");
// console.log(dms(0)) //=== "0°00'00\"");
// console.log(dms(360)) //=== "360°00'00\"" || dms(360) === "0°00'00\"");


// Further Exploration: Refactor this solution so that it works with any number,
// not just numbers between 0-360.

// function dms(degreeAngle) {
//   const DEGREE = '\u00B0';
//   const DMS_BASE = 60;
//   const DEG_MIN = 0;
//   const DEG_MAX = 360;

//   degreeAngle = wrapToRange(degreeAngle, DEG_MIN, DEG_MAX);

//   let [ degrees, remainder ] = intFloat(degreeAngle);
//   let [ minutes, minutesRemainder ] = intFloat(remainder * DMS_BASE);
//   let [ seconds ] = intFloat(minutesRemainder * DMS_BASE); 

//   let formattedMinutes = minutes.toString().padStart(2, '0');
//   let formattedSeconds = seconds.toString().padStart(2, '0');

//   return `${degrees}${DEGREE}${formattedMinutes}'${formattedSeconds}"`;
// }

// function intFloat(number) {
//   let integer = parseInt(number, 10);
//   let float = number - integer;

//   return [integer, float];
// }

// function wrapToRange(value, min, max) {
//   if (value <= max && value >= min) return value;

//   if (value > 0) {
//     return value % max;
//   } else {
//     return max - Math.abs((value % max));
//   }
// }

// console.log(dms(30)) //=== "30°00'00\"");
// console.log(dms(76.73)) //=== "76°43'48\"");
// console.log(dms(254.6)) //=== "254°35'59\"");
// console.log(dms(93.034773)) //=== "93°02'05\"");
// console.log(dms(0)) //=== "0°00'00\"");
// console.log(dms(360)) //=== "360°00'00\"" || dms(360) === "0°00'00\"");

// console.log(dms(-1));   // 359°00'00"
// console.log(dms(400));  // 40°00'00"
// console.log(dms(-40));  // 320°00'00"
// console.log(dms(-420)); // 300°00'00"


// =================================================================


// Combining Arrays
// - Write a function that takes two arrays as arguments and returns a new array
//   containing the union of both array elements.
// - The returned array should contain no duplicates, even if there are duplicate
//   items in the original arrays.
// - Further Exploration: Extend this function so that it works with any number of
//   arrays.

// function union(...arrays) {
//   let result = [];

//   arrays.forEach(function(array) {
//     array.forEach(element => {
//       if (!result.includes(element)) result.push(element)
//     });
//   });

//   return result;
// }

// console.log(union([1, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9]


// =================================================================


// Halvsies
// - Write a function that takes an array as an argument and returns an array
//   with two elements, each of which is an array.
// - The first half of the original array's elements should be in the first 
//   subarray, and second half -> second subarray
// - If the original array has an odd number of elements, the middle element 
//   should go in the first subarray.

// function halvsies(array) {
//   let halfIndex = Math.ceil(array.length / 2);
//   let firstHalf = array.slice(0, halfIndex);
//   let secondHalf = array.slice(halfIndex);

//   return [ firstHalf, secondHalf ];
// }


// console.log(halvsies([1, 2, 3, 4]));       // [[1, 2], [3, 4]]
// console.log(halvsies([1, 5, 2, 4, 3]));    // [[1, 5, 2], [4, 3]]
// console.log(halvsies([5]));                // [[5], []]
// console.log(halvsies([]));                 // [[], []]


// ========================================================================


// Find the Duplicate
// - Given an unordered array, and the assumption that exactly one value in the
//   array is duplicated (all other values occur exactly once), write a function
//   that finds and returns the duplicate value.

// function findDup(numbers) {
//   let numberCounts = {};

//   numbers.forEach(number => {
//     numberCounts[number] = numberCounts[number] || 0;
//     numberCounts[number] += 1;
//   });

//   let duplicate = Object.keys(numberCounts).find(number => numberCounts[number] > 1);

//   return parseInt(duplicate, 10);
// }

// // Refactor: Is there a need to go through the whole array?
// // - As we iterate:
// //  - if numbersSeen current number is false, register the current number
// //  - but if numbersSeen[current number] is true, return the current number immediately.
// function findDup(numbers) {
//   let numbersFound = {};

//   for (let i = 0; i < numbers.length; i++) {
//     let currentNumber = numbers[i];

//     if (numbersFound[currentNumber]) {
//       return currentNumber;
//     } else {
//       numbersFound[currentNumber] = true;
//     }
//   }
// }


// console.log(findDup([1, 5, 3, 1]));                                // 1
// console.log(findDup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
//          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
//          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
//          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
//          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
//          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
//          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
//          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
//          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
//           7, 34, 57, 74, 45, 11, 88, 67,  5, 58]));    // 73


// =========================================================================


// Combine Two Lists
// - Write a function that takes 2 arrays as arguments and returns a new array
//   containing all elements from both array arguments, with each element taken
//   in alternation.
// - Assume that both arrays are non-empty, with the same no. of elements.

// function interleave(arr1, arr2) {
//   let result = [];

//   for (let i = 0; i < arr1.length; i++) {
//     let arr1Element = arr1[i];
//     let arr2Element = arr2[i];

//     result.push(arr1Element, arr2Element);
//   }

//   return result;
// }

// console.log(interleave([1, 2, 3], ['a', 'b', 'c']));    // [1, "a", 2, "b", 3, "c"]


// =============================================================================


// Multiplicative Average 
// - Write a function that takes an array of integers, multiplies all integers,
//   divides the product by the number of entries in the array, then returns a 
//   string with the value rounded to 3 decimal places.

// function showMultiplicativeAverage(integers) {
//   let product = integers.reduce((product, int) => product * int, 1);
//   let productAverage = product / integers.length;

//   return productAverage.toFixed(3);
// }

// console.log(showMultiplicativeAverage([3, 5]));                   // "7.500"
// console.log(showMultiplicativeAverage([2, 5, 7, 11, 13, 17]));    // "28361.667"


// ==============================================================================


// Multiply Lists
// - Write a function that takes two array arguments (each containing a list of
//   numbers) and returns a new array, containing the product of each number pair
//   at the same index.
// - Assume the two arrays contain the same number of elements.

// function multiplyList(numberList1, numberList2) {
//   return numberList1.map(function(number1, index) {
//     return number1 * numberList2[index]; 
//   });
// }

// console.log(multiplyList([3, 5, 7], [9, 10, 11]));    // [27, 50, 77]


// ==============================================================================


// Digits List
// - Write a function that takes one argument (positive integer) and returns an 
//   array of the digits in the number.
// 2 approaches
// - Keep it as a number and progressively divide down until 0
//  eg. 375290; first digit is num % 10 (0); then set = num / 10 (37529)
//      37529 % 10 => 9; etc.
// - Convert to string, split into characters, convert each character back to num

// Approach 1 (Keep as Number)
// function digitList(integer) {
//   let digits = [];

//   do {
//     digits.unshift(integer % 10);
//     integer = Math.floor(integer / 10);
//   } while (integer > 0)

//   return digits;
// }

// // Approach 2 (String)
// function digitList(integer) {
//   let stringDigits = integer.toString().split('');

//   return stringDigits.map(char => parseInt(char, 10));
// }


// console.log(digitList(12345));       // [1, 2, 3, 4, 5]
// console.log(digitList(7));           // [7]
// console.log(digitList(375290));      // [3, 7, 5, 2, 9, 0]
// console.log(digitList(444));         // [4, 4, 4]


// ====================================================================


// How Many?
// - Write a function that counts the number of occurrences of each element
//   in a given array.
// - The function should output each element along with how many times it occurs.

// function countOccurrences(elements) {
//   let counts = {};

//   elements.forEach(element => {
//     counts[element] = counts[element] || 0;
//     counts[element] += 1;
//   })

//   for (let element in counts) {
//     let count = counts[element];
//     console.log(`${element} => ${count}`);
//   }
//   // iterate through elements and register each one to counts 

//   // Output: logs each element and the # of times it appears
// }

// const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
//                 'motorcycle', 'suv', 'motorcycle', 'car', 'truck'];

// countOccurrences(vehicles);

// // console output
// // car => 4
// // truck => 3
// // SUV => 1
// // motorcycle => 2
// // suv => 1


// ==================================================================


// Array Average
// - Write a function that takes an array of integers and returns the average of
//   all integers, rounded down to the integer component of the average.
// - eg. add numbers, divide by numbers.length, and round down (floor) to the
//   nearest whole number.

function average(integers) {
  const integerSum = integers.reduce((sum, int) => sum + int, 0);
  const integerAvg = integerSum / integers.length;
  
  return Math.floor(integerAvg);
}


console.log(average([1, 5, 87, 45, 8, 8]));       // 25
console.log(average([9, 47, 23, 95, 16, 52]));    // 40