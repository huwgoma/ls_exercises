// This function for generating random recipes raises a TypeError,
// telling us that dishName.join is not a function. Why?
// Implement a fix.

// Picks n random elements from an array,
// and returns a new array with those elements.

// function random(array, n) {
//   if (n === undefined) {
//     n = 1;
//   }

//   const elements = array.slice();
//   const randomElements = [];

//   while (n > 0 && elements.length > 0) {
//     // Generate random index and retrieve random element
//     const randomIndex = Math.floor(Math.random() * elements.length);
//     const randomElement = elements[randomIndex];

//     randomElements.push(randomElement); // Add random element to array
//     elements.splice(randomIndex, 1);    // Remove the random element
//     n--;
//   }

//   return randomElements;
// }

// // Ingredients
// const ingredients = ['rice', 'green bell pepper', 'mushrooms', 'carrot', 'kebab',
//   'spinach', 'soy bean sprouts', 'mashed potatoes', 'corn', 'cucumber', 'peas'];

// const spices = ['peri peri', 'cinnamon', 'nutmeg', 'cardamom', 'ground ginger',
//   'poppy seed', 'cumin'];

// const extras = ['peanuts', 'sesame seeds', 'egg', 'wasabi', 'soy sauce'];

// // Name
// const adjective  = ['Delicious', 'Hot', 'Exotic', 'Creative', 'Festive', 'Dark'];
// const firstNoun  = ['Power', 'After Work', 'Holiday', 'Disco', 'Late Night'];
// const secondNoun = ['Mix', 'Delight', 'Bowl', 'Chunk', 'Surprise', 'Bliss'];

// // Generate!
// const dishName = random(adjective) + random(firstNoun) + random(secondNoun);
// const dish = random(ingredients, 3) + random(spices, 2) + random(extras, 1);

// console.log(`How about: ${dishName.join(' ')}`);
// console.log(`You need: ${dish.join(', ')}`);


// The key point of failure in this code is on Lines 41 and 42;
// specifically, in how the return values of `random` are handled.
// - The `random` function correctly returns a random selection of `n`
//   elements from the given array (1 if `n` is omitted); however, 
//   JavaScript does not support concatenating arrays with the `+` 
//   operator (unlike Ruby). Instead, the arrays are first converted 
//   to Strings, before being concatenated as Strings.
// - For example, adding [1] and [2] will result in '12', not [1, 2]
//   as you might expect.

// Therefore, on Line 44 (and 45), attempting to call `join` on `dishName`
// will actually invoke `join` on a String object, which will result
// in a `TypeError`, since Strings do not implement a `join` function.

// To fix this code, we can refactor Lines 41 and 42 to correctly 
// concatenate the return values from `random` into Arrays, using
// (for example) Array#concat:

function random(array, n) {
  if (n === undefined) {
    n = 1;
  }

  const elements = array.slice();
  const randomElements = [];

  while (n > 0 && elements.length > 0) {
    // Generate random index and retrieve random element
    const randomIndex = Math.floor(Math.random() * elements.length);
    const randomElement = elements[randomIndex];

    randomElements.push(randomElement); // Add random element to array
    elements.splice(randomIndex, 1);    // Remove the random element
    n--;
  }

  return randomElements;
}

// Ingredients
const ingredients = ['rice', 'green bell pepper', 'mushrooms', 'carrot', 'kebab',
  'spinach', 'soy bean sprouts', 'mashed potatoes', 'corn', 'cucumber', 'peas'];

const spices = ['peri peri', 'cinnamon', 'nutmeg', 'cardamom', 'ground ginger',
  'poppy seed', 'cumin'];

const extras = ['peanuts', 'sesame seeds', 'egg', 'wasabi', 'soy sauce'];

// Name
const adjective  = ['Delicious', 'Hot', 'Exotic', 'Creative', 'Festive', 'Dark'];
const firstNoun  = ['Power', 'After Work', 'Holiday', 'Disco', 'Late Night'];
const secondNoun = ['Mix', 'Delight', 'Bowl', 'Chunk', 'Surprise', 'Bliss'];

// Generate!
const dishName = [].concat(random(adjective), random(firstNoun), random(secondNoun));
const dish = [].concat(random(ingredients, 3), random(spices, 2), random(extras, 1));

console.log(`How about: ${dishName.join(' ')}`);
console.log(`You need: ${dish.join(', ')}`);

