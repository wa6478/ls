set = %w[2 3 4 5 6 7 8 9 10 J Q K A]
lookup = %w[2 3 4 5 6 7 8 9 1 J Q K A] # change 10 to 1 for lookup
value = %w[2 3 4 5 6 7 8 9 10 10 10 10 11]
suits = %w[♥ ♠ ♦ ♣]
DECK = set.product(suits).map!(&:join)
VALUES = lookup.zip(value).to_h
MAX = 21 # max score before bust
DEALER_MIN = 17 # minimum score dealer has to reach
MIN_DECK = 20 # minimum size of deck before reshuffle
ROUNDS = 5 # rounds to win

def prompt(msg)
  puts "=> #{msg}"
end

def deal!(deck, player_hand, dealer_hand)
  2.times do
    player_hand << deck.pop
    dealer_hand << deck.pop
  end
end

def bust?(score)
  score > MAX
end

def ace?(card)
  card[0] == 'A'
end

def card_value(card)
  VALUES[card[0]].to_i
end

def score(hand)
  sum = 0

  hand.each do |card| # value without aces
    sum += card_value(card) unless ace?(card)
  end

  hand.each do |card| # value of aces
    if ace?(card) && bust?(sum + card_value(card))
      sum += 1
    elsif ace?(card)
      sum += card_value(card)
    end
  end

  sum
end

def hit!(deck, hand)
  hand << deck.pop
  prompt "Hit... #{hand[-1]}"
end

def find_winner(player_score, dealer_score)
  case player_score <=> dealer_score
  when 1 then 'Player'
  when 0 then 'Tie'
  when -1 then 'Dealer'
  end
end

def declare_winner(winner, player_hand, dealer_hand, player_score, dealer_score)
  case winner
  when 'Player'
    prompt "Player wins!"
    prompt "Player #{show_hand(player_hand, player_score)} vs. "
    prompt "Dealer #{show_hand(dealer_hand, dealer_score)}"
  when 'Tie'
    prompt "Push..."
    prompt "Player #{show_hand(player_hand, player_score)} vs. "
    prompt "Dealer #{show_hand(dealer_hand, dealer_score)}"
  else 'Dealer'
    prompt "Dealer wins!"
    prompt "Dealer #{show_hand(dealer_hand, dealer_score)} vs. "
    prompt "Player #{show_hand(player_hand, player_score)}"
  end
end

def show_hand(hand, score)
  "#{hand.join(', ')} (#{score})"
end

def play_again?
  prompt "Play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def continue
  prompt "Press enter to continue"
  answer = gets.chomp
  answer
end

puts ""
puts "----- ♥ ♠ ♦ ♣ 21 ♥ ♠ ♦ ♣ -----".center(50)
puts "Welcome to 21.".center(50)
puts "You couldn't lose money here even if you wanted to.".center(50)
puts "First to win five games wins it all.".center(50)
puts "----- ♥ ♠ ♦ ♣ 21 ♥ ♠ ♦ ♣ -----".center(50)
puts ""

# initialize counters and deck
player_win_count = 0
dealer_win_count = 0
game_count = 0
deck = DECK.shuffle
prompt "Shuffling the deck... "

loop do # game loop
  # game count, stats
  if game_count > 0
    prompt "The current win count is:"
    prompt "Player #{player_win_count}: Dealer #{dealer_win_count}"
    prompt "#{game_count} games played."
  end
  game_count += 1

  # check for winner of 5 matches
  if player_win_count == ROUNDS || dealer_win_count == ROUNDS
    if player_win_count == ROUNDS
      prompt "Player won #{ROUNDS} games! Resetting scores..."
    else
      prompt "Dealer won #{ROUNDS} games! Resetting scores..."
    end
    player_win_count = 0
    dealer_win_count = 0
  end

  # shuffle deck?
  if deck.size < MIN_DECK
    deck = DECK.shuffle
    prompt "Under 20 cards left in the deck. Playing with a new deck."
  end

  # initializing hands
  player_hand = []
  dealer_hand = []
  player_bust = false
  dealer_bust = false
  deal!(deck, player_hand, dealer_hand)
  player_score = score(player_hand)
  dealer_score = score(dealer_hand)

  prompt "Your hand is #{show_hand(player_hand, player_score)}."
  prompt "Dealer is showing #{dealer_hand[1]}"

  # player turn
  loop do
    prompt "Hit or stay? ('h' to hit, 's' to stay)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('h')

    hit!(deck, player_hand)
    player_score = score(player_hand)
    if bust?(player_score)
      prompt "Bust! #{show_hand(player_hand, player_score)}."
      player_bust = true
      break
    end

    prompt "Your hand is #{show_hand(player_hand, player_score)}."
  end

  # check if busted, update win_count, play again?
  if player_bust == true
    dealer_win_count += 1
    play_again? ? next : break
  end

  # dealer turn
  prompt "Dealer turn..."
  prompt "Dealer flips second card... #{dealer_hand[0]}"

  loop do
    prompt "Dealer hand is #{show_hand(dealer_hand, dealer_score)}."
    continue # give player chance to pause

    if dealer_score < DEALER_MIN
      prompt "Under 17... Dealer hits"
      hit!(deck, dealer_hand)
      dealer_score = score(dealer_hand)
    elsif bust?(dealer_score)
      prompt "Dealer busted!"
      dealer_bust = true
      break
    else
      prompt "Dealer stays."
      break
    end
  end

  # check if busted, update win count, play again?
  if dealer_bust == true
    player_win_count += 1
    play_again? ? next : break
  end

  # find winner and increment win counts
  winner = find_winner(player_score, dealer_score)
  case winner
  when 'Player' then player_win_count += 1
  when 'Dealer' then dealer_win_count += 1
  end

  # declare winner, play again?
  declare_winner(winner, player_hand, dealer_hand, player_score, dealer_score)
  break unless play_again?
end

prompt "Total of #{game_count} games played."
prompt "Thanks for playing 21 with us today."
