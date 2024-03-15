require 'pry'
# Minilang Further Exploration
# You can write minilang programs that take input values by interpolating
# values into the program string, using Kernel#format. 
# eg.

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

  attr_reader :register, :stack, :command_string

  def initialize(command_string)
    @register = 0
    @stack = Stack.new
    @command_string = command_string
  end

  def eval(options = {})
    working_string = format(command_string, options)
    
    working_string.split.each do |command|
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

# Client
# CELSIUS_TO_FAHRENHEIT =
#   '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
# binding.pry
# Minilang.new(format(CELSIUS_TO_FAHRENHEIT, degrees_c: 100)).eval
# # 212
# Minilang.new(format(CELSIUS_TO_FAHRENHEIT, degrees_c: 0)).eval
# # 32
# Minilang.new(format(CELSIUS_TO_FAHRENHEIT, degrees_c: -40)).eval
# # -40

# We can simplify this code by passing some optional parameters to Minilang#eval,
# and using those parameters to modify the command string.

# CELSIUS_TO_FAHRENHEIT =
#   '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
# minilang = Minilang.new(CELSIUS_TO_FAHRENHEIT)
# minilang.eval(degrees_c: 100)
# # 212
# minilang.eval(degrees_c: 0)
# # 32
# minilang.eval(degrees_c: -40)
# # -40
# minilang.eval(degrees_c: 31)
# # 87.8?

# Further Exploration 3: Write other minilang programs (strings):
# Left-to-right evaluation (no brackets)
# 1. Write numbers in reversed order, with PUSH in between
# 2. Write operators in regular order
# 3. Print the register value

# eg. Celsius to Fahrenheit: degrees_c * 9 / 5 + 32
# 1. 32 PUSH 5 PUSH 9 PUSH degrees_c
# 2. 32 PUSH 5 PUSH 9 PUSH degrees_c MULT DIV ADD 
# 3. 32 PUSH 5 PUSH 9 PUSH degrees_c MULT DIV ADD PRINT

CELSIUS_TO_FAHRENHEIT = 
  '32 PUSH 5 PUSH 9 PUSH %<degrees_c>d MULT DIV ADD PRINT'
minilang = Minilang.new(CELSIUS_TO_FAHRENHEIT)
minilang.eval(degrees_c: 100) #=> 212
minilang.eval(degrees_c: 0)   #=> 32
minilang.eval(degrees_c: -40) #=> -40


# 1) Convert Fahrenheit to Celsius
# (degrees_f - 32) x 5 / 9
FAHRENHEIT_TO_CELSIUS =
  '9 PUSH 5 PUSH 32 PUSH %<degrees_f>d SUB MULT DIV PRINT'
minilang = Minilang.new(FAHRENHEIT_TO_CELSIUS)
minilang.eval(degrees_f: 32) #=> 0
minilang.eval(degrees_f: 41) #=> 5
minilang.eval(degrees_f: 140)#=> 60


# 2) Convert MPH to KPH 
# 3 MPH = 5 KPH 
# #{mph} / 3 * 5
# 1mph = 5/3 kmh

MPH_TO_KMH = '5 PUSH 3 PUSH %<mph>d DIV MULT PRINT'
minilang = Minilang.new(MPH_TO_KMH)
minilang.eval(mph: 40) #=> ~64 (65)
minilang.eval(mph: 60) #=> ~96 (100)
minilang.eval(mph: 90) #=> ~144(150)


# 3) Compute the area of a rectangle
# Two inputs (length x width)
# #{length} * #{width}

RECTANGLE_AREA = '%<length>d PUSH %<width>d MULT PRINT'
minilang = Minilang.new(RECTANGLE_AREA)
minilang.eval(length: 20, width: 10) #=> 200
minilang.eval(length: 22, width: 6)  #=> 132
minilang.eval(length: 9, width: 13)  #=> 117
