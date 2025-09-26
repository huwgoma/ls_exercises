// Binary Search
// - A binary search allows you to find a particular data point in 
//   a sorted collection more efficiently than a linear (a -> z) search.
// How it works:
// - Retrieve the element at the midpoint and compare it to the 
//   search value.
// > If midpointValue is greater than searchValue, discard the 2nd
//   half of the collection (the greater side)
// > If midpointValue is less than searchValue, discard the 1st half
//   of the collection (smaller side)
// > If midpointValue is === searchValue, stop the search (match found)
// - Repeat the process with the half you did not discard in step 1
//   until there is only 1? element left, or until a match is found
//   => If only 1 element is left, you can compare directly.


// Questions:
// 1) If there are an even number of elements, should the left or right
//    element be taken as the midpoint?
// => Left
// 2) Will the array always be sorted in ascending order, or can it 
//    also be sorted in descending order?
// => Assume ascending order

// Rules / Patterns
// 1) The array must be sorted for binary search to work (assume 
//    ascending order)
// 2) Find the (left-) midpoint, extract the element at the midpoint,
//    and compare extracted element to search value
//    a) If extracted > search value, discard the back half of the 
//       array (from midpoint to end)
//    b) If extracted < search value, discard the front half of the
//       array (from 0 to midpoint (including midpoint))
//    c) If extracted === search value, stop the search and return
//       the index 
// 3) Return value is the index of the search item (if present, or 
//    -1 if not present)
//    - Which means we probably shouldn't 'discard' halves? just
//      conceptually 
//    - Maybe halving the index range 

// Data:
// > Input: 
// - An array of elements (assume sorted in ascending order)
// - A value to search for in array
// eg. [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// i:   0  1  2  3  4  5  6  7  8   9

// Calculate the midpoint index:
// - Maintain 2 variables that track the working floor and ceiling
//   (ie. track the working range in our array)
//   > Initial: floor = 0, ceiling = array length - 1
// Midpoint Index = Floor(floor + ceiling / 2)
// - If midpoint Element = searchValue return midpoint Index
// - If midpoint Element > searchValue => 'discard' back half
//   => Set ceiling = midpoint index - 1 
// - If midpoint Element < searchValue => 'discard' front half
//   => Set floor = midpoint index + 1
// Recalculate midpoint as Floor(floor + ceiling / 2)

// End iteration when floor exceeds ceiling or ceiling becomes smaller
// than floor (ie. the element is not present) 

// > Output: A Number representing the index at which the given
//   searchvalue occurs (-1 if no match is found)

// Algorithm:
// Given an array and searchValue as input:
// 1) Initialize two variables to track the working floor and ceiling,
//    floor = 0 and ceiling = array.length - 1 
// 2) Initialize a loop: While ceiling > floor:
// 3) Calculate the midpoint as Floor (floor + ceiling / 2)
// 4) Extract the midpoint element and compare to searchValue
//    a) If searchValue === midpointElement return midpoint
//    b) If searchValue > midpointElement set floor = midpoint + 1
//    c) If searchValue < midpointElement set ceiling = midpoint - 1
// 5) If iteration ends without returning, return -1

function binarySearch(sortedArray, searchValue) {
  let floor = 0;
  let ceiling = sortedArray.length - 1;

  while (ceiling >= floor) {
    let midpoint = Math.floor((floor + ceiling) / 2);
    let midpointElement = sortedArray[midpoint];

    if (searchValue === midpointElement) {
      return midpoint;
    } else if (searchValue > midpointElement) {
      floor = midpoint + 1;
    } else if (searchValue < midpointElement) {
      ceiling = midpoint - 1;
    }
  }

  return -1;
}


// Examples: 
// - Simple Cases
console.log(binarySearch([1, 2, 3, 4, 5], 3)); // 2
console.log(binarySearch([1, 2, 3, 4, 5], 4)); // 3
console.log(binarySearch([1, 2, 3, 4, 5], 2)); // 1
// - Not Present => -1
console.log(binarySearch([1, 2, 3, 4, 5], 0)); // -1
console.log(binarySearch([1, 2, 3, 4, 5], 6)); // -1

// Given
const yellowPages = ['Apple Store', 'Bags Galore', 'Bike Store', 'Donuts R Us', 'Eat a Lot', 'Good Food', 'Pasta Place', 'Pizzeria', 'Tiki Lounge', 'Zooper'];
console.log(binarySearch(yellowPages, 'Pizzeria'));                   // 7
console.log(binarySearch(yellowPages, 'Apple Store'));                // 0

console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 77));    // -1
console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 89));    // 7
console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 5));     // 1

console.log(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Peter'));  // -1
console.log(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Tyler'));  // 6