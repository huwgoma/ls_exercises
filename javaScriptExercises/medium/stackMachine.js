// Stack Machine Interpretation
// A stack is a list of values that operates on the last-in first-out principle;
// new elements are pushed to the top of the stack, and elements are popped from
// the top of the stack.

// A stack-and-register language uses a stack of values and a register, which
// holds the current value.
// - Operations that require 2 values pop the top item from the stack and perform
//   the operation on the popped value and the register value => stored in register

// Write a function that implements a simple stack-and-register language, with the
// following commands (operations/tokens):

// 1) n: Place a value (n) into the register. Stack is not modified.

// 2) PUSH: Push the current value of register into the stack. Register is not
//    reassigned.

// 3) ADD: Remove the top value from stack, add it to the register value, and 
//    store the result in `register`.

// 4) SUB: Remove the top value from stack and subtract it from register
//    (register - popped); store the result in register

// 5) MULT: Remove the top value from stack and multiply it by register value
//    => Store in register

// 6) DIV: Remove the top value from stack and divide the register value by the
//    popped stack value; store the -integer- result in register 
//    > (Round(register / popped))
//    ** Round DOWN to the nearest integer

// 7) REMAINDER: Remove top value from stack and divide register by popped; store
//    the integer remainder in register
//    > (Round(register % popped))

// 8) POP: Remove the top value from stack and place it in register

// 9) PRINT: Print the register value.


// Commands are supplied via a string argument.
// - Assume that all inputs will be valid:
//   - Will not contain unknown tokens
//   - Will not contain an invalid sequence of commands 
// - Assume that all numbers given will be whole numbers only (no decimals)
// Stack and register should be initialized to [] and 0, respectively.

// Data: 
// - Stack (an array [])
// - Register (integer 0)
// Commands are given in the form of a continuous string
// - Split the string on spaces to obtain each command
// - Iterate over each command and match it to the appropriate action(s)

// > PUSH      => Push current value of register into stack
// > POP       => Remove the last value in stack and assign to register
// > PRINT     => Log the current value of register to console
// > ADD       => Pop a value from the stack (POP => poppedValue), add poppedvalue + 
//                register, then reassign register to the result
// > SUB       => Pop, register = register - poppedValue
// > MULT      => Pop, register = register * poppedValue
// > DIV       => Pop, register = ROUND(register / poppedValue)
// > REMAINDER => Pop, register = register % poppedValue
// > else (N)  => register = command string (as number)


function minilang(commandString) {
  let commands = commandString.split(/\s+/);
  let stack    = [];
  let register = 0;

  const pop = () => {
    if (stack.length === 0) throw new RangeError('Cannot pop from an empty stack');
    return stack.pop();
  }

  commands.forEach(command => {
    switch (command) {
      // Stack Manipulation
      case 'PRINT':
        console.log(register);
        break;
      case 'PUSH':
        stack.push(register);
        break;
      case 'POP':
        register = pop();
        break;
      // Arithmetic Operations
      case 'ADD':
        register += pop();
        break;
      case 'SUB': 
        register -= pop();
        break;
      case 'MULT':
        register *= pop();
        break;
      case 'DIV':
        register = Math.floor(register / pop());
        break;
      case 'REMAINDER':
        register %= pop();
        break;
      default:
        if (!isValidNumberString(command)) throw new TypeError('Invalid token given');
        register = Number(command);
        break;
    }
  })
}

function isValidNumberString(numberString) {
  return /^-?\d+(?:\.\d+)?$/.test(numberString);
}

// Further Exploration:
// - Refactor minilang to include some error handling:
// > If an empty stack condition occurs (ie. trying to pop a value from an empty stack),
//   raise an error
// > If an invalid token is given, also raise an error
// - Return undefined if program runs successfully and raise an error otherwise.

// 1) Empty Stack Condition
//    > In pop(): If stack is empty, raise a RangeError
// 2) Invalid token
//    > Refactor default case: Check if command contains any non-digit characters;
//      if so, raise a TypeError 

// Examples:
// - Basic Printing and Registering (for easier debugging)
minilang('PRINT');   // Outputs 0
minilang('5 PRINT'); // 5
minilang('7 PRINT'); // 7
minilang('7 9 PRINT'); // 9

// Pushing from Register to Stack
minilang('5 PUSH PRINT'); // 5 (Register is not reassigned)

// Popping the top value from stack
minilang('5 PUSH 7 POP PRINT'); // 5 (Push 5, replace with 7, remove 5 => register)
// > Only the top value is removed
minilang('5 PUSH 6 PUSH 7 POP PRINT'); // 6 (Push 5, Push 6, Replace 7, Remove 6 => Register)

// Adding values
minilang('5 PUSH 7 ADD PRINT'); // 12 (Push 5, Replace 7, Pop 5, Add 5 + 7 => register)

// Subtracting values (Register - Popped)
minilang('5 PUSH 12 SUB PRINT'); // 7 (Push 5, Register 12, Pop 5, Sub 12 - 5 => register)

// Multiplying values
minilang('5 PUSH 12 MULT PRINT'); // 60 (Push 5, Register 12, Pop 5, Mult 12 * 5 => Register)

// Dividing Values (Register / Popped)
minilang('5 PUSH 30 DIV PRINT'); // 6 (Push 5, Register 30, Pop 5, Div 30 / 5 => Register)
// - Divisions should return integers 
minilang('7 PUSH 30 DIV PRINT'); // 4 (Push 7 Register 30 Pop 7 Div 30 / 7 => 4.28 => 4)

// Remainder of Division (Register % Popped)
minilang('5 PUSH 30 REMAINDER PRINT'); // 0 (Push 5, Register 30, Pop 5, Mod 30 % 5 => Register 0)
// - Modulos should return integers (no special handling needed)
minilang('5 PUSH 32 REMAINDER PRINT'); // 2 (Push 5, Register 32, Pop 5, Mod 32 % 5 => Register 2)

console.log('\nGiven Examples ===================================================\n')
// Given Examples:
minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
// 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// 6

minilang('4 PUSH PUSH 7 REMAINDER MULT PRINT');
// 12

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` commands)


console.log('\nError Examples ===================================================\n')
// // Popping from an empty stack
// minilang('5 PUSH POP POP PRINT'); // RangeError
// // Invalid command type
// minilang('HELLO'); // TypeError

