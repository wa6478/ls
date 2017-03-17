require 'pry'
require 'byebug'

BLANK = ' '
PLAYER = 'X'
COMPUTER = 'O'
FIRST = 'choose' # or 'computer' or 'choose'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
# rubocop:disable Style/ConditionalAssignment
def joinor(array, delimiter=', ', last='or ')
  result = ''
  array.size.times do |idx|
    if idx == array.size - 1
      if array.size < 2
        result << array[idx].to_s
      else
        result << last + array[idx].to_s
      end
    else
      result << array[idx].to_s + delimiter
    end
  end
  result
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER}. Computer is #{COMPUTER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Style/ConditionalAssignment

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = BLANK }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == BLANK }
end

def sweet_spot(brd, player)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(player) == 2 &&
      line.select { |pos| brd[pos] == BLANK }[0] != nil
      return line.select { |pos| brd[pos] == BLANK }[0]
    end
  end
  nil
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry that's not a valid choice"
  end

  brd[square] = PLAYER
end

def computer_places_piece!(brd)
  square = nil
  square = sweet_spot(brd, COMPUTER) # offense first, play to win!
  square = sweet_spot(brd, PLAYER) if square == nil
  square = 5 if brd[5] == BLANK
  square = empty_squares(brd).sample if square == nil
  brd[square] = COMPUTER
end

def player_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # *line passes each element of an array within a block
    if brd.values_at(*line).count(PLAYER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER) == 3
      return 'Computer'
    end
  end
  nil
end

def alternate_player(current_player)
  if current_player == 'player'
    current_player = 'computer'
  else
    current_player = 'player'
  end
end

player_wins = 0
computer_wins = 0

loop do
  board = initialize_board

  if FIRST == 'choose'
    prompt "Do you want to go first? (y or n)"
    start_answer = gets.chomp
    if start_answer.downcase.start_with?('y')
      current_player = 'player' 
    else
      current_player = 'computer'
    end
  else
    current_player = FIRST
  end

  loop do
    display_board(board)
    player_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    detect_winner(board) == 'Computer' ? computer_wins += 1 : player_wins += 1
    prompt "The score is Player #{player_wins} : Computer #{computer_wins}"
  else
    prompt "It's a tie!"
    prompt "The score is Player #{player_wins} : Computer #{computer_wins}"
  end

  prompt "Press any key to continue"
  answer = gets.chomp

  if player_wins >= 5 || computer_wins >= 5
    prompt "Good job, you won." if player_wins >= 5
    prompt "The computer randomly defeated you." if computer_wins >= 5
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
    player_wins = 0
    computer_wins = 0
  end
end

prompt "Thanks for playing the beautiful game(TM)"
