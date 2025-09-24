// Unlucky Days
// Write a function that takes a number (year) as argument and returns the number
// of Friday the 13ths in that year.

// Rules/Patterns:
// - Assume that the year is greater than 1752 (when the modern calendar was adopted)
// - Assume that the same calendar will remain in use for the future
// - Assume that the year will always be given as a valid positive integer > 1752

// Data: 
// > Input: A Number (represents a year, greater than 1752)
// - Start at Jan 1 of the given year
// - Look at all Fridays
//   -> Find the first Friday (index returned from getDay() === 5)
//      -> Calculate the number of hours between the current date's day 
//         (eg. Jan 1, Wednesday, dayIndex = 3) and Friday (dayIndex = 5)
//      -> Traverse 24 * hoursFromFriday hours 
//         eg. date.setHours(24 * 2)
//         => date is now at the first Friday (Jan 3)
//   -> Increment date by 168 hours (7 days)
// - For each Friday, increment count by 1 if the date is 13.
// - Stop looking when the date year is greater than the given year

// > Output: A Number (representing the number of Friday the 13ths in that year)

// Algorithm:
// Given a number as input, year:
// 1) Initialize a new count variable, unluckyDays = 0
// 2) Initialize a new date - Jan 1 of the given year
//    > new Date(year, 0, 1) (month is 0-indexed)
// 3) Reassign workingDate to the first Friday of the year
//    > Calculate the number of hours between the current workingDate's day and
//      Friday
//      eg. If workingDate is wednesday (dayIndex = 3), set workingDate equal to
//          workingDate + 48 hours (24 x 2)
// 4) Iterate through Fridays while workingDate's year is equal to the given year.
//    For each iteration:
//    a) Increment unluckyDays by 1 if getDate() === 13
//    b) Increment workingDate by 168 hours (1 week)
// 5) After iteration, return unluckyDays.

function fridayThe13ths(year) {
  const HOURS_IN_DAY = 24;
  const HOURS_IN_WEEK = HOURS_IN_DAY * 7;
  const FRIDAY_INDEX = 5;
  let unluckyDays = 0;
  let workingDate = new Date(year, 0, 1);
  // First Friday of the given year
  workingDate.setHours(HOURS_IN_DAY * (FRIDAY_INDEX  - workingDate.getDay()));

  while (workingDate.getFullYear() === year) {
    if (workingDate.getDate() === 13) unluckyDays += 1;

    workingDate.setHours(HOURS_IN_WEEK);
  }

  return unluckyDays;
}

// Refactor: 
// 1) Initial Date may not be correctly calculated if initial day's index is 
//    6 (ie. Saturday) 
//    > 5 - 6 => -1 
//    > Results in the date being moved back to the previous friday (-24 hours),
//      but in the previous year.
// - Calculate the distance from next Friday (forward only)
// - Increment date by 1 until the day index is 5 (friday)
//
// 2) Idiomatic Date Usage
//    > Instead of traversing time via setHours(), we can use 
//      setDate(getDate + 7)
function fridayThe13ths(year) {
  const DAYS_IN_WEEK = 7;
  
  let unluckyDays = 0;
  let workingDate = findFirstFriday(year);



  while (workingDate.getFullYear() === year) {
    if (workingDate.getDate() === 13) unluckyDays += 1;
    workingDate.setDate(workingDate.getDate() + DAYS_IN_WEEK);
  }
  
  return unluckyDays;
}

function findFirstFriday(year) {
  let workingDate = new Date(year, 0, 1);

  while (workingDate.getDay() !== 5) {
    workingDate.setDate(workingDate.getDate() + 1);
  }

  return workingDate;
}



// Examples:
console.log(fridayThe13ths(2025));      // 1
console.log(fridayThe13ths(2028));      // 1

console.log(fridayThe13ths(1986));      // 1
console.log(fridayThe13ths(2015));      // 3
console.log(fridayThe13ths(2017));      // 2