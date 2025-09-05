// Defaults
// - The processOrder function accepts up to 5 arguments:
//   - price, quantity, discount, serviceCharge, and tax
//   - Other than price, all arguments can be omitted.

// function processOrder(price, quantity, discount, serviceCharge, tax) {
//   if (!quantity) {
//     quantity = 1;
//   }

//   if (!discount) {
//     discount = 0;
//   }

//   if (!serviceCharge) {
//     serviceCharge = 0.1;
//   }

//   if (!tax) {
//     tax = 0.15;
//   }

//   return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
// }

// processOrder(100);      // 126.5

// function processOrder(price, quantity, discount, serviceCharge, tax) {
//   quantity = quantity || 1;
//   discount = discount || 0;
//   serviceCharge = serviceCharge || 0.1;
//   tax = tax || 0.15;

//   return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
// }

// Both of these solutions have a limitation that can lead to an incorrect result
// for certain inputs. What is this limitation, and how does it affect the result?

// The limitation of these two solutions is that it uses a truthiness/falsiness
// test to assign values for the optional arguments, assuming that if the argument
// is omitted, it will default to undefined, and therefore evaluate to falsy. 
// However, JavaScript also considers `0` to be falsy. Therefore, if any of the
// arguments is passed `0` as a value, the `processOrder` function will assign those
// arguments to their default values, rather than keeping the value at `0`.


// ================================================================


// Equal 
// - Currently, this code does not log the expected result. Why? Refactor the code
//   so it produces the expected result.

// const person = { name: 'Victor' };
// const otherPerson = { name: 'Victor' };

// console.log(person === otherPerson);    // false -- expected: true

// This code will output `false` because of how the `===` operator functions in
// JavaScript when comparing objects; it will only evaluate to `true` if the two
// operands reference the same object in memory. Since `person` and `otherPerson`
// reference different objects in memory, albeit with the same value, `===` will
// return `false`.
// - To fix this, we could either modify the comparison, or we can modify the 
//   object assignments. For example:

// Modifying the comparison:
// const person = { name: 'Victor' };
// const otherPerson = { name: 'Victor' };

// console.log(person.name === otherPerson.name);    // false -- expected: true

// By modifying the comparison, the `===` operator now compares the `name` properties
// of each object, which is a primitive value (string), and is therefore compared 
// by value.

// Modifying the object assignment:
// const person = { name: 'Victor' };
// const otherPerson = person;

// console.log(person === otherPerson);    // false -- expected: true

// By setting `otherPerson` equal to `person`, we are assigning both variables to
// the same object in memory, which would then allow `===` to return `true`.


// ================================================================



// Amount Payable
// - What does the following code log, and why?
// let startingBalance = 1;
// const chicken = 5;
// const chickenQuantity = 7;

// function totalPayable(item, quantity) {
//   return startingBalance + (item * quantity);
// }

// startingBalance = 5;
// console.log(totalPayable(chicken, chickenQuantity)); // 5 + 5*7 => 40

// startingBalance = 10;
// console.log(totalPayable(chicken, chickenQuantity)); // 10 + 5*7 => 45

// This code will output 40 on Line 103, and 45 on Line 106.
// The `totalPayable` function returns the result of adding `startingBalance` to
// the result of multiplying `item * quantity`. In both invocations, `item` is 
// `5` (`chicken`), and `quantity` is `7` (`chickenQuantity`). However, the value
// of `startingBalance` changes between invocations; before the first invocation,
// its value is reassigned from `1` to `5`, resulting in a return value of `5 + 35`.
// Before the second invocation, it is again reassigned to `10`, resulting in a 
// return value of `45`.


// ================================================================


// Caller
// - The doubler function in the code below takes two arguments: a number to 
//   double and return, and a string containing the name of the function's caller.

// function doubler(number, caller) {
//   console.log(`This function was called by ${caller}.`);
//   return number + number;
// }

// doubler(5, 'Victor');                   // returns 10

// logs:
// This function was called by Victor.

// Write a makeDoubler function that takes a caller name as an argument and 
// returns a function that has the same behavior as doubler, but with a preset
// caller value.

// function makeDoubler(caller) {
//   return function(number) {
//     console.log(`This function was called by ${caller}.`);
//     return number * 2;
//   }
// }

// const doubler = makeDoubler('Victor');
// doubler(5);                             // returns 10
// logs:
// This function was called by Victor.


// ================================================================


// What's my Value?
// - What will the following program log to the console? Why?
// const array = ['Apples', 'Peaches', 'Grapes'];

// array[3.4] = 'Oranges';
// console.log(array.length);              // 3
// console.log(Object.keys(array).length); // 4

// array[-2] = 'Watermelon'; 
// console.log(array.length);              // 3
// console.log(Object.keys(array).length); // 5

// This code will log 3 on Line 160, 4 on Line 161, 3 again on Line 164, and
// 5 on Line 165. The underlying mechanism is how JavaScript represents arrays
// under the hood, specifically when non-indexed properties are added.
// - On Line 159, a new property is added to `array`, with a key name of `'3.4'`.
//   Because this is not a valid integer index, the resulting key-value pair is 
//   not considered an element, and will not count towards the array's length -
//   hence why Line 160 outputs `3`. However, these non-element properties do
//   count for the purposes of `Object.keys`, which is why Line 161 outputs `4`.
// - A similar thing occurs for Lines 163-165; `-2` is not a valid index, so the 
//   resulting property does not count towards `length` on Line 164, but does 
//   count towards `Object.keys` on Line 165.


// ================================================================


// Length
// - What will the following code output, and why?
// const languages = ['JavaScript', 'Ruby', 'Python'];
// console.log(languages);         // [ JavaScript, Ruby, Python ]
// console.log(languages.length);  // 3

// languages.length = 4;
// console.log(languages);         // [ JavaScript, Ruby, Python, <1 empty item> ]
// console.log(languages.length);  // 4

// languages.length = 1;
// console.log(languages);         // [ JavaScript ]
// console.log(languages.length);  // 1
 
// languages.length = 3;
// console.log(languages);         // [ JavaScript, <2 empty items> ]
// console.log(languages.length);  // 3

// languages.length = 1;           
// languages[2] = 'Python';        
// console.log(languages);         // [ JavaScript, <1 empty item>, Python ]
// console.log(languages[1]);      // undefined
// console.log(languages.length);  // 3

// Line 186 and 187 will output the `languages` array and its length as initialized:
// `[ JavaScript, Ruby, Python ]` and `3`.

// Line 189 artificially sets the array's length to 4; as a result, the array is
// extended with an empty item at index 3, and the length of the array is `4`.

// Line 193 sets the array's length to 1 - as a result, the array is truncated
// to a length of 1, leaving the only element in the array as `'JavaScript'`.

// Line 197 re-extends the array's length to 3; as with Line 189, the array is 
// artificially extended with 2 empty items.

// Line 201 truncates the array to a length of 1, removing the 2 empty items. Next,
// Line 202 sets the index-2 element to `'Python'`; since the current largest index
// is 0, this will artificially extend the array, with an empty item representing
// the missing element at index 1. Line 204 shows that when an empty item is 
// accessed, it returns `undefined` - however, the empty item does not actually 
// have an `undefined` value (it has no value at all). Finally, Line 205 shows that
// the `length` of an array corresponds to the numeric value of its largest index (2)
// plus one.


// ================================================================


// The Red Pill
// - What will the following code output?

function one() {
  function log(result) {
    console.log(result);
  }

  function anotherOne(...args) {
    let result = '';
    for (let i = 0; i < args.length; i += 1) {
      result += String.fromCharCode(args[i]);
    }

    log(result);
  }

  function anotherAnotherOne() {
    console.log(String.fromCharCode(87, 101, 108, 99, 111, 109, 101));
    anotherOne(116, 111);
  }

  anotherAnotherOne();
  anotherOne(116, 104, 101);
  return anotherOne;
}

one()(77, 97, 116, 114, 105, 120, 33);

// This code will output `'Welcome'`, `'to'`, `'the'`, and `'Matrix!'`, all on 
// separate lines. I believe it would be easiest to walk through the call stack of
// this program to explain the output:
// - On Line 259, the `one` function is called.
//  - Within the `one` function, it calls the `anotherAnotherOne` function, on Line
//    254.
//   - `anotherAnotherOne` logs `'Welcome'`, on Line 250. It then calls the 
//     `anotherOne` function, with the arguments 116 and 111.
//    - The `anotherOne` function builds and logs a string from its arguments; in
//      this case, it logs `'to'` on Line 246.
//  - Once `anotherAnotherOne` returns, Line 255 invokes the `anotherOne` function,
//    with the arguments 116, 104, and 101.
//   - Again, `anotherOne` builds and logs a string from its given arguments; on
//     this invocation, it logs `'the'`.
//  - Once `anotherOne` returns, the `one` function returns the function object
//    referenced by the `anotherOne` identifier on Line 256.
// - Back on Line 259, the `anotherOne` function is immediately invoked again,
//   with the arguments 77, 97, 116, 114, 105, 120, and 33. These ASCII codes 
//   correspond to the string `'Matrix!'`, which will be logged by the `anotherOne`
//   function on Line 246.

// Call stack:
// - one() (Line 259)
//  - anotherAnotherOne() (Line 254)
//   -> Outputs 'Welcome' (Line 250)
//   - anotherOne() (Line 251); arguments 116 (t) and 111 (o)
//    - Outputs 'to' (Line 246)
//  - anotherOne() (Line 255); arguments (116, 104, 101) (the)
//    - Outputs 'the' (Line 246)
// - one() returns the anotherOne function
// - Immediately called again on Line 259; 
//   (arguments 77, 97, 116, 114, 105, 120, 33) => Matrix!
//   - Outputs 'Matrix!' (Line 246).                  