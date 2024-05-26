# Highest/Lowest Ranking Cards
# Update this class so you can use it to determine the lowest- and highest-ranking
# cards in an Array of Card objects:

# class Card
#   attr_reader :rank, :suit

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end
# end

# Rules:
# Numeric cards are worth 2-10. Jacks are higher than 10s, Queens are higher 
#   than Jacks, Kings are higher than Queens, and Aces are higher than Kings.
#   - Suit does not matter
# If you have two+ cards of the same value, your #min/#max methods should return
#   one of the matching cards (doesn't matter which one)

# Also create a #to_s method that returns a String representation of the card
#   eg. Jack of Diamonds

# Need to define a way of comparing cards
# - Value based on rank
# - Calculate value: If rank is 2-10, value = rank; otherwise, J = 11, Q = 12, 
#   K = 13, A = 14 (?)
# Then just compare based on value

# eg.
class Card
  include Comparable

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  HIERARCHY = { 'Spades' => 1, 'Hearts' => 2, 'Clubs' => 3, 'Diamonds' => 4 }
  
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = calculate_value
  end

  def <=>(other)
    if value == other.value
      HIERARCHY[other.suit] <=> HIERARCHY[suit]
    else
      value <=> other.value
    end
  end

  def to_s
    "#{rank} of #{suit}"
  end

  protected attr_reader :value

  private

  def calculate_value
    VALUES.fetch(rank, rank)
  end
end

# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8

# Further Exploration: 
# Assume you're playing a game in which cards are also scored based on
#   suit. 
# eg. 4 Spades > 4 Hearts > 4 Clubs > 4 Diamonds
# but 5 Diamonds > 4 Spades
# SUIT_HIERARCHY = [Spades, Hearts, Clubs, Diamonds]

cards = [Card.new(4, 'Diamonds'),
         Card.new(4, 'Spades'), 
         Card.new(5, 'Diamonds')]
puts cards
puts cards.min == Card.new(4, 'Diamonds')
puts cards.max == Card.new(5, 'Diamonds')

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min == Card.new(8, 'Diamonds')
puts cards.max == Card.new(8, 'Spades')