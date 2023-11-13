# Stack Machine 
# A stack-and-register language uses a stack of values.
# - Each operation in the language operates on a register (current value)
#   which is not part of the stack.
# - Operations that require two values pop the top-most item from the stack, 
#   perform the operation using the popped value and the register value, then 
#   store the result back in the register.

# eg. MULT (multiply): Multiply the topmost stack value with the register value,
#   removes the value from the stack, and stores the result in the register.
# - Register: A separate data structure?
#   eg. [3, 6, 4], register: 7
#   MULT => [3, 6], register: 28

# Write a method that implements a mini stack-and-register based programming language
# with the following commands:
# n (integer): Place a value n in the register; do not modify the stack
# PUSH: Push the register value to the top of the stack; leave the value
#   in the register
# ADD: Pop the top value from the stack and ADD it to the register's value;
#   store the result in the register
# SUB: Same as add but SUBTRACT stack value from register value
# MULT: Same as add, but MULTIPLY stack value by register value
# DIV: Same as add, but DIVIDE register value by stack value (integer div)
# MOD: Pop the topmost stack value and divide register value by stack value,
#   then store the remainder in the register
# POP: Remove the topmost item from the stack and place it in register
# PRINT: Print the register value.

# Programs should be implemented as a string passed as an argument.
# - Assume that all programs are correct (will not try to pop a non-existent 
# value, and won't contain unknown commands)
# - The register should be initialized to 0.


# Input: A String representing a command (or multiple commands)
#   n command (number first, command second, if number is involved)
# Output: String representations of the operation results

# Examples:
# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# Data: 
#   The String given as input (command)
#   - Will need to deconstruct the string (string can contain multiple commands)
#   - Split on spaces should be fine
#   - 'n' command - If the command is an integer, just add it to the stack
#   A 'register' that stores one value (default 0)
#   A stack that stores multiple values (last in first out)

# Algorithm:
# Given a string as input, command:
# Split command into an array of substring commands (on spaces)
# Initialize a new variable, register = 0
# Initialize a new empty array, stack = []
# Iterate through commands. For each command:
# - Execute the appropriate command
#   - Match the current command string to the corresponding operation
#   eg. 'PRINT'
#        => puts register
#   eg. '3' => add 3 (integer) to stack (str.to_i.to_s == str)

# def minilang(program)
#   register = 0
#   stack = []

#   program.split.each do |command|
#     case command
#     when command.to_i.to_s then register = command.to_i
#     when 'PUSH'            then stack << register
#     when 'ADD'             then register += stack.pop 
#     when 'SUB'             then register -= stack.pop
#     when 'MULT'            then register *= stack.pop
#     when 'DIV'             then register /= stack.pop
#     when 'MOD'             then register %= stack.pop
#     when 'POP'             then register = stack.pop
#     when 'PRINT'           then puts register
#     end
#   end
# end



# minilang('PRINT')
# # 0
# minilang('5 PUSH 3 MULT PRINT')
# # 15
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8
# minilang('5 PUSH POP PRINT')
# # 5
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12
# minilang('-3 PUSH 5 SUB PRINT')
# # 8
# minilang('6 PUSH')
# #(nothing printed; no PRINT commands)

# Further Exploration: 
# Write a minilang program (string) equivalent to this:
# (3 + (4 * 5) - 7) / (5 % 3) # => 8
# Register = Register / Stack
# Register / Stack || Register % Stack

# 0) 5 % 3
# 1) 4 * 5 => 20
# 2) 3 + 20 
# 3) 23 - 7
# 4) 16 / 2

# OOO
# 1) 5 % 3 => 2 (Register); PUSH 2 to stack
#   - Place 3 into register
#   - PUSH 3 to stack
#   - Place 5 into register
#   - MOD (pop 3) => 5 % 3 => 2
#   Register: 2; stack: []
#   - PUSH 2 to stack => stack: [2]
#   Register: 2; stack: [2]

# 2) (3 + (4 * 5) - 7)
# (Load Numbers into Stack)
#   - Place 7 into register; PUSH to stack
#   Register: 7; stack: [2, 7]
#   - Place 3 into register; PUSH to stack
#   Register: 3; stack: [2, 7, 3]
#   - Place 4 into register; PUSH to stack
#   Register: 4; stack: [2, 7, 3, 4]
#   - Place 5 into register
#   Register: 5; stack: [2, 7, 3, 4]
#   
#   MULT (pop 4) => 4 x 5 => 20
#     Register: 20; stack: [2, 7, 3]
#   ADD (pop 3) => 20 + 3 => 23
#     Register: 23; stack: [2, 7]
#   SUB (pop 7) => 23 - 7 => 16
#     Register: 16; stack: [2]
#   DIV (pop 2) => 16 / 2 => 8
#     Register: 8; stack: []



# minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')

# Further Exploration 2: Add some error handling
# Have the method detect: 
# 1) Empty stack conditions (ie. trying to pop out of an empty stack)
# 2) Invalid tokens
#  
# - Return an error message if an error occurs, and nil if the program runs 
#   successfully

# Empty Stack condition:
# If the stack is empty when pop is called, nil is returned
# Then if the command is something like ADD, which chains '+' to
# Register (0) + Stack (nil), we get a type error
# cannot coerce nil to integer
# POP on its own does not raise an error (just returns nil)
# - but should still prevent this, as otherwise register gets assigned to nil
# which will fuck up future operations

# Invalid Tokens:
# Create an array of valid tokens
# If the current command is not valid (included in valid commands
# OR is an integer), return an error

VALID_COMMANDS = ['PUSH', 'ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP', 'PRINT']

def minilang(program)
  register = 0
  stack = []

  program.split.each do |command|
    raise "Command #{command} not found" unless valid_command?(command)

    case command
    when command.to_i.to_s then register = command.to_i
    when 'PUSH'            then stack << register
    when 'PRINT'           then puts register 
    else # If one of the above commands isn't executed...
      raise "Cannot perform operation #{command} with empty stack" if stack.empty?
      case command
      when 'ADD'             then register += stack.pop 
      when 'SUB'             then register -= stack.pop
      when 'MULT'            then register *= stack.pop
      when 'DIV'             then register /= stack.pop
      when 'MOD'             then register %= stack.pop
      when 'POP'             then register = stack.pop
      end
    end
  end
end

def valid_command?(command)
  VALID_COMMANDS.include?(command) || integer?(command)
end

def integer?(str)
  str.to_i.to_s == str
end

minilang('3 PUSH ADD PRINT')