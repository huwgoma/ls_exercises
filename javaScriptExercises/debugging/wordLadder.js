// A 'Word Ladder' is a puzzle that involves two words - a starting
// word and a target word - where the player must navigate from the
// first word to the target word by changing one letter at a time.
// - Each intermediate word must be a valid word.

// eg. 
// [ pig ]   [ pig ] 
// [     ]   [ pie ] 
// [     ]   [ lie ] 
// [     ]   [ lit ] 
// [ let ]   [ let ]  

// The ladder can be represented as an array of word strings. 
// eg. ['pig', 'pie', 'lie', 'lit', 'let' ]

// The following code is expected to print each word in the ladder
// as a single string, with each word separated by hyphens:

// let ladder = ''

// ['head', 'heal', 'teal', 'tell', 'tall', 'tail'].forEach(word => {
//   if (ladder !== '') {
//     ladder += '-'
//   }

//   ladder += word
// })

// console.log(ladder)  // expect: head-heal-teal-tell-tall-tail

// Currently, this code will raise a TypeError (cannot read property
// forEach of undefined). Why? Implement a fix.

// This code raises a TypeError because of the missing semicolon on
// Line 1.
// - Since there is no semicolon, Lines 1 and 3 are treated as one unit; 
//   the resulting code looks something like this:

// `let ladder = ''['head', 'heal', ..., 'tail'].forEach(...)`.

// This is equivalent to attempting to access the 'tail' property
// from the preceding empty string (`''['tail']`), which will return
// `undefined`. Since `undefined` does not have a `forEach` property,
// a TypeError is raised.

// To fix this behavior, we can simply add a semicolon to the end of 
// Line 1.

let ladder = '';

['head', 'heal', 'teal', 'tell', 'tall', 'tail'].forEach(word => {
  if (ladder !== '') {
    ladder += '-'
  }

  ladder += word
})

console.log(ladder)  // expect: head-heal-teal-tell-tall-tail