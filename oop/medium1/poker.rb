require 'pry'
# Poker
# Use the Card and Deck classes to create and evaluate Poker hands.
# - Create a PokerHand class that takes 5 cards from a Deck of Cards and evaluates
#   those cards as a Poker hand.
# Types of Poker Hands (Best->Worst):
# - Royal Flush (A, K, Q, J, 10 of the same suit)
# - Straight Flush (5 cards of the same suit in rank sequence)
# - Four of a kind (4 cards of the same rank)
# - Full House (3 cards of one rank, 2 of another rank)
# - Flush (5 cards of the same suit)
# - Straight (5 cards in sequence (4, 5, 6, 7, 8) - ranks can be different)
# - Three of a kind (3 cards of the same rank)
# - Two pair (Two cards of one rank, two cards of another)
# - One pair (Two cards of the same rank)
# - High card (If no one has at least a pair, the highest-rank card wins)


# Include Card and Deck classes from the last two exercises.

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = initialize_shuffled_cards
  end
  
  def draw
    refill if cards.empty?
    cards.pop
  end

  private

  attr_accessor :cards

  def initialize_shuffled_cards
    RANKS.product(SUITS).map do |(rank, suit)|
      Card.new(rank, suit)
    end.shuffle
  end

  # Automatically refill if the last card is drawn
  def refill
    self.cards = initialize_shuffled_cards
  end
end

class Card
  include Comparable

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  
  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = calculate_value
  end

  def <=>(other)
    value <=> other.value
  end

  def to_s
    "#{rank} of #{suit}"
  end

  #protected attr_reader :value

  private

  def calculate_value
    VALUES.fetch(rank, rank)
  end
end

class PokerHand
  # Deck -> Draw 5 cards -> Hand
  # 
  def initialize(deck)
    @hand = initialize_hand(deck)
  end

  def print
    puts hand.join(', ')
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  attr_reader :hand

  def initialize_hand(deck)
    hand = []
    5.times { hand << deck.draw }
    hand.sort
  end

  # A, K, Q, J, 10 of the same suit
  def royal_flush?
    same_suits? &&
      hand.map(&:rank) == [10, 'Jack', 'Queen', 'King', 'Ace']
  end

  # 5 cards in sequence (by rank) of the same suit
  def straight_flush?
    same_suits? &&
      in_sequence?
  end

  # 4 cards of the same rank (suit does not matter)
  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  # 3 cards of one rank + 2 of another rank
  def full_house?
    n_of_a_kind?(3) && n_of_a_kind?(2)
  end

  # 5 cards of the same suit
  def flush?
    same_suits?
  end

  # 5 cards in sequence eg. (4, 5, 6, 7, 8); ranks are not the same
  def straight?
    in_sequence?
  end

  # 3 cards of the same rank
  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def two_pair?
    count_card_ranks.count { |_k, v| v == 2 } == 2
  end

  def pair?
    n_of_a_kind?(2)
  end

  # Helper Methods
  def same_suits?
    hand.map(&:suit).uniq.one?
  end

  def in_sequence?
    first_value = hand.first.value

    hand[1..-1].all? do |card|
      card.value == first_value += 1
    end
  end

  def count_card_ranks
    hand.each_with_object(Hash.new(0)) do |card, card_ranks|
      card_ranks[card.rank] += 1
    end
  end

  def n_of_a_kind?(n)
    count_card_ranks.any? { |_k, v| v == n }
  end
end

# Test Cases:
hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

# Further Exploration
# How would you modify this class if you wanted the individual hand classification
# methods (eg. royal_flush?, straight?, etc.) to be public -class- methods
# that work with an Array of 5 cards?

# eg. 
# def self.royal_flush?(cards)
#   ...
# end
# PokerHand.royal_flush(<array of 5 cards>)

# - This wouldn't change our solution much - we would just need to convert our 
#   methods into class methods, and pass around the array of cards instead of
#   being able to rely on a @hand instance variable.


# Further Exploration #2
# How would you modify the original solution to choose the best hand between 
# two poker hands?
# eg. PokerHand.best_hand(PokerHand.new(..), PokerHand.new(...))
# => Returns the higher-scoring hand.
# Perhaps we could keep an internal ranking of Poker hands 
#   eg. { royal_flush: 10, straight_flush: 9, ... }
# Then compare the two Poker Hands based on how they score.
#   eg. def <=>(other)
#         RANKING[evaluate] <=> RANKING[other.evaluate]
#         # evaluate returns a string describing the poker hand; then we just
#         # retrieve the corresponding score for that hand from RANKING
#       end
# With comparison of Poker Hand objects implemented, we can simply return the 
#   #max of the two given PokerHands.


# Further Exploration #3
# How would you modify the original solution to choose the best 5-card hand from
#   a 7-card hand?
# - We would have to modify some methods to account for the fact that @hand is no 
#   longer guaranteed to be 5 cards.
# eg. 
# royal_flush?
# - Group @hand based on suits -> { 'Hearts' => [...], 'Spades' => [...], etc. }
# - Determine whether there are any suit arrays that are:
#   1) At least 5 cards 
#   2) In sequence
#   * When only the cards that are 10 or above are selected from that suit array.

# straight_flush?
# - Determine whether there are any suit arrays that are:
#   1) At least 5 cards
#   2) In sequence

# flush?
# - Determine whether there are any suit arrays that are:
#   1) 5 cards in size

# straight?
# - Determine if there are any 5 cards that are in sequence
#   - Sort @hand
#   - Create contiguous subarrays of length 5 from @hand
#   - Determine whether any subarray of cards is in sequence
