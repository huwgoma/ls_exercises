# Number Guesser Pt. 2
# Update the solution from number_guesser_1.rb to accept a low/high value when 
#   initializing a GuessingGame object, and use those values to compute the 
#   target number for the game.
# Also change the number of guesses allowed, so that the user can always win
#   with a good strategy.
# - The number of guesses can be computed with the following formula:
#   Math.log2(range.size).to_i + 1

# Game objects should be able to start a new game with a new target number whenever
# #play is called.
# - eg. Game.new.play; game.play => 2 different games, 2 different numbers

class GuessingGame
  def initialize(min, max)
    @range = (min..max)
    @guess_limit = calculate_guess_limit
    @target_number = rand(range)

    @guess = nil
  end

  def play
    reset_game

    guess_limit.downto(1) do |count|
      puts "You have #{count} guesses remaining."

      self.guess = prompt_guess.to_i
      display_guess_result

      break if correctly_guessed?
      puts "\n"
    end
    display_game_result
    puts "\n"
  end

  private

  attr_reader :range, :guess_limit
  attr_accessor :target_number, :guess

  def reset_game
    self.target_number = rand(range)
    self.guess = nil
  end

  def calculate_guess_limit
    Math.log2(range.size).to_i + 1
  end

  def remaining_guess_count
    GUESS_LIMIT - guess_count
  end

  def prompt_guess
    loop do
      print "Enter a number between #{range.min} and #{range.max}: "
      guess = gets.chomp
      return guess if numeric?(guess) && range.cover?(guess.to_i)
      print "Invalid guess. "
    end
  end

  def numeric?(input)
    input.to_i.to_s == input
  end

  def display_guess_result
    result = if guess > target_number
               "Your guess is too high."
             elsif guess < target_number
               "Your guess is too low."
             else
               "That's the number!"
             end
    puts result
  end

  def display_game_result
    result = if correctly_guessed? 
               "You won!"
             else
               "You have no more guesses. You lost!"
             end
    puts result
  end

  def correctly_guessed?
    guess == target_number
  end
end

game = GuessingGame.new(1, 1000)
game.play
game.play