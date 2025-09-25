// Pomodoro
// The following code is meant to implement the Pomodoro technique.
// However, currently, it does not print the minute count from Line 11.
// Identify and fix the error.

// var tasks = 10;
// var checkmarks = 0;
// var sessions = 0;
// var minutes = 0;

// function pomodoro() {
//   console.log('Work.');

//   // minutes (undefined, local)
//   while (minutes < 25) {
//     minutes += 1;
//     console.log('...' + minutes);
//   }

//   console.log('PLING!');

//   sessions += 1;
//   checkmarks += 1;

//   if (checkmarks === tasks) {
//     console.log('Done!');
//     return;
//   }

//   var rest;
//   if (sessions === 4) {
//     sessions = 0;
//     rest = 30;
//   } else {
//     rest = 5;
//   }

//   console.log('Rest for ' + rest + ' minutes.');

//   var minutes = 0;
//   pomodoro();
// }

// pomodoro();

// The key point of failure in this code is on Line 34, 
// `var minutes = 0`; specifically, how variables declared with `var`
// are hoisted.
// - Variables declared with `var` are hoisted to the top of the 
//   closest-encompassing function body (eg. the `pomodoro` function
//   body, and they are hoisted with an initial value.) This has 3 
//   main implications in this case:
//   1) The `minutes` variable declared on Line 34 is available from
//      the start of the `pomodoro` function, starting from Line 7.
//   2) The initial value of `minutes` will be `undefined`.
//   3) Because the inner-scope `minutes` shares a name with the 
//      outer-scope `minutes`, all references to `minutes` within the
//      `pomodoro` function will refer to the inner-scoped variable.

// Since the initial value of `minutes` is `undefined`, the `while` 
// condition will evaluate to `undefined < 25`, which returns false,
// and will result in the `while` loop never executing.

// At the end of each `pomodoro` invocation, the function recursively
// calls itself again, until the number of `checkmarks` matches the
// number of `tasks`. Since all other variables (`sessions`, `checkmarks`,
// `rest`, and `tasks`) are non-conflictngly outer-scoped, their state
// does not reset between invocations, so the rest of the output 
// behaves as expected.

// To fix this, we could simply change the `var minutes` declaration
// on Line 34 to a reassignment of the outer-scoped `minutes` variable,
// `minutes = 0`. Doing so will allow the value of `minutes` to be `0`
// at the start of each `pomodoro` invocation, which will subsequently
// allow the `while` loop to correctly print each elapsed minute.

var tasks = 10;
var checkmarks = 0;
var sessions = 0;
var minutes = 0;

function pomodoro() {
  console.log('Work.');

  while (minutes < 25) {
    minutes += 1;
    console.log('...' + minutes);
  }

  console.log('PLING!');

  sessions += 1;
  checkmarks += 1;

  if (checkmarks === tasks) {
    console.log('Done!');
    return;
  }

  var rest;
  if (sessions === 4) {
    sessions = 0;
    rest = 30;
  } else {
    rest = 5;
  }

  console.log('Rest for ' + rest + ' minutes.');

  minutes = 0;
  pomodoro();
}

pomodoro();