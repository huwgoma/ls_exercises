// Lettercase Percentage Ratio
// Write a function that takes a string and returns an object with 3 properties:
// 1) The percentage of characters in the string that are lowercase
// 2) The percentage of characters that are uppercase
// 3) The percentage of characters that are neither

// Rules:
// - Assume that the string will always contain at least one character
// - Percentages are represented as strings, with 2 decimal places (toFixed(2))

// Data:
// > Input: A string containing some characters
// - Match string against a-z => lowercase count
// - Match string against A-Z => uppercase count
// - Match string against non-az/AZ => neither count
// - Divide each count against the total length of the string and convert to
//   a percentage (x100, toFixed(2))
// - Register the percentage to the percentages object through the appropriate 
//   key name.

// > Output: An object with 3 properties:
//   1) lowercase   2) uppercase   3) neither
//   Property values are strings representing percentages (how often that type
//   of character appears in the string)

// Algorithm:
// Given a string as input:
// 1) Scan the string for all lowercase letters
//    => [array of lowercase matches] 
//    2) Take the length of the matches array => Number of lowercase letters in string
//    3) Divide lowercaseCount by string.length
//    4) Calculate the string percentage 
//     > ((lowercaseCount / string.length) * 100).toFixed(2)
///   5) Register to percentages Object
//     > percentages.lowercase = percentage
// Repeat Steps 1-5 for uppercase (A-Z) and neither (^a-zA-Z)
// Return percentages Object 

function letterPercentages(string) {
  const stringLength = string.length;
  let lowerCaseCount = scan(string, /[a-z]/).length;
  let upperCaseCount = scan(string, /[A-Z]/).length;
  let neitherCount   = stringLength - lowerCaseCount - upperCaseCount;

  return { 
    lowercase: toStringPercentage(lowerCaseCount / stringLength),
    uppercase: toStringPercentage(upperCaseCount / stringLength),
    neither:   toStringPercentage(neitherCount / stringLength),
  }
}

function scan(string, pattern) {
  pattern = new RegExp(pattern, 'g');

  return string.match(pattern) || [];
}

function toStringPercentage(number, decimalPoints = 2) {
  return (number * 100).toFixed(decimalPoints);
}

// Examples:
console.log(letterPercentages('abc def HIJ 123!'));
// Lowercase letters: abcdef          (6)  => 6 / 16 => 0.375  => 37.50
// Uppercase letters: HIJ             (3)  => 3 / 16 => 0.1875 => 18.75
// Neither: <space><space><space>123! (7)  => 7 / 16 => 0.4375 => 43.75
// Total number of characters:        (16) 

// Given:
console.log(letterPercentages('abCdef 123'));
// // { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// // { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// // { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }