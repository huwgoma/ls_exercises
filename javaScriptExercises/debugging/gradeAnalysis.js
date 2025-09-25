// The following program is meant to determine the average and median scores
// on exams, but some test cases are failing.

// Identify and provide a fix for the error.

// Rules:
// - The median is the middle value in a sorted data set.
// - If there are an odd number of elements, the middle element is the median
// - If there are an even number of elements, the average of the middle 2 
//   elements is the median.

function average(nums) {
  const sum = nums.reduce((total, num) => total + num);

  return sum / nums.length;
}

function median(nums) {
  nums.sort();

  let median;
  const length = nums.length;

  if (length % 2 === 0) {
    median = average([nums[(length / 2) - 1], nums[length / 2]]);
  } else {
    median = nums[Math.floor(length / 2)];
  }

  return median;
}


//== Analysis ==
// The point of failure in this code is on Line 8; specifically, with how the
// `nums` array is sorted.
// - JavaScript's Array#sort method sorts elements in ascending string-wise order
//   if no callback function is provided; therefore, for the quarter 1 and 4 exam
//   score arrays, the number `100` is sorted against other numbers as a string, 
//   and is consequently placed at the start of the array (since strings are 
//   compared using a short-circuiting character-by-character comparison, and 
//   `'1'` is smaller than any other digit character except `'0'`).
// - To fix this, we would just need to provide `sort` with a callback function
//   that sorts elements in ascending order, numerically. For example:

function median(nums) {
  nums.sort((a, b) => Number(a) - Number(b));

  let median;
  const length = nums.length;
  if (length % 2 === 0) {
    median = average([nums[(length / 2) - 1], nums[length / 2]]);
  } else {
    median = nums[Math.floor(length / 2)];
  }

  return median;
}

// Tests
const quarter1ExamScores = [89, 72, 100, 93, 64, 97, 82, 87, 90, 94]; // All 10 items
const quarter2ExamScores = [76, 91, 89, 90, 91, 67, 99, 82, 91, 87];  
const quarter3ExamScores = [99, 91, 88, 72, 76, 64, 94, 79, 86, 88];  
const quarter4ExamScores = [100, 94, 73, 88, 82, 91, 97, 99, 80, 84]; 

// should all log 'true':
console.log(average(quarter1ExamScores) === 86.8);
console.log(average(quarter2ExamScores) === 86.3);
console.log(average(quarter3ExamScores) === 83.7);
console.log(average(quarter4ExamScores) === 88.8);

console.log(median(quarter1ExamScores) === 89.5); // false (88)
console.log(median(quarter2ExamScores) === 89.5);
console.log(median(quarter3ExamScores) === 87);
console.log(median(quarter4ExamScores) === 89.5); // false (86)