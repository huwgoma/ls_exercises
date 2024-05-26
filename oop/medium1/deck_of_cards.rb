# Use the Card class from the previous exercise and create a Deck class that
# contains all standard 52 cards.

# Reqs:
# - Deck should have a #draw method to draw and deal one card.
# - When the deck is initialized, it should shuffle itself
# - If the deck runs out of cards, it should reset itself by generating a new
#   set of 52 shuffled cards.

# Use the following code to start:

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
  
  attr_reader :rank, :suit

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

  protected attr_reader :value

  private

  def calculate_value
    VALUES.fetch(rank, rank)
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.