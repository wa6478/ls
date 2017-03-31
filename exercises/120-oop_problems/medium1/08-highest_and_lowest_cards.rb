# Highest and Lowest Ranking Cards

# Modify this class:

# think I want to include comparable, should give me min max methods
# just need to define <=>
# want hash of values by rank to feed the comparator method

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
    CARD_RANK[rank.to_s] <=> CARD_RANK[other_card.rank.to_s]
  end

  def to_s
    "#{rank} of #{suit}"
  end
end
# so that you can determine the lowest ranking and highest ranking Cards in an Array. For the purposes of this exercise, numeric cards are low cards, ordered from 2 through 10. Jacks are higher than 10s, Queens are higher than Jacks, Kings are higher than Queens, and Aces are higher than Kings. The suit plays no part in the relative ranking of cards.

# If you have 2 or more cards of the same rank in your list, your min and max methods should return exactly one of the matching cards; it doesn't matter which one is returned.

# In addition to any methods needed to determine the minimum and maximum, also create a #to_s method that converts cards to Strings of the form "Jack of Diamonds", "4 of Clubs", etc.

# Examples:

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8

# Output:

# 2 of Hearts
# 10 of Diamonds
# Ace of Clubs
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