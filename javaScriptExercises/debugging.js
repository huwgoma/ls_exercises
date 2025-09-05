// Hello Friends
// Expected Output: Random greeting for each friend
// function randomGreeting() {
//   const words = ['Hello', 'Howdy', 'Hi', 'Hey there', 'What\'s up',
//                'Greetings', 'Salutations', 'Good to see you'];

//   const idx = Math.floor(Math.random() * words.length);

//   words[idx];
// }

// function greet(...args) {
//   const names = Array.prototype.slice.call(args);

//   for (let i = 0; i < names.length; i++) {
//     const name = names[i];
//     const greeting = randomGreeting;

//     console.log(`${greeting}, ${name}!`);
//   }
// }

// greet('Hannah', 'Jose', 'Beatrix', 'Julie', 'Ian');

// The `greet` function will currently output the function body of the 
// `randomGreeting` function, followed by the current name. There are several points
// of failure in this code:
// 1) On Line 17, `greeting` is initialized to the function object, not the return
//    value, of `randomGreeting`, thanks to the missing parentheses.
// 2) Fixing point #1 will then result in the output being `undefined, <name>!`.
//    This occurs because the `randomGreeting` function does not explicitly return
//    the extracted random greeting, so it always returns undefined.
// 3) As a side note, the first line of the `greet` function is perhaps unnecessary,
//    since `args` is already an array. Therefore, we could rename the rest syntax to
//    ...names and remove that first line.

// Final Code:
// function randomGreeting() {
//   const words = ['Hello', 'Howdy', 'Hi', 'Hey there', 'What\'s up',
//                'Greetings', 'Salutations', 'Good to see you'];

//   const idx = Math.floor(Math.random() * words.length);

//   return words[idx];
// }

// function greet(...names) {
//   for (let i = 0; i < names.length; i++) {
//     const name = names[i];
//     const greeting = randomGreeting();

//     console.log(`${greeting}, ${name}!`);
//   }
// }

// greet('Hannah', 'Jose', 'Beatrix', 'Julie', 'Ian');


// ==============================================================================


// Includes False
// - Expected output: true if any element in the list is false, and true otherwise

// function includesFalse(list) {
//   for (let i = 0; i < list.length; i++) {
//     let element = list[i];

//     if (element == false) {
//       return true;
//     }
//   }

//   return false;
// }
//                                                                   // returns:
// includesFalse([8, null, 'abc', true, 'launch', 11, false]);       // true
// includesFalse(['programming', undefined, 37, 64, true, 'false']); // false
// includesFalse([9422, 'lambda', true, 0, '54', null]);             // true

// Why does the last invocation (Line 79) return true, despite the given array
// having no falses?
// - The final invocation returns `true` because of the interaction between the
//   loose equality operator (`==`) and how JavaScript coerces one-sided boolean
//   operands. On the 4th iteration, when `element` is `0`, we get the comparison
//   `0 == false`. When one operand of the `==` operator is a boolean, JavaScript
//   coerces it into a number; in this case, `false` is coerced to `0`, resulting
//   in the comparison `0 == 0`, which returns true, therefore unexpectedly 
//   terminating the function early and returning `true`.
// - To fix this, we can simply replace the `==` operator with its strict 
//   equivalent, `===`:

// function includesFalse(list) {
//   for (let i = 0; i < list.length; i++) {
//     let element = list[i];

//     if (element === false) {
//       return true;
//     }
//   }

//   return false;
// }
//                                                                   // returns:
// includesFalse([8, null, 'abc', true, 'launch', 11, false]);       // true
// includesFalse(['programming', undefined, 37, 64, true, 'false']); // false
// includesFalse([9422, 'lambda', true, 0, '54', null]);             // > false <


// ========================================================================


// Place a Bet 
// - The placeABet function takes a number between 1-25, determines a random
//   winning number, and returns a message based on whether the user's number
//   matches the winning number.
// - This code will currently raise an error. Explain why, and provide a fix.

// function placeABet(guess) {
//   (function generateRandomInt() {
//     return Math.floor(Math.random() * 25) + 1;
//   });

//   const winningNumber = generateRandomInt();

//   if (guess < 1 || guess > 25) {
//     return 'Invalid guess. Valid guesses are between 1 and 25.';
//   }

//   if (guess === winningNumber) {
//     return "Congratulations, you win!";
//   } else {
//     return "Wrong-o! You lose.";
//   }
// }

// const rlSync = require('readline-sync');
// const userGuess = parseInt(rlSync.question('Input a guess between 1-25 '), 10);
// console.log((placeABet(userGuess)));

// This code will raise a ReferenceError on Line 124: `generateRandomInt` is not
// defined. The key point of failure is in how `generateRandomInt` is defined as 
// a function expression, not a function declaration. In a function expression,
// the function's name is only available locally to the function body. Therefore,
// the identifier `generateRandomInt` is not in scope on Line 124, raising a 
// ReferenceError.
// - This can be fixed in 2 ways: either by assigning the function expression
//   to a local variable `generateRandomInt`, or by removing the parentheses to
//   change the function expression to a function declaration.

// For example:
// function placeABet(guess) {
//   function generateRandomInt() {
//     return Math.floor(Math.random() * 25) + 1;
//   }

//   const winningNumber = generateRandomInt();
//   // rest of code....
// }

// // Or:
// function placeABet(guess) {
//   let generateRandomInt = function generateRandomInt() {
//     return Math.floor(Math.random() * 25) + 1;
//   }

//   const winningNumber = generateRandomInt();
//   // rest of code....
// }


// ================================================================
// Picky Museum Filter
// - Fix the following code so it correctly returns true if:
//   - The museum is about Computers or Science
//   - The museum includes Andy Warhol
//   - The museum is located in Amsterdam.
// - false otherwise.

// function wantToVisit(museum, city) {
//   return (museum.includes('Computer') || museum.includes('Science')) ||
//          ((museum.includes('Modern') && museum.includes('Art')) &&
//             (museum.includes('Andy Warhol') || city === 'Amsterdam'));
// }

// // Tests (should all print 'true')

// console.log(wantToVisit('Computer Games Museum', 'Berlin') === true);
// console.log(wantToVisit('National Museum of Nature and Science', 'Tokyo') === true);
// console.log(wantToVisit('Museum of Modern Art', 'New York') === false);
// console.log(wantToVisit('El Paso Museum of Archaeology', 'El Paso') === false);
// console.log(wantToVisit('NEMO Science Museum', 'Amsterdam') === true);
// console.log(wantToVisit('National Museum of Modern Art', 'Paris') === false);
// console.log(wantToVisit('Andy Warhol Museum of Modern Art', 'Medzilaborce') === true);
// console.log(wantToVisit('Moco: Modern Contemporary Art', 'Amsterdam') === true);
// console.log(wantToVisit('Van Gogh Museum', 'Amsterdam') === false);
// console.log(wantToVisit('Andy Warhol Museum', 'Melbourne') === false);


// =======================================================================


// Shop Transactions
// The logTransaction function is used to log transactions (deposits/withdrawals)
// - Each transaction must be a valid numerical amount.
// At the end of the day, the total daily gain/loss can be logged with
//  transactionTotal.
// Find the problem and fix it.

// const rlSync = require('readline-sync');
// const transactionLog = [];

// function processInput(input) {
//   const numericalData = parseFloat(input);

//   if (Number.isNaN(numericalData)) {
//     throw (new Error('Data could not be converted to numerical amount.'));
//   }

//   return numericalData;
// }

// function logTransaction() {
//   let data = rlSync.question('Please enter the transaction amount: ');

//   try {
//     data = processInput(data);
//     transactionLog.push(data);

//     console.log('Thank you. Data accepted.');
//   } catch(error) { // <- error object was missing here
//     console.log(error.message);
//   }
// }

// function transactionTotal() {
//   let total = 0;

//   for (let i = 0; i < transactionLog.length; i++) {
//     total += transactionLog[i];
//   }

//   return total;
// }

// logTransaction();
// logTransaction();
// logTransaction();

// console.log(transactionTotal());

// This program works as intended when valid numbers are given; however, when invalid
// inputs are given, the `catch` clause in `logTransaction` fails and raises a 
// `ReferenceError`, since `error` is not defined. This is because the `catch` 
// clause does not define a parameter to receive the error object; therefore,
// attempting to access `error.message` will result in a ReferenceError.


// =========================================================================


// Full Moon
// - Why is every warning displayed twice in the following code? 
// Fix this so that every warning is only displayed once, as intended.

// const species = ['wolf', 'human', 'wasp', 'squirrel', 'weasel', 'dinosaur'];
// const isMidnight = true;
// const isFullmoon = true;

// function isTransformable(species) {
//   return species[0] === 'w';
// }

// function transform(species) {
//   return `were${species}`;
// }

// for (let index = 0; index < species.length; index++) {
//   const thisSpecies = species[index];
//   let newSpecies; // <- was var

//   if (isMidnight && isFullmoon && isTransformable(thisSpecies)) {
//     newSpecies = transform(thisSpecies);
//   }

//   if (newSpecies) {
//     console.log(`Beware of the ${newSpecies}!`);
//   }
// }

// This code will currently output a warning for *every* element in `species` 
// after the first transformable element is found, regardless of whether subsequent
// elements are transformable or not.
// The key point of failure is in how the `newSpecies` variable is initialized 
// - because it is declared with `var`, but is declared outside of any enclosing 
// function body, the resulting variable is scoped to the top-level global scope. 
// Thus, on the first iteration, `newSpecies` is assigned to the return value of
// `transform('wolf')` (`'werewolf'`). On the next iteration, `isTransformable` 
// returns false, so `newSpecies` is not reassigned; however, it retains its previous
// value of `'werewolf'`, which satisfies the `if (newSpecies)` conditional, and
// therefore logs the warning again.

// To fix this, we can simply change the `var` declaration of `newSpecies` to `let`,
// which declares variables with block scope. Doing so will limit the scope of the
// `newSpecies` variable to the `for` loop's block body; therefore, on each iteration,
// a new `newSpecies` variable will be declared with no initial value, so the 
// conditional on Line 286 can function correctly.


// ===================================================================


// Space Design
// Why does displaying CEO and Scrum Master display undefined?
// Roles (salary still to be determined)

// const ceo = {
//   tasks: ['company strategy', 'resource allocation', 'performance monitoring'],
//   salary: 0,
// };

// const developer = {
//   tasks: ['turn product vision into code'],
//   salary: 0,
// };

// const scrumMaster = {
//   tasks: ['organize scrum process', 'manage scrum teams'],
//   salary: 0,
// };

// // Team -- we're hiring!

// const team = {};

// team[ceo] = 'Kim';
// team[scrumMaster] = 'Alice';
// team[developer] = undefined;

// // team => { '[object Object]': undefined }

// const company = {
//   name: 'Space Design',
//   team,
//   projectedRevenue: 500000,
// };

// console.log(`----{ ${company.name} }----`);
// console.log(`CEO: ${company.team[ceo]}`);
// console.log(`Scrum master: ${company.team[scrumMaster]}`);
// console.log(`Projected revenue: $${company.projectedRevenue}`);

// ----{ Space Design }----
// CEO: undefined
// Scrum master: undefined
// Projected revenue: $500000

// The key reason why displaying the company's team's CEO and scrumMaster results
// in `undefined` is due to how JavaScript represents object keys under the hood;
// all object keys are converted to strings. On Lines 336-338, the `ceo`, 
// `scrumMaster`, and `developer` objects are added as keys to the `team` object.
// However, the string representation of all (simple) objects in JavaScript is 
// identical: `'[object Object]'`. This means that Line 337 overwrites the
// property created on Line 336, and Line 338 overwrites the property created on
// Line 337 with a value of `undefined`.

// Therefore, accessing the `company.team[ceo]` and `company.team[scrumMaster]` on
// Lines 349 and 350 will return `undefined`. Note that we are accessing properties
// using bracket notation and the `ceo` and `scrumMaster` variables, which each
// reference a different object that is ultimately converted to the same string 
// (`'[object Object]'`) before property retrieval.
// - To confirm this hypothesis, you could comment out the property assignment on
//   Line 338; in that case, accessing the team's property using the `ceo` and 
//   `scrumMaster` objects would instead return the last property to be assigned 
//   with the `'[object Object]'` key - `'Alice'`.

// To fix this, we could replace the property access syntax on Lines 336, 337,
// 338, 349 and 350 with dot notation, which would create/access properties with
// the literal values `'ceo'`, `'scrumMaster'`, and `'developer'`, instead of the
// values referenced by the corresponding variables.


// ==================================================================


// Expensive Studies
// - The amount charged on checkout seems too high - why?

// The shopping cart is a list of items, where each item
// is an object { name: <string>, amount: <number> }.
// let shoppingCart = [];

// // Currently available products with prices.
// const prices = {
//   'notebook': 9.99,
//   'pencil': 1.70,
//   'coffee': 3.00,
//   'smoothie': 2.10,
// };

// function price({name}) {
//   // Destructuring - Pass in an object with a name property; retrieve the value
//   // and assign it to a local variable name.
//   return prices[name];
// }

// // Adding an item to the shopping cart.
// // The amount is optional and defaults to 1.
// // If the item is already in the cart, its amount is updated.
// function updateCart(name, amount) {
//   amount = amount || 1; // <- If amount is 0 it will default to 1.

//   let alreadyInCart = false;

//   for (let i = 0; i < shoppingCart.length; i += 1) {
//     let item = shoppingCart[i];

//     if (item.name === name) {
//       item.amount = amount;
//       alreadyInCart = true;
//       break;
//     }
//   }

//   if (!alreadyInCart) {
//     shoppingCart.push({ name, amount });
//   }
// }

// // Calculating the price for the whole shopping cart.
// function total() {
//   let total = 0;

//   for (let i = 0; i < shoppingCart.length; i += 1) {
//     let item = shoppingCart[i];

//     total += (item.amount * price(item));
//   }

//   return total.toFixed(2);
// }

// function pay() {
//   // omitted

//   console.log(`You have been charged $${total()}.`);
// }

// function checkout() {
//   pay();
//   shoppingCart = [];
// }

// // Example purchase.

// updateCart('notebook');
// updateCart('pencil', 2);
// updateCart('coffee', 1);

// // Oh wait, I don't need pencils
// updateCart('pencil', 0);

// checkout();
// // You have been charged $14.69.

// This code will currently charge the user $14.69 instead of 12.99 (Notebook,
// 9.99 + Coffee, 3.00). The key point of failure is in the `updateCart` function;
// specifically, how it handles setting default values for `amount`. Currently, 
// if `amount` is a falsy value, it will default to 1. Presumably, this is meant to
// safeguard against `undefined` amounts; however, because 0 is also considered a
// falsy value in JavaScript, Line 461 will set `pencils.amount` to 1 instead of 0,
// thus adding on an extra 1.70 to the total price.


// ============================================================================


// Stuck on Page 18
// - Running this code results in a stack overflow - why?

const totalPages = 364;
let energy = 100;

function read() {
  let currentPage = 1;

  while (energy > 0 && currentPage < totalPages) {
    currentPage += 1;
    energy -= (5 + currentPage * 0.1);
  }

  console.log(`Made it to page ${String(currentPage)}.`);

  // Drink a cup of coffee.
  energy = 100;

  // Continue reading.
  if (currentPage < totalPages) {
    read();
  } else {
    console.log('Done!');
  }
}

read();

// The key issue with this code is that `currentPage` is locally-scoped to the 
// `read` function; therefore, on every invocation of `read`, a new copy of 
// `currentPage` is initialized and set to page 1. At the end of the first `while`
// loop (ie. when `energy` runs out for the first time), `currentPage` will have 
// a value of 18, which is fewer than `totalPages`; therefore, `read` will be called
// again. However, inside the nested `read` invocation, `currentPage` is reset to 
// `1`, resulting in an infinitely deep stack and an eventual stack overflow.