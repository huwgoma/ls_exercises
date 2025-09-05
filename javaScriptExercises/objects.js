// 1 - Literal
// Identify the bug in the following code, and describe one way to fix it.
// const myObject = {
//   a: 'name',
//   'b': 'test',
//   123: 'c',
//   1: 'd',
// };

// myObject[1]; //=> 'd'
// myObject[a]; //=> ReferenceError; `a` has not been defined.
// myObject.a;  //=> ('name')

// The bug in this code occurs on Line 11, `myObject[a]`. This code will raise a
// ReferenceError (`a has not been defined`) because when using bracket notation,
// the given value must either be a literal value (eg. `'a'`), or an identifier
// (eg. `a`). Since no `a` variable has been declared, JavaScript will therefore
// raise a corresponding error.


// 2 - Literal Method
// What does the following code output? Why?
// const person = {
//   firstName() {
//     return 'Victor';
//   },
//   lastName() {
//     return 'Reyes';
//   },
// };

// console.log(`${person.firstName} ${person.lastName}`);

// This code will output a string containing the string representations of the 
// `firstName` and `lastName` methods 
// (eg. 'firstName() { 
//        return "Victor" 
//      } lastName() { 
//        return "Reyes" 
//      })

// This occurs because the interpolation on Line 32 does not actually call either
// method defined on person, as indicated by the lack of trailing parentheses. 
// Therefore, `person.firstName` simply returns the value referenced by the 
// `firstName` property defined on `person`, which is the `firstName` function
// definition (and likewise for `person.lastName`.)


// 3 - Mutation
// - What will the following code log to the console, and why?
// const array1 = ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
// const array2 = [];

// for (let i = 0; i < array1.length; i += 1) {
//   array2.push(array1[i]);
// }

// for (let i = 0; i < array1.length; i += 1) {
//   if (array1[i].startsWith('C')) {
//     array1[i] = array1[i].toUpperCase();
//   }
// }

// console.log(array2);

// This code will output the array referenced by `array2`, which is copied from the
// original value of `array1` (Lines 54-56).
// `['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo']`.

// Although Lines 58-62 mutate `array1` by reassigning any element that starts with
// 'C' to an uppercase version of itself, this operation only mutates the `array1`
// array; `array2` is an entirely separate array (albeit with the same values).
// Furthermore, because strings are immutable in JavaScript, calling `toUpperCase`
// on strings only returns a new string, instead of mutating the existing string.

// Further Exploration:
// What would happen if an object literal was part of `array1`? Would the changes
// made to the object literal in `array1` be reflected in `array2`? 
// - If `array1` contained an object, `array2` would contain the same object, since
//   objects are copied by reference. Therefore, any changes made to the nested 
//   object from either `array1` or `array2` would be reflected by both variables.

// - How would you change the code so that any changes made to `array1` in the
//   second `for` loop are reflected in `array2`?
//   - In the second `for` loop, we could check if the current element is an 
//     object. If it is an object, mutation rules should naturally result in the 
//     change(s) persisting in both `array` variables, since they both reference
//     the same object. If it is not an object (ie. primitive), then we would need
//     to apply the same operation to both arrays. For example:

// for (let i = 0; i < array1.length; i++) {
//   // If current element is primitive...
//   if (typeof array[i] !== 'object') {
//     // Apply the operation to both arrays
//     if (array[i].startsWith('C')) {
//       array1[i] = array1[i].toUpperCase();
//       array2[i] = array2[i].toUpperCase();
//     }
//   } else {
//     // Do something with the object element
//   }
// }


// 4 - Dynamic
// What will the following code output, and why?
// const myObject = {
//   prop1: '123',
//   prop2: '234',
//   'prop 3': '345',
// };

// const prop2 = '456';
// myObject['prop2'] = '456'; // myObject { 'prop2' => '456' }
// myObject[prop2] = '678'; // myObject { '456' => '678' }

// console.log(myObject[prop2]); // Referencing key '456' => '678'
// console.log(myObject.prop2);  // Referencing key 'prop2' => '456'

// This code will output `'678'` on Line 117, and `'456'` on Line 118.
// - The key underlying mechanism is how JavaScript handles accessing object
//   properties via bracket notation vs. dot notation. 
// When accessing a property using bracket notation, the given value must be either 
// a literal value or an identifier for a literal value.
// - Therefore, `myObject['prop2']` will access (and set) the object property with 
//   the key `'prop2'` (string); `myObject[prop2]` will access/set the object property
//   with the key `prop2` (identifier), which references the value `'456'`.
// - On Line 117, `myObject[prop2]` is equivalent to `myObject['456']`, which will
//   return `'678'`.
// Conversely, accessing a property using dot notation will translate the given
// property name into a string. Therefore, accessing `myObject.prop2` on Line 118
// is equivalent to `myObject['prop2']`, which returns `'456'`.

// Further Exploration: 
// - What will be logged to the console, and why?
// const myObj = {};
// myObj[myFunc()] = 'hello, '; // myObj: { 'funcProp' => 'hello, ' }

// function myFunc() {
//   return 'funcProp';
// }

// console.log(myObj);         //-> { funcProp: 'hello, ' }
// myObj[myFunc()] = 'world!'; //   myObj: { funcProp => 'world!' }
// console.log(myObj);         //-> { funcProp: 'world!' }

// This code will output `'{ funcProp: "hello, " }'` on Line 143, and 
// `'{ funcProp: "world!" }'` on Line 145.
// - On Line 137, a new property is assigned to `myObj` (`myObj[myFunc()] = 'hello, '`).
//   The property key is the return value of the `myFunc` invocation, which is the
//   string `'funcProp'`. Therefore, the state of `myObj` after Line 137 is 
//   `{ funcProp: 'hello, ' }` (logged on Line 143.)
// - On Line 144, the same property is reassigned, this time to another string
//   `world!`. Therefore, the value output on Line 145 is `{ funcProp: 'world!' }`.


// 5 - Array Object (1)
// - What will the following code output, and why?
// const myArray = ['a', 'b', 'c'];

// console.log(myArray[0]);
// console.log(myArray[-1]);

// myArray[-1] = 'd';
// myArray['e'] = 5;
// myArray[3] = 'f';

// console.log(myArray[-1]);
// console.log(myArray['e']);
// console.log(myArray);

// This code will output `'a'` on Line 161, `undefined` on Line 162, `'d'` on Line
// 168, `5` on Line 165, and the full array on Line 170: 
// `['a', 'b', 'c', 'f', '-1': 'd', 'e': 5]`

// - Line 159 initializes the `myArray` array, with 3 initial elements: `['a', 'b', 'c']`.
// - Line 161 outputs the index-0 (ie. first) element of `myArray`, which is `'a'`.
// - Line 162 attempts to access a property that does not exist (key `-1`), which
//   returns `undefined`. Note that unlike Ruby, negative indexes are not 
//   considered valid syntax when accessing array elements.
// - Next, Line 164 and 165 add new properties to `myArray`, with non-index keys:
//   `-1 => 'd'`, and `'e' => 5`. In JavaScript, it is possible to add non-indexed
//   properties to an array; however, they will not be treated as elements.
//   - Lines 168 and 169 demonstrate this; accessing `-1` and `'e'` from the array
//     will return their respective values, `'d'` and `5`.
// - Line 166 adds an indexed property, `3 => 'f'`. Because the key is a valid
//   positive integer, this property will be treated as an array element.
// Finally, Line 170 outputs the entire array. Elements are displayed first, without
// their indexes, followed by non-element properties.


// 6 - Array Object (2)
// - Given the code below, the user expects the average function to return 5.
// - Is this correct? Why or why not?
// const myArray = [5, 5];
// myArray[-1] = 5;
// myArray[-2] = 5; // [5, 5, '-1': 5, '-2': 5]

// function average(array) {
//   let sum = 0;

//   // Iterate from i = -2 to 1 (< array length)
//   // -2 -1 0 1 
//   for (let i = -2; i < array.length; i += 1) {
//     sum += array[i];
//   }

//   // sum will be 20 
//   // but array length is only 2 
//   // therefore returns 10
//   return sum / array.length;
// }

// console.log(average(myArray));

// The user's prediction is incorrect - the `average` function will return `10`, 
// not `5`. 
// The underlying mechanism is how JavaScript handles non-indexed (ie. non-element)
// properties; essentially, non-element properties do not count towards an array's
// `length` property.
// - The `for` loop is syntactically valid; accessing `-2` and `-1` during iteration
//   does correctly retrieve the corresponding values (`5` in both cases), resulting
//   in a sum value of 20 at the end of iteration. 
// - However, because `array.length` only counts actual elements (plus empty items),
//   the return value will not be `5` as expected, but is instead `20 / 2` => `10`.

// Further Exploration: 
// - Refactor the average function so that it returns `5` as expected.
// const myArray = [5, 5];
// myArray[-1] = 5;
// myArray[-2] = 5; // [5, 5, '-1': 5, '-2': 5]

// function average(array) {
//   let sum = 0;

//   for (let i = -2; i < array.length; i += 1) {
//     sum += array[i];
//   }

//   return sum / Object.keys(array).length;
// }

// console.log(average(myArray));

// // Unlike `array.length`, `Object.keys` returns an array containing all keys of the
// // given object, regardless of whether they are elements or not. Therefore, taking
// // the `length` of `Object.keys` will correctly return `4` for the given example
// // array, resulting in an average of `20 / 4` => `5`.


// 7 - What's my Bonus?
// - Complete the following function:
// - It calculates the bonus for a given salary.
// - Two arguments: Salary amount (number) and switch (boolean)
//   - If switch is true, bonus = half of salary; otherwise, bonus = 0

// function calculateBonus(baseSalary, bonusEligible) {
//   return arguments[1] ? arguments[0] / 2 : 0;
// }

// calculateBonus(2800, true);               // 1400
// calculateBonus(1000, false);              // 0
// calculateBonus(50000, true);              // 25000

// This code works because the `arguments` object is an Array-like structure that
// is implicitly available in all functions, and contains all arguments passed to
// the function. 
// - While `arguments` is not fully an Array, it is Array-like enough for indexed
//   access (eg. `arguments[1]`) to work as expected. Therefore, `arguments[1]` 
//   corresponds to the `bonusEligible` boolean value, while `arguments[0]` 
//   corresponds to the `baseSalary` number. The rest of the expression is just
//   a simple ternary operator, which returns `baseSalary / 2` if `bonusEligible` 
//   is true, and `0` otherwise.


// 8 - The end is near but not here
// The penultimate function takes a string as an argument and returns the 
// second-from-last word in the string (assuming words are space-separated).
// - The function also assumes that the input string always contains at least 2 
//   words. 
// - The current implementation of penultimate does not return the expected result.
// Identify the problem and provide a working solution.

// function penultimate(string) {
//   return string.split(' ')[-2];
// }

// console.log(penultimate('last word'));                    // expected: "last"
// console.log(penultimate('Launch School is great!'));      // expected: "is"

// This function currently returns `undefined`. The underlying point of failure is
// in the `[-2]` operation: JavaScript does not support negative index access for
// array elements, unlike Ruby. Therefore, accessing `-2` in any array will return
// `undefined`, assuming the array does not have a property with the key `-2` defined.
// - To fix this function, we can replace the `[-2]` operation with the valid syntax
//   for accessing elements from the back of an array, using `length - n`. For example:

// function penultimate(string) {
//   let words = string.split(' ');
//   return words[words.length - 2];
// }

// What happens if there is a space at the end of the string, or multiple spaces
// between words?

// console.log(penultimate('Launch  School  is  great! '));      
// expected: "is"; actual: "great!"

// The array obtained from `split()` will include an empty string for each
// extra space - eg. ['Launch', '', 'School', '', 'is', 'great!', '']
// - Which would mess with the "retrieve 2nd-from-last" operation

// Therefore: filter the array and remove empty strings before accessing -2:

// function penultimate(string) {
//   let words = string.split(' ').filter(word => word.length > 0);
//   return words[words.length - 2];
// }


// 9 - After Midnight (1)
// - The time of day can be represented by the number of minutes before or after
//   midnight. Positive minutes represents a time after midnight; negative minutes
//   represents a time before midnight.
// - The timeOfDay function takes a number argument using this minute-based format,
//   returning the time of the day in 24-h format (hh:mm) (string).
// - Reimplement the function using JavaScript's Date object.

// function timeOfDay(deltaMinutes) {
//   let midnight = new Date(0);

//   midnight.setMinutes(deltaMinutes);

//   let hours = midnight.getUTCHours();
//   let minutes = midnight.getUTCMinutes();

//   return `${padWithZeroes(hours, 2)}:${padWithZeroes(minutes, 2)}`;
// }

// function padWithZeroes(number, length) {
//   let numberString = String(number);

//   while (numberString.length < length) {
//     numberString = `0${numberString}`;
//   }

//   return numberString;
// }

// console.log(timeOfDay(0));          // "00:00"
// console.log(timeOfDay(-3));         // "23:57"
// console.log(timeOfDay(35));         // "00:35"
// console.log(timeOfDay(-1437));      // "00:03"
// console.log(timeOfDay(3000));       // "02:00"
// console.log(timeOfDay(800));        // "13:20"
// console.log(timeOfDay(-4231));      // "01:29"


// 10 - After Midnight (2)
// The afterMidnight and beforeMidnight functions take a 24-hour time argument
// and return the number of minutes before/after midnight, respectively.
// - Both functions should return a value betwen 0 and 1439, inclusive.
//   (eg. 0 minutes from midnight, 23:59 from midnight)
// Refactor the functions using the Date object.

// const MINUTES_PER_HOUR = 60;
// const HOURS_PER_DAY = 24;
// const MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;

const EPOCH_DATE = '1970-01-01'
const MILLISECONDS_TO_MINUTES = 60 * 1000;
const MILLISECONDS_IN_DAY = 24 * 60 * 60 * 1000;

function afterMidnight(timeStr) {
  let date = new Date(`${EPOCH_DATE}T${timeStr}Z`); // Z = UTC

  let msAfterMidnight = date.getTime();

  return msAfterMidnight / MILLISECONDS_TO_MINUTES;
}

function beforeMidnight(timeStr) {
  let tomorrow = new Date(EPOCH_DATE);
  tomorrow.setDate(tomorrow.getDate() + 1);
  let date = new Date(`${EPOCH_DATE}T${timeStr}Z`); // Z = UTC

  let msUntilMidnight = (tomorrow.getTime() - date.getTime()) % MILLISECONDS_IN_DAY;

  return msUntilMidnight / MILLISECONDS_TO_MINUTES;
}

console.log(afterMidnight('00:00'));       // 0
console.log(beforeMidnight('00:00'));      // 0
console.log(afterMidnight('12:34'));       // 754
console.log(beforeMidnight('12:34'));      // 686