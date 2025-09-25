// Member Directory

// Member names and phone numbers are stored in an object.

// Input Validation Rules:
// - First and last names should only allow alphabetic letters, separated by
//   a space.
// - However, this rule is currently not correctly enforced.

// Explain the problem, and fix the code so it works as intended.

const memberDirectory = {
  'Jane Doe': '323-8293',
  'Margaret Asbury': '989-1111',
  'Callum Beech': '533-9090',
  'Juanita Eastman': '424-1919',
};

function isValidName(name) {
  return (/^\w+ \w+$/).test(name);
}

function isValidPhone(phone) {
  return (/^\d{3}-\d{4}$/).test(phone);
}

function validMemberInfo(name, phone) {
  return isValidName(name) && isValidPhone(phone);
}

function addMember(name, phone) {
  if (validMemberInfo(name, phone)) {
    memberDirectory[name] = phone;
  } else {
    console.log('Invalid member information.');
  }
}

// Analysis
// The key point of failure in this code is in how the `isValidName` regex is 
//  constructed using the `\w` character class shorthand, which matches all 
//  'word' characters - this classification includes letters, digits, and underscores.
//  - Therefore, a name like `'Earl 5mith'` is considered valid under this regex,
//    since all characters are word characters.
// To fix this code so that it only allows alphabetic characters, we can update 
//  the regex in `isValidName` to only allow alphabetic characters; for example:

function isValidName(name) {
  return (/^[a-z]+ [a-z]+$/i).test(name);
}

// Valid Cases:
// - Name: Alphabetic<space>Alphabetic
// - Phone Number: 3 Digits-4 Digits
addMember('Laura Carlisle', '444-2223');
addMember('Rachel Garcia', '232-1191');

// Invalid:
// - Name containing non-alphabetic character (digit)
addMember('Earl 5mith', '331-9191');
// - Name containing fewer than/more than one space
addMember('Earl  Smith', '331-9191');
addMember('Earl Smith ', '331-9191');
addMember(' Earl Smith', '331-9191');
addMember('EarlSmith', '331-9191');
// - Name containing other types of characters (non-alphabetic)
addMember('Earl_Smith', '331-9191');
addMember('Earl _Smith', '331-9191');
addMember('Earl_ Smith', '331-9191');
addMember('Earl Sm*th', '331-9191');
addMember('3arl Smith', '331-9191');

// - Phone Number containing incorrect digit sequence sizes (correct is 3-4)
addMember('Rachel Garcia', '2324-119');  // 4-3
addMember('Rachel Garcia', '2324-1191'); // 4-4
addMember('Rachel Garcia', '232-119');   // 3-3
// - Phone Number containing non-hyphen separator
addMember('Rachel Garcia', '232 1191');
addMember('Rachel Garcia', '232*1191');
addMember('Rachel Garcia', '232.1191');
// - Phone Number containing non-digit characters
addMember('Rachel Garcia', '232-119a');
addMember('Rachel Garcia', '23b-1191');
// - Phone number containing accessory characters ()
addMember('Rachel Garcia', '(232)-1191');

console.log(memberDirectory); 
// {
//   'Jane Doe': '323-8293',
//   'Margaret Asbury': '989-1111',
//   'Callum Beech': '533-9090',
//   'Juanita Eastman': '424-1919',
//   'Laura Carlisle', '444-2223',
//   'Rachel Garcia', '232-1191'
// };
