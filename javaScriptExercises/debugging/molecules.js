// Molecules

// Our task is to write a function that computes the total number of valence 
// electrons in a molecule:

// For each element in the molecule, we need to know 2 things:
// 1) The element's number of valence electrons (from the periodic table)
//    - Hard-coded in a `valence` function for now.
// 2) The number of atoms of that element in the molecule 
//    - Read from the string representation of the molecule.

// Example: 
// Geosmin is represented by the string 'C12H22O'; it has 12 C atoms, 22 H atoms,
// and 1 O atom.
// - # of Valence Electrons per Element:
//   C => 4   H => 1    O => 6
// Therefore, there are (12*4) + (22*1) + (1 * 6) => 76 valence electrons 
// in Geosmin.

// Currently, we have a function (valenceOfMolecule) that expects one or more
// strings representing each element in the molecule:
// eg. 'C12', 'H22', 'O'
// - The function should then return the total number of all valence electrons
//   in the molecule, based on the given elements.

// Currently, this function does not behave as expected. Explain the error and
// fix  the issue.

function valence(element) {
  switch (element) {
    case 'H': return 1;
    case 'C': return 4;
    case 'N': return 5;
    case 'O': return 6;
    // omitting the rest
  }
}

function valenceOfMolecule() {
  let sum = 0;

  arguments.forEach(atom => {
    const match   = /([a-zA-Z]+)([0-9]*)/.exec(atom);
    const element = match[1];
    const number  = parseInt(match[2]) || 1;

    sum += number * valence(element);
  });

  return sum;
}

// Example

console.log('Number of valence electrons');
console.log('---------------------------');
console.log(`Water:     ${String(valenceOfMolecule('H2', 'O'))}`);
console.log(`Propane:   ${String(valenceOfMolecule('C3', 'H8'))}`);
console.log(`Vitamin C: ${String(valenceOfMolecule('C6', 'H8', 'O6'))}`);
console.log(`Caffeine:  ${String(valenceOfMolecule('C8', 'H10', 'N4', 'O2'))}`);

// Expected output:
// Number of valence electrons
// ---------------------------
// Water:     8
// Propane:   20
// Vitamin C: 68
// Caffeine:  74


// Analysis:
// - The point of failure in this code is that the `arguments` object is not
//   a true Array, but only an Array-like structure. This means that many methods
//   defined on Array.prototype, such as `forEach`, are not available on the
//   arguments object, which is why we get the error `arguments.forEach` is not
//   a function. 
// - To fix this, we can convert `arguments` to a true Array, which will then 
//   allow Array methods to be called on it. For example:

function valenceOfMolecule() {
  let sum = 0;

  Array.from(arguments).forEach(atom => {
    const match   = /([a-zA-Z]+)([0-9]*)/.exec(atom);
    const element = match[1];
    const number  = parseInt(match[2]) || 1;

    sum += number * valence(element);
  });

  return sum;
}

// Alternatively, we  can replace the use of `arguments` with a rest parameter,
// which collects all 'leftover' arguments into a true Array. For example:
function valenceOfMolecule(...elements) {
  let sum = 0;

  elements.forEach(atom => {
    const match   = /([a-zA-Z]+)([0-9]*)/.exec(atom);
    const element = match[1];
    const number  = parseInt(match[2]) || 1;

    sum += number * valence(element);
  });

  return sum;
}