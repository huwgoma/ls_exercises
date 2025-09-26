// MadLibs (Revisited)

// Build a madlibs program that takes a text `template` as input,
// inserts a selection of randomized nouns, verbs, adjective, and 
// adverbs into the template before returning it.

// Questions

// Rules / Patterns
// - Nouns, verbs, adjectives, and adverbs can be hardcoded for now.


// Data:
// > Input: `template` (structure to be defined)
//   Hard-Coded Word Types:
//    adjectives: quick lazy sleepy noisy hungry
//    nouns: fox dog head leg tail cat
//    verbs: jumps lifts bites licks pats
//    adverbs: easily lazily noisily excitedly

// **What is the structure of template?**
// Requirements:
// - String replacement (insertion of a randomly-selected word into
//   the string)
// - Type-sensitive string replacement (the 'type' of the slot will
//   affect which word type array to sample from)

// 1) String with placeholders, delimited with $ (or some other char)
// eg. "The $adjective$ brown $noun$ $adverb$ $verb$ ..."
// - Downside: What if the normal input contains $adjective$ ?
//   => It would be incorrectly substituted.
// - I think this is an inherent risk that I just have to decide whether
//   I'm okay with or not 
// => Placeholder using ${ ... }$


// > Output: A new string containing randomly-selected nouns/verbs/
//   adjectives/adverbs inserted into the template 
//   - For each slot in the template, we need to insert the appropriate
//     type of word.

// Algorithm:
// Given a string template as input:
// 1) Define our adjectives, nouns, adverbs, and verbs in an object:
//  > { adjectives: [quick, lazy, sleepy, ...], 
//      nouns:      [dog, fox, cat, ...]        }
// 2) Iterate through the given `template` and transform each word:
//   3) If the word matches the PLACEHOLDER format (`${word}$`),
//      extract the word, add a trailing 's', and use the result 
//      as the key to access the corresponding array of words in the
//      WORD_SAMPLES object
//      => Sample a random word from the appropriate array and return
//         that word
//   4) If the word does not match PLACEHOLDER, return the word as-is
// => Array of transformed words => Join and return

// function madlibs(template) {
//   const WORD_SAMPLES = {
//     adjectives: ['quick', 'lazy', 'sleepy', 'noisy', 'hungry'],
//     nouns:      ['fox', 'dog', 'head', 'leg', 'tail', 'cat'],
//     verbs:      ['jumps', 'lifts', 'bites', 'licks', 'pats'],
//     adverbs:    ['easily', 'lazily', 'noisily', 'excitedly'],
//   }

//   const PLACEHOLDER_PATTERN = /^\$.+\$[\W]?$/;

//   return template.split(/\s+/).map(word => {
//     let match = word.match(PLACEHOLDER_PATTERN);

//     if (match) {
//       let cleanedWord = match[0].replaceAll('$', '');
//       let [ wordOnly, punctuation ] = cleanedWord.split(/\b/);
//       punctuation ||= '';
//       let keyWord = wordOnly + 's'; // Pluralize => Key

//       return sample(WORD_SAMPLES[keyWord]) + punctuation;
//     } else {
//       return word;
//     }
//   }).join(' ');
// }


// == Refactor ==
// - Implement a solution using String#replace, without using #split +
//   #map + #join.

// Algorithm:
// Given a string as input, template:
// 1) Find all occurences of the pattern $<word>$<punctuation>? in 
//    the given template.
//    * punctuation should not be matched (context-only, optional)
//    > $word$ that is NOT followed by another word character
// 2) For each occurrence, replace it with a random word from the
//    appropriate WORD TYPE array.
//    > Clean the matched word (remove $s) => Cleaned word
//    > Append an 's' to the cleaned word => Key word 
//    > Sample from WORD TYPE [keyword]

function madlibs(template) {
  const WORD_SAMPLES = {
    adjectives: ['quick', 'lazy', 'sleepy', 'noisy', 'hungry'],
    nouns:      ['fox', 'dog', 'head', 'leg', 'tail', 'cat'],
    verbs:      ['jumps', 'lifts', 'bites', 'licks', 'pats'],
    adverbs:    ['easily', 'lazily', 'noisily', 'excitedly'],
  }

  // Match all standalone occurrences of $<word>$ (trailing punctuation
  // is okay):
  const PLACEHOLDER_PATTERN = /(?<![\w])\$.+?\$(?![\w])/g;
  
  return template.replaceAll(PLACEHOLDER_PATTERN, (match) => {
    let keyWord = match.replaceAll('$', '') + 's';
    return sample(WORD_SAMPLES[keyWord]);
  });
}

// Return a random element from array
function sample(array) {
  if (!Array.isArray(array)) return undefined;

  let randomIndex = getRandomIndex(array.length);
  return array[randomIndex];
}

function getRandomIndex(ceiling) {
  // Ceiling is exclusive
  return Math.floor(Math.random() * ceiling);
}


// // Examples:
// *  Note: Quotes are shown only for emphasis (not part of output)
// Placeholder Generators
function generatePlaceholder(wordType) {
  return `$${wordType}$`; 
}

const ADJECTIVE = generatePlaceholder('adjective');
const NOUN      = generatePlaceholder('noun');
const ADVERB    = generatePlaceholder('adverb');
const VERB      = generatePlaceholder('verb');

let template1 = `The ${ADJECTIVE} brown ${NOUN} ${ADVERB} ${VERB} ` +
                `the ${ADJECTIVE} yellow ${NOUN}, who ${ADVERB} ` +
                `${VERB} his ${NOUN} and looks around.`

console.log(madlibs(template1));
// // The "sleepy" brown "cat" "noisily"
// // "licks" the "sleepy" yellow
// // "dog", who "lazily" "licks" his
// // "tail" and looks around.

console.log(madlibs(template1));
// // The "hungry" brown "cat" "lazily"
// // "licks" the "noisy" yellow
// // "dog", who "lazily" "licks" his
// // "leg" and looks around.
