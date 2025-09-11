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
// - Write a function that takes two arrays, each containing a list of numbers,
//   and returns a new array containing the products of all possible number 
//   combinations between both arrays. The returned array should be sorted in 
//   ascending numerical order.
// - Assume that neither array will be empty, but can have differing lengths.

function multiplyAllPairs(leftNumbers, rightNumbers) {
  let productPairs = leftNumbers.reduce((products, leftNumber) => {
    rightNumbers.forEach(rightNumber => products.push(leftNumber * rightNumber));
    return products;
  }, []);

  return productPairs.sort((x, y) => x - y);
}

// Example: 
// 2x4, 2x3, 2x1, 2x2 => 8/6/2/4
// 4x4, 4x3, 4x1, 4x2 => 16/12/4/8
// Then sort => 2/4/4/6/8/8/12/16

// console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2]));    // [2, 4, 4, 6, 8, 8, 12, 16]


// ============================================================================
// Sum of Sums
// - Write a function that takes an array of numbers and returns the sum of sums of
//   each leading subsequence in the given array.
// - Assume the array always contains at least one number.

// sum of sums?
// - The sums of each leading 'sequence' - ie. first element, first + second element,
//   etc...
// - 2 memos: 
//   1) The sum of sums (total cumulative sum)
//   2) The previous subsequence sum

// SoS (0), SubS(0)
// Iteration 1: SoS (3), SubS(3) 
// Iteration 2: SubS(3 + 5 = 8), SoS (3 + 8 = 11)
// Iteration 3: SubS(8 + 2 = 10), SoS (11 + 10 = 21)
// 

function sumOfSums(numbers) {
  let totalSum = 0;

  numbers.reduce((prevSum, number) => {
    // Sum of the current sequence
    let currentSum = prevSum + number;
    totalSum += currentSum;

    return currentSum;
  }, 0);

  return totalSum;
}

// Example:
// console.log(sumOfSums([3, 5, 2]));        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
// console.log(sumOfSums([1, 5, 7, 3]));     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
// console.log(sumOfSums([4]));              // 4
// console.log(sumOfSums([1, 2, 3, 4, 5]));  // 35


// ===============================================================================
// Leading Substrings
// - Write a function that takes a string argument and returns a list of substrings
//   from that string, starting from the first letter and progressively lengthening.
// - The list should be ordered from shortest to longest.

function leadingSubstrings(string) {
  return string.split('').map((_char, index) => string.slice(0, index + 1));
}

// Examples:
// console.log(leadingSubstrings('abc'));      // ["a", "ab", "abc"]
// console.log(leadingSubstrings('a'));        // ["a"]
// console.log(leadingSubstrings('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]


// ================================================================================
// All Substrings
// - Write a function that returns a list of all substrings in a given string.
// - Order the returned array by the starting index of the substring - eg. all
//   substrings starting at index 0 should come first, then index 1, etc.
// - Within each index group, substrings should be ordered from shortest to longest.

// Using map & flat:
function substrings(string) {
  return string.split('').map((_char, index) => {
    return leadingSubstrings(string.slice(index));
  }).flat();
}

// Pushing each array of substrings returned from leadingSubstrings individually:
function substrings(string) {
  let result = [];
  
  string.split('').forEach((_char, index) => {
    result.push(...leadingSubstrings(string.slice(index)));
  });

  return result;
}

// Example:
// console.log(substrings('abcde'));

// returns
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]


// ================================================================================
// Palindromic Substrings
// - Write a function that returns a list of all substrings in a given string that
//   are palindromic (same sequence of characters forwards and backwards).
// - Sort the list of returned substrings by order of appearance.
// - For this exercise, palindromes are case-sensitive and consdier all characters.
// - Single characters are not considered palindromic.

function palindromes(string) {
  const isPalindrome = (str) => { 
    if (str.length <= 1) return false;

    return str.split('').reverse().join('') === str;
  }

  return substrings(string).filter(isPalindrome);
}


// Examples:
// console.log(palindromes('abcd'));       // []
// console.log(palindromes('madam'));      // [ "madam", "ada" ]

// console.log(palindromes('hello-madam-did-madam-goodbye'));
// // returns
// // [ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
//   // "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
//   // "-madam-", "madam", "ada", "oo" ]

// console.log(palindromes('knitting cassettes'));
// returns
// [ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]


// ================================================================================
// Grocery List
// - Write a function that takes a grocery list as a 2-D array and returns a 1-D 
//   array.
// - Input (2D)- Contains a fruit name and number representing the quantity of 
//   that fruit
// - Output (1D) - Contains strings, with each fruit appearing n times (n = the number
//   from the input)

function buyFruit(groceryList) {
  let shoppingCart = [];

  groceryList.forEach(item => {
    let [ fruit, count ] = item;

    for (let i = 1; i <= count; i++) {
      shoppingCart.push(fruit);
    }
  });

  return shoppingCart;
}

// Example:
// console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]

// LS Solution:
// function buyFruit(fruitsList) {
//   return fruitsList.map(fruit => repeat(fruit))
//                    .reduce((groceryList, fruit) => groceryList.concat(fruit));
// }

// function repeat(fruit) {
//   const result = [];

//   for (let i = 0; i < fruit[1]; i += 1) {
//     result.push(fruit[0]);
//   }

//   return result;
// }

// map => [ [apple, apple, apple], [orange], [banana, banana] ]
// - The elements in groceryList are replaced with an array of n fruits, returned
//   from repeat()
// reduce => [ apple, apple, apple, orange, banana, banana ]
// - The nested array returned by map is flattened; each subarray's elements is 
//   concatenated to a top-level groceryList array.


// ===============================================================================
// Inventory Item Transactions
// - Write a function that takes two arguments (item ID and list of transactions)
//   and returns an array containing only the transactions for the specified 
//   inventory item.

function transactionsFor(itemID, transactions) {
  return transactions.filter(transaction => transaction.id === itemID);
}

// Example:
// const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
//                        { id: 105, movement: 'in',  quantity: 10 },
//                        { id: 102, movement: 'out', quantity: 17 },
//                        { id: 101, movement: 'in',  quantity: 12 },
//                        { id: 103, movement: 'out', quantity: 15 },
//                        { id: 102, movement: 'out', quantity: 15 },
//                        { id: 105, movement: 'in',  quantity: 25 },
//                        { id: 101, movement: 'out', quantity: 18 },
//                        { id: 102, movement: 'in',  quantity: 22 },
//                        { id: 103, movement: 'out', quantity: 15 }, ];

// console.log(transactionsFor(101, transactions));
// // returns
// // [ { id: 101, movement: "in",  quantity:  5 },
// //   { id: 101, movement: "in",  quantity: 12 },
// //   { id: 101, movement: "out", quantity: 18 }, ]


// Inventory Item Availability 
// - Write a function that returns true or false based on whether an inventory item
//   is available or not.
// - Same arguments (item ID + transactions)
// - Returns true if the total quantity of that item is greater than 0.
//   - Movement in => Increase quantity 
//   - Movement out => Decrease quantity 

function isItemAvailable(itemID, transactions) {
  let itemTransactions = transactionsFor(itemID, transactions);

  let finalQuantity = itemTransactions.reduce((netQuantity, transaction) => {
    if (transaction.movement === 'in') {
      return netQuantity + transaction.quantity;
    } else {
      return netQuantity - transaction.quantity;
    }
  }, 0);

  return finalQuantity > 0;
}

const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                       { id: 105, movement: 'in',  quantity: 10 },
                       { id: 102, movement: 'out', quantity: 17 },
                       { id: 101, movement: 'in',  quantity: 12 },
                       { id: 103, movement: 'out', quantity: 15 },
                       { id: 102, movement: 'out', quantity: 15 },
                       { id: 105, movement: 'in',  quantity: 25 },
                       { id: 101, movement: 'out', quantity: 18 },
                       { id: 102, movement: 'in',  quantity: 22 },
                       { id: 103, movement: 'out', quantity: 15 }, ];

console.log(isItemAvailable(101, transactions));     // false
console.log(isItemAvailable(105, transactions));     // true