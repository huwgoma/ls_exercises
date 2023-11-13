# 1000 Lights
# You have a bank of switches, numbered from 1 to n. Each switch is connected to 
# one light (initially off). 
# You iterate through the switches and toggle every switch (turn them on).
# - 1x
# Then you do a second passthrough; on this second pass, you toggle switches
#   2, 4, 6, etc. (2x)
# Then you do a third passthrough; on the 3rd pass, you toggle switches
#   3, 6 , 9, etc. (3x)
# So on until <n> passes have been made

# Write a method that takes one argument (n - number of switches) and returns
# an Array that identifies the on-lights after n repetitions.

# Input: An Integer (n) representing the number of lights
# Output: An Array containing integers that represent which lights are on
#   after n passthroughs

# Example:
# toggle_lights(5) == [1, 4]
#   Round 1: Turn every light on (1-5)
#   Round 2: Toggle lights 2 and 4 => [1, 3, 5] are on
#   Round 3: Toggle light 3 => [1, 5] are on
#   Round 4: Toggle light 4 => [1, 4, 5] are on
#   Round 5: Toggle light 5 => [1, 4] are on

# Data: 
#   The Integer given as input: Use integer to create an array of lights (1-n)
#   An Array containing integers that represent lights that are on (return this)
#   - A light is on if it is included in this array
#   [1, 2, 3, 4, 5]
#   1: [1, 2, 3, 4, 5] 2: [2, 4] 3: [3] 4: [4] 5: [5]


# Algorithm:
# Given an Integer n, representing the number of lights: 
# Create a range from 1-n, integers
# Create a new empty array, on = []
# Iterate through integers. For each int, starting from 1, increment 1:
#   Select the integers from lights that are evenly divisible by the current int,
#     toggle_list
#   Iterate through toggle_list. For each light (int):
#     If the current light is already in the on array, remove that integer from
#     on.
#     Otherwise, add current int to on array  
# Return on array

# def toggle_lights(n)
#   (1..n).each_with_object([]) do |int, on_list|
#     toggle_list = (1..n).select { |i| (i % int).zero? }
#     toggle_list.each do |light|
#       if on_list.include?(light)
#         on_list.delete(light)
#       else
#         on_list << light
#       end
#     end
#   end
# end

# p toggle_lights(5) == [1, 4]
# p toggle_lights(10) == [1, 4, 9]

# p toggle_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]



# Algorithm/Data Refactor:
# Data:
#   0 - off; 1 - on
#   Hash: Keys represent the light numbers (1-n)
#         Values represent the light state (on/off)


# Given an Integer n, representing the number of lights (and number of rounds)
# Iterate from 1 to n (rounds). For each round:
#   Calculate the light numbers that we want to toggle:
#   - Select all light numbers that are evenly divisible by the current round number
#   Iterate through the light numbers that we want to toggle. For each light:
#     If the light is currently on, turn it off; otherwise, turn it on
#     - light_states[light_number] == off? -> on : off
# Return an array containing all the light numbers that have a state of on.


def active_lights(n)
  # n represents both the # of lights AND the # of rounds
  lights = initialize_lights(n)

  1.upto(n) do |round|
    lights_to_toggle = select_lights(lights, round)
    toggle_lights!(lights, lights_to_toggle)
  end
  lights.select { |light_num, state| state == 'on' }.keys
end

def initialize_lights(n)
  (1..n).each_with_object({}) do |light_num, lights|
    lights[light_num] = 'off'
  end
end

def select_lights(lights, round_num)
  lights.select { |light_num, _state| light_num % round_num == 0 }
end

def toggle_lights!(lights, lights_to_toggle)
  lights_to_toggle.each do |light_num, state|
    state == 'on' ? lights[light_num] = 'off' : lights[light_num] = 'on' 
  end
end


p active_lights(5) == [1, 4]
p active_lights(10) == [1, 4, 9]

p active_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]