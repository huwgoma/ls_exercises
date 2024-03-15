require 'pry'
# Minilang
# Write a class that implements a mini stack-and-register-based programming language.
# Stack/Register:
# - The REGISTER holds the 'current' value (initialized to 0)
# - The STACK holds a list of values

# Commands:
# n: Place a value (n) into the register
# PUSH: Push the value of the register onto the stack; leave the value in the 
#   register.
# ADD: Pop the top value off the stack and add it to the value in the register;
#   store the result in the register
# SUB: Pop the top value from the stack and subtract it FROM the register value
#   (register - stack); store the result in the register.
# MULT: Pop the top value from the stack and multiply it by the register value;
#   store the result in the register
# DIV: Pop the top value from the stack and divide the register value by the
#   stack value (register / stack); store result in register
# MOD: Pop the top value from the stack and divide the register value by the
#   stack value (register / stack); store the remainder in register
# POP: Remove the top value from the stack and place it in the register
# PRINT: Print the value in the register

# Programs are supplied using strings.
# If an unexpected command is in the string, or if a required stack value is missing,
#   your program should raise an error and print an error message.

# bottom [1, 2, 3, 4, ...] top

class InvalidTokenError < StandardError
  attr_reader :command

  def initialize(command)
    @command = command
  end
  
  def message
    "Invalid token: #{command}"
  end
end

class EmptyStackError < StandardError
  def message
    "Empty stack!"
  end
end

class Minilang
  VALID_COMMANDS = ['PUSH', 'ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP', 'PRINT']

  attr_reader :register, :stack, :commands

  def initialize(commands)
    @register = 0
    @stack = Stack.new
    @commands = commands
  end

  def eval
    commands.split.each do |command|
      raise InvalidTokenError.new(command) unless valid_command?(command)

      if numeric?(command)
        self.register = command.to_i
      else
        self.send(command.downcase)
      end
    end
  rescue InvalidTokenError, EmptyStackError => e
    puts e.message
  end

  private

  # n
  def register=(value)
    @register = value
  end

  def push
    stack << register
  end

  # Minilang command POP - Remove and reassign to @register
  def pop
    self.register = stack.pop
  end

  def add
    self.register += stack.pop
  end

  def sub
    self.register -= stack.pop
  end

  def mult
    self.register *= stack.pop
  end

  def div
    self.register /= stack.pop
  end

  def mod
    self.register %= stack.pop
  end

  def print
    puts register
  end

  # Validation
  def valid_command?(command)
    VALID_COMMANDS.include?(command) || numeric?(command)
  end

  def numeric?(command)
    command.to_i.to_s == command
  end
end

class Stack < Array
  def pop
    raise EmptyStackError.new if empty?
    super # Array#pop
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
