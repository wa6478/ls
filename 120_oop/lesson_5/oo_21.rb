# nouns: player, dealer, participant, deck, hand
# verbs: hit, stay, busted?, deal, total, start, shuffle

# Participant
#   hit
#   stay
#   busted?
# Hand
#   show
#   value
# Deck
#   deal
#   shuffle
# Game
#   start
#   reset
#   finish
require 'pry'

class Participant
  attr_reader :hand, :type

  def initialize(type = 'computer')
    @hand = Hand.new
    @type = type
  end

  def hit
    if type == 'human'
      puts "1 to hit, 2 to stay"
      answer = nil

      loop do
        answer = gets.chomp.to_i
        break if [1, 2].include?(answer)
        puts "Invalid input, choose 1 or 2"
      end

      puts "-----"
      answer == 1
    else
      hand.value < 17
    end
  end

  def hit?
    !!hit
  end

  def busted?
    hand.value > 21
  end

  def to_s
    if type == 'computer'
      'Dealer'
    else
      'Your'
    end
  end
end

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def <<(card)
    cards << card
  end

  def value
    sum = 0

    cards.each do |card|
      sum += card.value unless card.value == 11
    end

    cards.each do |card|
      if card.value == 11
        sum += if sum + card.value > 21
                 1
               else
                 card.value
               end
      end
    end

    sum
  end

  def show_cards
    cards.map(&:card)
  end
end

class Deck
  SET = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  SUITS = %w[♥ ♠ ♦ ♣]
  CARDS = SET.product(SUITS).map(&:join)

  attr_reader :cards

  def initialize
    @cards = CARDS.map { |card| Card.new(card) }
  end

  def shuffle
    cards.shuffle!
  end
end

class Card
  LOOKUP = %w[2 3 4 5 6 7 8 9 1 J Q K A] # change 10 to 1 for lookup
  VALUE = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
  CARD_VALUES = LOOKUP.zip(VALUE).to_h

  attr_reader :card

  def initialize(card)
    @card = card
  end

  def value
    CARD_VALUES[card[0]]
  end
end

class Game
  attr_reader :deck, :player, :dealer

  def initialize
    @player = Participant.new('human')
    @dealer = Participant.new
    @deck = Deck.new
  end

  def play
    display_welcome_message
    game_setup
    loop do
      turn(player)
      break if player.busted?
      turn(dealer)
      break
    end
    show_result
    display_goodbye_message
  end

  private

  def display_welcome_message
    system 'clear'
    puts "----- ♥ ♠ ♦ ♣ 21 ♥ ♠ ♦ ♣ -----".center(50)
    puts "Welcome to 21.".center(50)
    puts "You couldn't lose money here even if you wanted to.".center(50)
    puts "Only your time.".center(50)
    puts "----- ♥ ♠ ♦ ♣ 21 ♥ ♠ ♦ ♣ -----".center(50)
    puts ""
    puts "Press enter to begin"
    gets.chomp
  end

  def display_goodbye_message
    puts "Thanks for playing! ♥ ♠ ♦ ♣"
  end

  def deal_card(participant)
    participant.hand << deck.cards.pop
  end

  def last_card_dealt(participant)
    participant.hand.show_cards.last
  end

  def turn(participant)
    case participant.type
    when 'computer'
      puts "Dealer flips second card."
    when 'human'
      puts "The dealer is showing #{last_card_dealt(dealer)}"
    end

    loop do
      puts "#{participant} hand is #{show_hand_and_value(participant)}"
      participant.hit? ? deal_card(participant) : break
      puts "Hit... #{last_card_dealt(participant)}"
      break if participant.busted?
    end
  end

  def show_hand_and_value(participant)
    "#{participant.hand.show_cards.join(', ')}. (#{participant.hand.value})"
  end

  def game_setup
    deck.shuffle
    2.times do
      deal_card(player)
      deal_card(dealer)
    end
  end

  # rubocop:disable Metrics/AbcSize
  def show_result
    if player.busted?
      puts "Busted! You lose!"
      puts show_hand_and_value(player)
    elsif dealer.busted?
      puts "Dealer busted! You win!"
      puts show_hand_and_value(dealer)
    elsif player.hand.value > dealer.hand.value
      puts "You won!"
    elsif dealer.hand.value > player.hand.value
      puts "You lost!"
    else
      puts "It's a tie!"
    end
  end
  # enable:disable Metrics/AbcSize
end

Game.new.play
