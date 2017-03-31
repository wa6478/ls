require 'pry'

# Poker!

# In the previous two exercises, you developed a Card class and a Deck class. You are now going to use those classes to create and evaluate poker hands. Create a class, PokerHand, that takes 5 cards from a Deck of Cards and evaluates those cards as a Poker hand.

# You should build your class using the following code skeleton:

# Include Card and Deck classes from the last two exercises.

class Card
  include Comparable

  VALUES = (1..13).to_a
  CARDS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
  CARD_RANK = CARDS.zip(VALUES).to_h

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    value <=> other_card.value
  end

  def value
    CARD_RANK[rank.to_s]
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  attr_reader :cards

  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def reset
    @cards = RANKS.product(SUITS).map { |rank, suit| Card.new(rank, suit)}
    @cards.shuffle!
  end

  def draw
    reset if @cards.count == 0
    @cards.pop
  end
end

class PokerHand
  def initialize(deck)
    @hand = deck[-5..-1]
    @rank_count = Hash.new(0)

    @hand.size.times do |card|
      @rank_count[@hand[card].rank] += 1
    end
  end

  def print
    @hand.each { |card| puts card }
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

  def flush?
    @hand.all? { |card| @hand.first.suit == card.suit }
  end

  def straight?
    return false if @rank_count.values.any? { |count| count > 1 }
    @hand.min.value == @hand.max.value - 4
  end

  def royal_flush?
    ranks = %w[Ace King Queen Jack] + [10]
    flush? && @hand.all? { |card| ranks.include?(card.rank) }
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    @rank_count.values.any? { |count| count == 4}
  end

  def full_house?
    full_house = [2, 3]
    @rank_count.values.sort == full_house
  end

  def three_of_a_kind?
    @rank_count.values.any? { |count| count == 3}
  end

  def two_pair?
    two_pair = [1, 2, 2]
    @rank_count.values.sort == two_pair
  end

  def pair?
    @rank_count.values.any? { |count| count == 2}
  end
end

# Testing your class:

hand = PokerHand.new(Deck.new.cards)
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
puts "Royal flush"
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts "Straight flush"
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts "Four of a kind"
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts "Full house"
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts "Flush"
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts "Straight"
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts "Three of a kind"
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts "Two pair"
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts "Pair"
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts "High card"
puts hand.evaluate == 'High card'
# Output:

# 5 of Clubs
# 7 of Diamonds
# Ace of Hearts
# 7 of Clubs
# 5 of Spades
# Two pair
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# The exact cards and the type of hand will vary with each run.