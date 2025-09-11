// Uppercase Check
// - Write a function that takes a string argument and returns true if
//   all alphabetic characters in the string are uppercase; otherwise
//   return false.
// - Ignore all non-alphabetic characters.

// Scan for the presence of any lowercase letter; return false if 
// one is found, true otherwise.

// Non-Regex Solution
function isUppercase(string) {
  return string.split('').every(char => char.toUpperCase() === char);
}

// Regex Solution
function isUppercase(string) {
  return !(/[a-z]/).test(string);
}

// Examples:
// console.log(isUppercase('t'));               // false
// console.log(isUppercase('T'));               // true
// console.log(isUppercase('Four Score'));      // false
// console.log(isUppercase('FOUR SCORE'));      // true
// console.log(isUppercase('4SCORE!'));         // true
// console.log(isUppercase(''));                // true


// ===============================================================
// Delete Vowels
// - Write a function that takes a string and returns an array of the
//   same strings, but with all vowels removed from each string.

// Non-Regex Solution:
function removeVowels(strings) {
  const VOWELS = ['a', 'e', 'i', 'o', 'u'];

  return strings.map(string => {
    return string.split('').filter(char => {
      return !(VOWELS.includes(char.toLowerCase()));
    }).join('');
  });
}

// Regex Solution:
// function removeVowels(strings) {
//   return strings.map(string => string.replaceAll(/[aeiou]/gi, ''));
// }

// Examples:
// console.log(removeVowels(['abcdefghijklmnopqrstuvwxyz']));         
// // ["bcdfghjklmnpqrstvwxyz"]
// console.log(removeVowels(['green', 'YELLOW', 'black', 'white']));  
// // ["grn", "YLLW", "blck", "wht"]
// console.log(removeVowels(['ABC', 'AEIOU', 'XYZ']));                
// // ["BC", "", "XYZ"]


// ==============================================================
// Lettercase Counter
// - Write a function that takes a string and returns an object with
//   3 properties: 
// 1) The number of lowercase characters in the string
// 2) The number of uppercase characters
// 3) The number of non-alphabetic characters

// Regex Solution:
function letterCaseCount(string) {
  return string.split('').reduce((caseCounts, char) => {
    if (/[a-z]/.test(char)) {
      caseCounts.lowercase += 1; 
    } else if (/[A-Z]/.test(char)) {
      caseCounts.uppercase += 1;
    } else {
      caseCounts.neither += 1;
    }

    return caseCounts;
  }, { lowercase: 0, uppercase: 0, neither: 0 });
}

// Non-Regex Solution:
function letterCaseCount(string) {
  const ALPHABET = 'abcdefhijklmnopqrstuvwxyz';

  return string.split('').reduce((caseCounts, char) => {
    if (!ALPHABET.includes(char.toLowerCase())) {
      caseCounts.neither += 1;
    } else if (char.toLowerCase() === char) {
      caseCounts.lowercase += 1; 
    } else if (char.toUpperCase() === char) {
      caseCounts.uppercase += 1;
    }

    return caseCounts;
  }, { lowercase: 0, uppercase: 0, neither: 0 });
}

// console.log(letterCaseCount('abCdef 123'));  
// // { lowercase: 5, uppercase: 1, neither: 4 }
// console.log(letterCaseCount('AbCd +Ef'));    
// // { lowercase: 3, uppercase: 3, neither: 2 }
// console.log(letterCaseCount('123'));         
// // { lowercase: 0, uppercase: 0, neither: 3 }
// console.log(letterCaseCount(''));            
// // { lowercase: 0, uppercase: 0, neither: 0 }


// ================================================================
// Capitalize Words
// - Write a function that takes a string and returns a new string
//   with the first character of every word capitalized, and all
//   subsequent characters in lowercase.
// - Assume that a word is any sequence of non-whitespace characters.

function wordCap(sentence) {
  return sentence.split(/\s+/).map(word => {
    let firstLetter = word[0];
    let remainingLetters = word.slice(1);

    return `${firstLetter.toUpperCase()}${remainingLetters.toLowerCase()}`;
  }).join(' ');
}

// console.log(wordCap('four score and seven'));       
// // "Four Score And Seven"
// console.log(wordCap('the javaScript language'));    
// // "The Javascript Language"
// console.log(wordCap('this is a "quoted" word'));    
// // 'This Is A "quoted" Word'


// ===============================================================
// Swap Case
// - Write a function that takes a string as an argument and returns
//   that string with every lowercase letter swapped to uppercase
//   and vice-versa.
// - All non-alphabetic characters should remain as-is.

function swapCase(string) {
  return string.split('').map(char => {
    if (/[a-z]/.test(char)) {
      return char.toUpperCase();
    } else if (/[A-Z]/.test(char)) {
      return char.toLowerCase();
    } else {
      return char;
    }
  }).join('');
}

// console.log(swapCase('CamelCase'));              // "cAMELcASE"
// console.log(swapCase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"


// =================================================================
// Staggered Caps (1)
// - Write a function that takes a string as argument and returns a new
//   string with a staggered capitalization scheme.
// - The first character should be capitalized.
// - The second character should be lowercase.
// - Alternate...
// - Non-alphabetic characters should not be changed (can't anyways),
//   but should count as a character for the purposes of determining
//   when to switch cases.

function staggeredCase(string) {
  return string.split('').map((char, index) => {
    return (index % 2 === 0) ? char.toUpperCase() : char.toLowerCase();
  }).join('');
}

// console.log(staggeredCase('I Love Launch School!'));        
// // "I LoVe lAuNcH ScHoOl!"
// console.log(staggeredCase('ALL_CAPS'));                     
// // "AlL_CaPs"
// console.log(staggeredCase('ignore 77 the 4444 numbers'));   
// // "IgNoRe 77 ThE 4444 nUmBeRs"


// Staggered Caps (2)
// - Modify the function from the previous exercise so that non-
//   alphabetic characters are ignored when determining when to switch
//   case. 

// Instead of using index (position) to determine case, we can use a
// flag variable instead.
// ie. capitalize = true
// On each iteration, if the current character is non-alphabetic,
// return the current character as-is. 
// - Otherwise, return char.upcase if capitalize is true, and 
//   char.downcase if capitalize is false, then invert capitalize.

function staggeredCase(string) {
  let capitalize = true;

  return string.split('').map(char => {
    // Non-Alphabetic
    if (/[^a-zA-Z]/.test(char)) return char;

    let casedChar = capitalize ? char.toUpperCase() : char.toLowerCase();
    capitalize = !capitalize;

    return casedChar;
  }).join('');
}

// console.log(staggeredCase('I Love Launch School!'));        
// // "I lOvE lAuNcH sChOoL!"
// console.log(staggeredCase('ALL CAPS'));                     
// // "AlL cApS"
// console.log(staggeredCase('ignore 77 the 444 numbers'));    
// // "IgNoRe 77 ThE 444 nUmBeRs"


// ================================================================
// How Long Are You?
// - Write a function that takes a string and returns an array of
//   strings, where each string contains a word from the string and 
//   the length of that word.
// - If the argument is empty or missing, the function should return
//   an empty array.
// - Assume that all words are separated by a single space.

function wordLengths(sentence) {
  // If sentence is missing or empty
  if (!sentence) return [];

  return sentence.split(' ').map(word => {
    return `${word} ${word.length}`;
  });
}

// console.log(wordLengths('cow sheep chicken'));
// // ["cow 3", "sheep 5", "chicken 7"]

// console.log(wordLengths('baseball hot dogs and apple pie'));
// // ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

// console.log(wordLengths("It ain't easy, is it?"));
// // ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

// console.log(wordLengths('Supercalifragilisticexpialidocious'));
// // ["Supercalifragilisticexpialidocious 34"]

// console.log(wordLengths(''));      // []
// console.log(wordLengths());        // []


// ==================================================================
// Search Word (1)
// - Write a function that takes two arguments: a word and some text,
//   and returns an integer representing the number of times the word
//   appears in the text.
// - Assume that word and text will always be provided.
// - Assume that all words are space-separated.
// - Punctuation (.) are considered part of the word.
//   - eg. 'sed.' should be counted as an occurrence of 'sed'.
// - Other than punctuation, words should be counted as standalone words
//   - eg. 'sedentary' should not be counted as an occurence of 'sed'
// - Matches should be case-insensitive

function searchWord(searchTerm, text) {
  let pattern = new RegExp(`\\b${searchTerm}\\b`, 'ig');
  let matches = text.match(pattern);

  return matches?.length || 0;
}

// const text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';

// console.log(searchWord('sed', text));      // 3

// Further Exploration: 
// - Refactor the solution so it only matches whole words (DONE)
// - And also include input validation to handle cases where one or 
//   both arguments are missing.
// Input Validation:
// - If any argument is missing, searchWord should return 0

function searchWord(searchTerm, text) {
  if (typeof searchTerm !== 'string' || typeof text !== 'string') {
    return 0;
  }
  
  let pattern = new RegExp(`\\b${searchTerm}\\b`, 'ig');
  let matches = text.match(pattern);

  return matches?.length || 0;
}

// console.log(searchWord('sed')); //=> 0
// console.log(searchWord());      //=> 0


// Search Word (2)
// - Write a function that takes a word and a string of text, and 
//   returns the text with every instance of word highlighted 
// - Highlight: Surround with 2 asterisks and upcase the word 
//   eg. **HIGHLIGHTED**

// Non-Regex Solution:
function highlightWord(searchTerm, text) {
  let words = text.split(' ');

  return words.map(word => {
    return word.toLowerCase() === searchTerm.toLowerCase() ? 
      `**${word.toUpperCase()}**` : word;
  }).join(' ');
}

// Regex Solution:
// function highlightWord(searchTerm, text) {
//   let pattern = new RegExp(`\\b${searchTerm}\\b`, 'ig');
  
//   return text.replaceAll(pattern, function(match) {
//     return `**${match.toUpperCase()}**`;
//   });
// }

// Example:
const text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';

console.log(highlightWord('sed', text));
// returns
// "**SED** ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, **SED** quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, **SED** quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"