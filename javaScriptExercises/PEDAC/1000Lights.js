// 1000 Lights
// Given a bank of switches, numbered from 1 to n, each switch is connected to
// exactly one light (initially off). You walk down the row of switches (starting
// from 1?) and toggle every one of them. Then you walk back to the beginning and
// make another pass; on the second pass, you toggle switches 2, 4, 6, etc. On the
// third pass, you start at the beginning again and toggle switches 3, 6, 9, etc.
// - After n repetitions, which lights are still on?

// Write a function that takes one argument (n, the number of switches) and returns
// an array of the light numbers that are on after n repetitions.

// Rules:
// 1) The number of lights is equal to the number of passes you make.
//    - For example, if n = 3, there are 3 lights [x, x, x], and you make 3 passes.
// 2) On each pass (i), only the light numbers that are evenly divisible by i are
//    toggled.
//    eg. [x, x, x]; i = 1 => Toggle every light     => [o, o, o]
//    eg. [o, o, o]; i = 2 => Toggle every 2nd light => [o, x, o]
//    eg. [o, x, o]; i = 3 => Toggle every 3rd light => [o, x, x]


// Questions:
// 1) Is it possible for `n` to be 0, negative, +/- Infinity, NaN, missing, or 
//    any other non-Number value?
// => 0 yes, others no => Return empty array if 0 []


// Input:
// - A Number (n) representing the number of switches (and also the number of
//   passes to make)
// Output:
// - An Array of Numbers representing the lights that are still on after n passes

// Data:
// Input is given as a number
// > Maybe represent the bank of switches using a 1-D array
// eg. [0, 0, 0, ...] - 0 represents a light that is off, and 1 represents a 
//                      light that is on
//      Where the number of elements === n
// Output is an array of numbers (corresponding to the indexes of the 'o' lights
// at the end of iteration (+1))

// Algorithm:
// Given a number as input, `n`:
// 1) Create a 'bank' of switches (represented as an array of numbers):
// > [0, 0, 0, ...] (n elements)
// 2) Iterate from 1 up to n (i = 1). For each iteration:
//    3) Iterate through the switches array.
//    4) Toggle the current switch if its index + 1 is evenly divisible by the 
//       current iteration number (i).
// => Array of 1s and 0s.
// 5) Return an array of the indexes + 1 where light value is 1 (on)
//    * reduce()?

function lightsOn(n) {
  let lights = createLights(n);
  
  for (let i = 1; i <= n; i++) {
    lights.forEach((light, index) => {
      if ((index + 1) % i === 0) lights[index] = flipSwitch(light);
    });
  }

  // Return an array of indexes + 1, where the light value is 1
  return lights.reduce((activeLights, lightValue, index) => {
    if (lightValue) activeLights.push(index + 1);
    return activeLights;
  }, []);
}

function createLights(n) {
  return new Array(n).fill(0);
}

function flipSwitch(switchValue) {
  // Toggles between 0 and 1
  return Number(!switchValue);
}

// Refactor: Extracting the Pattern (Squares)
// lightsOn(100) //=> [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
// - The lights that are still on after n iterations are the square numbers up to 
//   and including n 
// eg. lightsOn(9)  //=> [1, 4, 9]
// eg. lightsOn(16) //=> [1, 4, 9, 16]

// Which means for any given value of n, there will only ever be SQRT(n) number of
// elements; and each element would be the square of each number from 1 -> sqrt(n)
// eg. If n is 25, there can only be 5 elements (1, 2, 3, 4, 5); the elements would
//     be (1, 4, 9, 16, 25)

function lightsOn(n) {
  // Create an Array from 1..n
  let lights = Array.from( { length: Math.floor(Math.sqrt(n)) }, 
                           (_, index) => index + 1 );

  return lights.map(light => light ** 2);
}

// Examples:
console.log(lightsOn(3));        //=> [1]
console.log(lightsOn(5));        //=> [1, 4]
console.log(lightsOn(7));        //=> [1, 4]
console.log(lightsOn(9));        //=> [1, 4, 9]
console.log(lightsOn(100));      //=> [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

console.log(lightsOn(1));        //=> [1]
console.log(lightsOn(0));        //=> []