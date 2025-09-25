// We were asked to implement a Task List with the following functionality:
// 1) Adding a new task
// 2) Completing a given number of existing tasks
// 3) Displaying the task list

// - Tasks are represented as an array of strings.
// - Completing a task means deleting the string from the array.

// Currently, this code does not function as expected. Find the problem
// and fix it.

// const todos = ['wash car', 'exercise', 'buy groceries', 'balance budget',
//              'call plumber', 'feed fido', 'get gas',  'organize closet'];

// function addTask(task) {
//   if (todos.includes(task)) {
//     console.log('That task is already on the list.');
//   } else {
//     todos.push(task);
//   }
// }

// function completeTasks(n = 1) {
//   let tasksComplete = 0;

//   while (todos.length > 0 && tasksComplete < n) {
//     console.log(`${todos[0]} complete!`);
//     delete todos[0];
//     tasksComplete++;
//   }

//   if (todos.length === 0) {
//     console.log('All tasks complete!');
//   } else {
//     console.log(`${tasksComplete} tasks completed; ${todos.length} remaining.`);
//   }
// }

// function displayTaskList() {
//   console.log(`ToDo list (${todos.length} tasks):`)
//   console.log('---------------------');

//   for (let i = 0; i < todos.length; i++) {
//     console.log(`-- ${todos[i]}`);
//   }
// }

// // Utilizing our task manager

// addTask('oil change');
// addTask('dentist');
// addTask('homework');

// completeTasks(3);
// displayTaskList();


// ==== Analysis ====
// Currently, this code correctly adds tasks to the end of the list, and it also
// correctly displays tasks. However, deleting tasks does not currently work as
// expected; the `completeTask` function only deletes the first element without
// shifting the remaining indexes, leaving an empty item in its place.

// The point of failure occurs on Line 17 (`delete  todos[0]`). The `delete` operator
// deletes the specified object-property pairing; in this case, it deletes the `'0'`
// property from the `todos` object. However, a side effect of the `delete` operator
// is that it purely deletes; in the case of an array, it does not shift the 
// remaining indexes over. Therefore, after the first element at index 0 is deleted,
// the index-0 position becomes an empty item, while the rest of the array remains
// in-place; thus, subsequent deletions on the index-0 element will simply delete 
// the empty item repeatedly, with no effect on other elements.

// To fix this, we can replace the `delete` operation with a more idiomatic tool
// for deleting array elements. Since we are deleting the first element from the
// array, we could consider the `Array#shift` method, which removes and returns
// the first element from the calling Array, while also shifting the indexes of
// the subsequent elements.

// For example:
function completeTasks(n = 1) {
  let tasksComplete = 0;

  while (todos.length > 0 && tasksComplete < n) {
    console.log(`${todos[0]} complete!`);
    todos.shift();
    tasksComplete++;
  }

  if (todos.length === 0) {
    console.log('All tasks complete!');
  } else {
    console.log(`${tasksComplete} tasks completed; ${todos.length} remaining.`);
  }
}