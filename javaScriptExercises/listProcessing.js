// Sum of Digits =============================================================
// - Write a function that takes one argument (a positive integer) and returns
//   the sum of its digits. 
// - Do not use for, while, or do/while loops in your solution.

function sumOfDigits(integer) {
  let stringDigits = String(integer).split('');

  return stringDigits.reduce((sum, strDigit) => sum + Number(strDigit), 0);
}

// Examples:
// console.log(sumOfDigits(23));           // 5
// console.log(sumOfDigits(496));          // 19
// console.log(sumOfDigits(123456789));    // 45


// Alphabetical Numbers ======================================================
// - Write a function that takes an array of integers between 0 and 19, and returns
//   a new array containing the same integers, but sorted based on the English
//   word for each number (eg. zero, one, two, ...)
// - Do not mutate the original array.

  // Sort integers based on its string representation
  // (x, y) where x and y are adjacent integers in integers:
  //  x, y => NUMBER_WORDS[x] - NUMBER_WORDS[y]
  // which will compare the string representations of the integer pair.
  //   minus (-) won't work
  // If word(x) > word(y) => return 1 
  // if word(x) < word(y) => return -1
  // if equal return 0


  // Sort integers based on its value as an English word.
  // -- How to convert number to English word?
  //   - eg. 0 => 'zero' ?
  // - no built-in function so we have to implement it ourselves.
  // - easiest way is to create a map/array (bc indexes => number anyways)
  // - but scalable? w/e 

function alphabeticNumberSort(integers) {
  const NUMBER_WORDS = [
    'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight',
    'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
    'sixteen', 'seventeen', 'eighteen', 'nineteen',
  ];

  // Can also use String#localeCompare()
  let stringComparison = (str1, str2) => { 
    if (str1 > str2)   return 1;
    if (str1 < str2)   return -1;
    if (str1 === str2) return 0;
  };

  return integers.toSorted((int1, int2) => {
    let int1Word = NUMBER_WORDS[int1];
    let int2Word = NUMBER_WORDS[int2];

    return stringComparison(int1Word, int2Word);
  });
}

// Example:
// console.log(alphabeticNumberSort(
//    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// // [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]


// ============================================================================
// Multiply All Pairs:
//