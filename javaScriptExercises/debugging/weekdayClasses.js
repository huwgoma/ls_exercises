// Weekday Classes
// - We wrote a small script that checks which upcoming classes are compatible
//   with our schedule; we must be available for all sessions of a class in order
//   to sign up for it.
// - Weekends are always free, but weekdays may not be available.


// Currently, this code is too lenient - it includes every event except 
// for the Back to the Future Movie Night in the list of compatible classes.

// Identify and fix the error.

const TODAY = toDate("2018-08-05");

function toDate(string) {
  return new Date(`${string}T00:00:00`);
}

function toString(date) {
  return `${date.getYear()}-${date.getMonth()}-${date.getDay()}`;
}

function isInThePast(date) {
  return date < TODAY;
}

function isWeekday(date) {
  return date.getDay() >= 1 &&
         date.getDay() <= 5;
}

const myCalendar = {
  "2018-08-13": ["JS debugging exercises"],
  "2018-08-14": ["Read 'Demystifying Rails'", "Settle health insurance"],
  "2018-08-15": ["Read 'Demystifying Rails'"],
  "2018-08-16": [],
  "2018-08-30": ["Drone video project plan"],
  "2018-09-10": ["Annual servicing of race bike"],
  "2018-09-12": ["Study"],
  "2018-11-02": ["Birthday Party"],
  "2018-11-03": ["Birthday Party"],
};

const offeredClasses = {
  "Back To The Future Movie Night": ["2018-07-30"],
  "Web Security Fundamentals": ["2018-09-10", "2018-09-11"],
  "Pranayama Yoga For Beginners": ["2018-08-30", "2018-08-31", "2018-09-01"],
  "Mike's Hikes": ["2018-08-16"],
  "Gordon Ramsay Master Class": ["2018-09-11", "2018-09-12"],
  "Powerboating 101": ["2018-09-15", "2018-09-16"],
  "Discover Parachuting": ["2018-11-02"],
};

function getCompatibleEvents(classes, calendar) {
  function isAvailable(date) {
    const dateStr = toString(date);

    return !calendar[dateStr] || calendar[dateStr].length === 0;
  };

  const compatibleClasses = [];

  // iterate through each class 
  Object.keys(classes).forEach(className => {
    // create an array of Date objects based on each class's dates array
    const classDates = classes[className].map(toDate);

    // If any class date is in the past (before aug 5), continue to next class
    if (classDates.some(isInThePast)) {
      return;
    }

    // 
    if (classDates.filter(isWeekday).every(isAvailable)) {
      compatibleClasses.push(className);
    }
  });

  return compatibleClasses;
}

console.log(getCompatibleEvents(offeredClasses, myCalendar));
// expected: ["Mike's Hikes", "Powerboating 101"]


// Analysis
// The key point of failure in this code occurs within the `toString()` function;
// the string representation that the `toString()` function returns does not match
// the format of the keys in `myCalendar`. 
// - There are 3 separate issues with the `toString` function:
//   1) The Date#getYear() method does not return the full absolute year, but rather
//      a truncated year relative to 1900. For example, getYear will return
//      118 for the year 2018.
//   2) The Date#getMonth() method returns an index from 0-11, so using its raw
//      value in the output will result in an off-by-1 error. For example, getMonth
//      will return 6 for a Date in July.
//   3) The Date#getDay() method returns an index from 0-6, representing the day
//      of the week (Monday-Friday), not the date (1-31).
// Therefore, for the Date object 2018-07-30T04:00:00.000Z, the output from
// toString will be '118-6-1'.

// Within the `isAvailable` function, we check whether a date is available in
// our calendar by checking for its existence and inverting the result; if a date
// is already accounted for in the calendar, the first condition (!calendar[dateStr])
// would return false, and we would then check whether the list of events on that
// date is empty or not.
// - However, because the `dateStr` obtained from `toStr` is incorrectly-formatted,
//   the date for every event in `offeredClasses` will be considered nonexistent
//   in calendar, and therefore a valid class to attend.
// - The only exception is the Back to the Future Movie Night, because that event
//   occurred on July 30, 2018, which is in the past (the current date is 
//   August 5, 2018) - therefore, this event's date would have satifised the
//   `isInThePast` conditional on Line 53, and execution of that callback invocation
//   would have ended before reaching Line 58, where events are added to the
//   `compatibleClasses` array.

// To fix this error, we would have to fix the 3 errors identified in the 
// `toString` method. For example:

function toString(date) {
  let month        = String(date.getMonth() + 1).padStart(2, '0');
  let dateOfMonth  = String(date.getDate()).padStart(2, '0');
  return `${date.getFullYear()}-${month}-${dateOfMonth}`;
}