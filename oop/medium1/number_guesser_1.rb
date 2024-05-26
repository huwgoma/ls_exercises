# Number Guesser (1)
# Create an OO number-guessing class for numbers 1-100, with a limit of 7
# guesses per game.

class GuessingGame
  GUESS_LIMIT = 7
  GUESS_RANGE = (1..100)

  def initialize
    @guess_count = 0
    @target_number = rand(GUESS_RANGE.max)
    @guess = nil
  end

  def play
    loop do
      puts "You have #{remaining_guess_count} guesses remaining."
      
      self.guess = prompt_guess.to_i
      self.guess_count += 1
      display_guess_result

      break if correctly_guessed? || out_of_guesses?

      puts "\n"
    end
    display_game_result
  end

  private

  attr_reader :target_number 
  attr_accessor :guess_count, :guess

  def remaining_guess_count
    GUESS_LIMIT - guess_count
  end

  def prompt_guess
    loop do
      print "Enter a number between #{GUESS_RANGE.min} and #{GUESS_RANGE.max}: "
      guess = gets.chomp
      return guess if numeric?(guess) && GUESS_RANGE.cover?(guess.to_i)
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

  def out_of_guesses?
    remaining_guess_count.zero?
  end

  def correctly_guessed?
    guess == target_number
  end
end

game = GuessingGame.new
game.play
