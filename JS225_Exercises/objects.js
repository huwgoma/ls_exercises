// Buggy Code (1)
// - The following code is expected to produce the specified output:

// function createGreeter(name) {
//   return {
//     name,
//     morning: 'Good Morning',
//     afternoon: 'Good Afternoon',
//     evening: 'Good Evening',
//     greet(timeOfDay) {
//       let msg = '';
//       switch (timeOfDay) {
//         case 'morning':
//           msg += `${morning} ${name}`;
//           break;
//         case 'afternoon':
//           msg += `${afternoon} ${name}`;
//           break;
//         case 'evening':
//           msg += `${evening} ${name}`;
//           break;
//       }

//       console.log(msg);
//     },
//   };
// }

// const helloVictor = createGreeter('Victor');
// helloVictor.greet('morning');

//=> Good Morning Victor

// However, it currently produces an error. Explain why, and provide a
// fix.
// - The key point of failure in this code is within the `greet` method;
//   specifically, the missing `this` statements within the `switch`
//   statement.
// - When JavaScript attempts to resolve identifiers within an object,
//   it will not search through the object's properties, because objects
//   do not create lexical scopes like function or block bodies.
// - If we want to specify that an identifier is an object property, we
//   must explicitly 'anchor' it to an object, using either the actual
//   name of the object, or with `this` (which references the current
//   context of execution; the `helloVictor` object, in this case, since
//   `greet` was called on `helloVictor`). 
// - Therefore, to fix this, we would just need to prepend each object
//   property (`morning`, `name`, etc..) with `this`:

// function createGreeter(name) {
//   return {
//     name,
//     morning: 'Good Morning',
//     afternoon: 'Good Afternoon',
//     evening: 'Good Evening',
//     greet(timeOfDay) {
//       let msg = '';
//       switch (timeOfDay) {
//         case 'morning':
//           msg += `${this.morning} ${this.name}`;
//           break;
//         case 'afternoon':
//           msg += `${this.afternoon} ${this.name}`;
//           break;
//         case 'evening':
//           msg += `${this.evening} ${this.name}`;
//           break;
//       }

//       console.log(msg);
//     },
//   };
// }

// const helloVictor = createGreeter('Victor');
// helloVictor.greet('morning');

// Note that identifiers which are *not* object properties, such as
// `timeOfDay` or `msg`, do not require this treatment. This is 
// because they are regular variables (not object properties) that
// are resolved normally during JavaScript's regular name lookup
// process; `timeOfDay` is defined locally as a parameter to 
// `greet`, while `msg` is defined as a local variable on Line 57.


// Further Exploration:
// rest of code omitted for brevity

      // switch (timeOfDay) {
      //   case 'morning':
      //     msg += this.morning + ' ' + name;
      //     break;
      //   case 'afternoon':
      //     msg += this.afternoon + ' ' + name;
      //     break;
      //   case 'evening':
      //     msg += this.evening + ' ' + name;
      //     break;
      // }

// rest of code omitted for brevity

// This solution would also work. Why?
// - This solution (omitting `this` from `name`) would also produce the
//   expected output because the `name` variable is actually defined
//   in an outer scope, as the parameter name for the `createGreeter`
//   function. Therefore, even though JavaScript will not search through
//   the `helloVictor` object's properties to find `name`, it will find
//   a `name` variable (the parameter on Line 50) via lexical name
//   resolution.
// - However, the fact that this code works is more of a coincidence 
//   than good practice, in my opinion, since it is essentially bypassing
//   the `name` property entirely, and relying on the name of the 
//   `name` parameter instead. This, in my opinion, sort of defeats 
//   one of the purposes of OOP (using properties to represent the 
//   state of an object).



// ==============================================================



// Buggy Code (2)
// - A grocery store uses a JavaScript function to calculate the
//   discounts on various items; however, the results are currently
//   not as expected.
// - Identify the error(s) and provide a solution.

// const item = {
//   name: 'Foo',
//   description: 'Fusce consequat dui est, semper.',
//   price: 50,
//   quantity: 100,
//   discount(percent) {
//     const discount = this.price * percent / 100;
//     this.price -= discount;

//     return this.price;
//   },
// };

// console.log(item.discount(20));   // expected: 40;   actual: 40
// console.log(item.discount(50));   // expected: 25;   actual: 20
// console.log(item.discount(25));   // expected: 37.5; actual: 15

// The primary issue with this code occurs on Line 137; after each
// discount is applied, the value of the `price` property is reassigned
// to a new value, calculated from `price - discount`. Therefore, each
// invocation of `item.discount` will reduce the `price` of `item`, 
// causing subsequent discounts to be applied to a successively 
// smaller `price` value, rather than the intended `50`.
// - To fix this, we can modify the last 2 lines of the `discount`
//   function to instead calculate and return the discounted price
//   idempotently, without altering the original value of `price`:

// const item = {
//   name: 'Foo',
//   description: 'Fusce consequat dui est, semper.',
//   price: 50,
//   quantity: 100,
//   discount(percent) {
//     const discount = this.price * percent / 100;
    
//     return this.price - discount;
//   },
// };

// console.log(item.discount(20));   // 40;
// console.log(item.discount(50));   // 25;
// console.log(item.discount(25));   // 37.5




// ===================================================



// Testing Object Equality
// - In JavaScript, comparing objects with == or === checks for object
//   identity (ie. it only returns true if both objects are the same 
//   object in memory.)
// - Write a function (objectsEqual) that takes 2 objects and returns
//   true or false, based on whether they have the same key/value
//   pairs.

// Questions:
// 1) Can the values in each object be objects themselves? If so, what 
//    depth of nesting should we be expected to handle?
// => No need to handle nested objects

// 2) Can either object argument be given as an array?
// => Yes (treat like a normal object)
// a) How should sparse arrays be handled? 
// - eg. Should [<1 empty item>] be considered equal to []?
//   => No (length property differs)

// 3) Can either object argument be missing, or given as a non-object 
//    value?
// => No


// Data:
// > Input: 2 objects
// - Get a list of all key names from each object
// >> Object.keys? 
// ** Problem: Wouldn't work for sparse arrays (indistinguishable from
//    empty arrays)
// >> Object.getOwnPropertyNames()
// => Would work better (includes length, which we can use to distinguish)

// Compare lengths of each object's key arrays
// - if not equal, return false instantly

// Otherwise, iterate over the keys of objectA and verify that the 
// value for every key in objectA is equal to the value of that key
// in object B
// >> objectA[key] === objectB[key]
// ^ if this returns false for any key, return false instantly

// ** If A and B have the same number of keys, but the keys are diff:
// - Plus the different keys' values are undefined 
// eg. { a, b: undefined } { a, c: undefined }
// - During iteration, additionally check that objectB has the current
//   property.

// > Output: Boolean (true if all key/value pairs in both objects are
//   equal)


// Algorithm:
// Given two objects as input, objectA and objectB:
// 1) Extract each object's property names into 2 arrays, propertiesOfA
//    and propertiesOfB (?)
// >> Use Object.getOwnPropertyNames()
// 2) Compare the lengths of AProperty vs. BProperty; if they are not
//    equal, return false.
// 3) Iterate through propertiesOfA. For each property name:
// -- Verify that:
//    a) Object B has every property in object A
//    b) The value for every property name is equal in both A and B
//    - Every(); 
//      return Object#hasOwnProperty(B) && objectA[propertyName] === objectB[propertyName]
// 4) => true if every value for every property is equal, false otherwise

// function objectsEqual(objectA, objectB) {
//   let propertiesA = Object.getOwnPropertyNames(objectA);
//   let propertiesB = Object.getOwnPropertyNames(objectB);

//   if (propertiesA.length !== propertiesB.length) return false;

//   return propertiesA.every(propertyName => {
//     return objectB.hasOwnProperty(propertyName) && 
//            objectA[propertyName] === objectB[propertyName];
//   });
// }

// // Examples:
// // - All key/value pairs are equal
// console.log(objectsEqual({a: 'foo'}, {a: 'foo'}) === true);
// // - Order does not matter
// console.log(objectsEqual({a: 'foo', b: 'bar'}, {b: 'bar', a: 'foo'}) === true);

// // - Object B is missing a key-value pair compared to A (or vice-versa)
// console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}) === false);
// console.log(objectsEqual({a: 'foo'}, {a: 'foo', b: 'bar'}) === false);
// // - Object B has the same keys, but not all values are the same
// console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo', b: 'BAR'}) === false);

// // - Object B is missing a key-value pair; corresponding value in A
// //   is undefined
// console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo'}) === false);

// // Empty === Empty 
// console.log(objectsEqual({}, {}) === true);

// // Works with Arrays
// console.log(objectsEqual([], []) === true);
// console.log(objectsEqual([1, 2, 3], [1, 2, 3]) === true);

// console.log(objectsEqual([1, 2, 3], [1, 2]) === false);
// console.log(objectsEqual([1, 2], [1, 2, 3]) === false);

// console.log(objectsEqual([1, 2, 3], ['1', '2', '3']) === false);
// console.log(objectsEqual(['1', '2', '3'], [1, 2, 3]) === false);


// // Object A and B have the same number of keys, but different keys
// console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: undefined}) === false);  
// console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}) === false);  




// ==========================================================



// Student
// - Create an object factory for a student object, with the following
//   methods:
// a) info => Logs name/year
// b) addCourse => Enrolls the student in the given course
//   - course is an object with name/code properties
// c) listCourses => Returns a list (array?) of courses the student is
//    enrolled in.
// d) addNote => Adds a note property to a course, specified by the
//    given `code` argument.
//    - If a note already exists, the given note is appended to the 
//      existing one.
// e) updateNote: Updates a note for the given course (replaces the
//    existing note)
// f) viewNotes: Logs the notes for all courses
//    - courses without notes are not displayed

// function createStudent(name, year) {
//   return {
//     name,
//     year,
//     courses: [],

//     info() {
//       console.log(`${this.name} is a ${this.year} year student.`);
//     },

//     // Courses
//     listCourses() {
//       return this.courses.slice();
//     },

//     addCourse(course) {
//       this.courses.push(course);
//     },

//     findCourse(code) {
//       return this.courses.find(course => course.code === code);
//     },

//     // Notes
//     addNote(courseCode, note) {
//       let course = this.findCourse(courseCode);

//       if (course === undefined) return console.log('Course not found');

//       if (course.hasOwnProperty('note')) { 
//         course.note += `; ${note}`;
//       } else {
//         course.note = note;
//       }
//     },

//     viewNotes() {
//       this.courses.forEach(course => {
//         if (course.note) {
//           console.log(`${course.name}: ${course.note}`);
//         }
//       })
//     },

//     updateNote(courseCode, newNote) {
//       let course = this.findCourse(courseCode);

//       if (course === undefined) return console.log('Course not found');

//       course.note = newNote;
//     },
//   }
// }

// // Create student (Hugo, 1st year)
// let hugo = createStudent('Hugo', '1st');
// // info() => Log
// hugo.info(); // Logs "Hugo is a 1st year student"

// // list courses
// console.log(hugo.listCourses()); // []

// // add courses
// hugo.addCourse({ name: 'Math', code: 101 });
// hugo.addCourse({ name: 'AP Math', code: 102 });
// console.log(hugo.listCourses()); 
// // [ { name: 'Math', code: 101 }, { name: 'AP Math', code: 102 } ]


// // adding notes to courses
// hugo.addNote(101, 'Fun course');
// // notes are appended to existing notes
// hugo.addNote(101, 'Remember to study for algebra');

// // view notes
// // - notes are joined by semicolon + space 
// // - courses without notes (eg. AP Math) don't appear
// hugo.viewNotes();
// //Logs:  Math: Fun course; Remember to study for algebra

// hugo.addNote(102, 'Hard course');
// hugo.viewNotes();
// //Logs:  Math: Fun course; Remember to study for algebra
// //Logs:  AP Math: Hard course

// // Updating Notes - Replaces the existing note entirely
// hugo.updateNote(101, 'Fun course!!');
// hugo.viewNotes();
// //Logs:  Math: Fun course!!
// //Logs:  AP Math: Hard course


// // Bad Inputs
// hugo.addNote(105, '???'); // logs "Course not found"
// hugo.updateNote(105, '???'); // logs "Course not found"




// ================================================================




// School
// - Create a school object.
// - The school object uses the same type of student objects created 
//   in the previous exercise, and has methods that use/update info
//   about students.
// - The school object should have the following methods:
// a) addStudent
// -> Create a new student and add them to a collection.
// - The year value for the student must be 1st, 2nd, 3rd, 4th, or
//   5th - all other values are rejected.
//   -> If an invalid year is given, do not create the student, and
//      log 'invalid year'.
//   -> Otherwise, create the student, add it to the students array,
//      and return the student.

// b) enrollStudent: Enroll the given student in the given course.

// c) addGrade: Add the grade of a student for a course

// d) getReportCard: Log the grade of a student for all courses.
//   - If a course has no grade, log 'In progress' instead.

// e) courseReport: Log the grades of all students for a given course
//    name. (only log the students with finalized grades, not in-progress)

// Students Factory
function createStudent(name, year) {
  return {
    name,
    year,
    courses: [],

    info() {
      console.log(`${this.name} is a ${this.year} year student.`);
    },

    // Courses
    listCourses() {
      return this.courses.slice();
    },

    addCourse(course) {
      this.courses.push(course);
    },

    findCourse(code) {
      return this.courses.find(course => course.code === code);
    },

    // Notes
    addNote(courseCode, note) {
      let course = this.findCourse(courseCode);

      if (course === undefined) return console.log('Course not found');

      if (course.hasOwnProperty('note')) { 
        course.note += `; ${note}`;
      } else {
        course.note = note;
      }
    },

    viewNotes() {
      this.courses.forEach(course => {
        if (course.note) {
          console.log(`${course.name}: ${course.note}`);
        }
      })
    },

    updateNote(courseCode, newNote) {
      let course = this.findCourse(courseCode);

      if (course === undefined) return console.log('Course not found');

      course.note = newNote;
    },
  }
}

// School Factory
function createSchool() {
  return {
    students: [],

    addStudent(studentName, studentYear) {
      const validStudentYears = ['1st', '2nd', '3rd', '4th', '5th'];
      if (!validStudentYears.includes(studentYear)) {
        return console.log('Invalid Year');
      } 

      let student = createStudent(studentName, studentYear)
      this.students.push(student);
      return student;
    },

    enrollStudent(student, course) {
      student.addCourse(course);
    },

    addGrade(student, courseCode, grade) {
      let course = student.findCourse(courseCode);

      if (course === undefined) return console.log('Course not found');

      course.grade = grade;
    },

    // Report Cards
    getReportCard(student) {
      console.log(`Grades for ${student.name}:`);

      let courses = student.listCourses();

      courses.forEach(course => {
        let grade = course.grade || 'In progress';

        console.log(`${course.name}: ${grade}`);
      });
    },

    courseReport(courseName) {
      let studentGrades = this.students.reduce((grades, student) => {
        let targetCourse = student.listCourses().find(course => {
          return course.name === courseName;
        });

        if (targetCourse && targetCourse.hasOwnProperty('grade')) {
          grades.push({ studentName: student.name, grade: targetCourse.grade });
        }

        return grades;
      }, []);

      if (studentGrades.length === 0) return;

      // Log per-student grades
      console.log(`=${courseName} Grades=`);
      studentGrades.forEach(studentGrade => {
        let { studentName, grade } = studentGrade;
        console.log(`${studentName}: ${grade}`);
      });

      // Log average grades
      let average = studentGrades.reduce((sum, studentGrade) => {
        return sum + studentGrade.grade;
      }, 0) / studentGrades.length;

      console.log('---');
      console.log(`Course Average: ${average}`);
    },
  }
}

// Usage:
let school = createSchool();

// Paul
// - Adding a student
let paul = school.addStudent('Paul', '3rd');
// - Enrolling paul into courses
school.enrollStudent(paul, { name: 'Math', code: 101 });
school.enrollStudent(paul, { name: 'Advanced Math', code: 102 });
school.enrollStudent(paul, { name: 'Physics', code: 202 });
// - Adding a grade for paul's courses
school.addGrade(paul, 101, 95);
school.addGrade(paul, 102, 90);


// Mary:
let mary = school.addStudent('Mary', '1st');
school.enrollStudent(mary, { name: 'Math', code: 101 });
school.addGrade(mary, 101, 91);


// Kim
let kim = school.addStudent('Kim', '2nd');
school.enrollStudent(kim, { name: 'Math', code: 101 });
school.enrollStudent(kim, { name: 'Advanced Math', code: 102 });
school.addGrade(kim, 101, 93);
school.addGrade(kim, 102, 90);


// getReportCard
// school.getReportCard(paul);
// Logs Grades for Paul:
//      Math: 95
//      Advanced Math: 90
//      Physics: In progress


// courseReport
school.courseReport('Math');
// Logs Grades for Math:
// =Math Grades=
//      Paul: 95
//      Mary: 91
//      Kim: 93
// --- 
// Course Average: 93

school.courseReport('Advanced Math');
// = =Advanced Math Grades=
// = Paul: 90
// = Kim: 90
// = ---
// = Course Average: 90

school.courseReport('Physics');
//=> Returns undefined
