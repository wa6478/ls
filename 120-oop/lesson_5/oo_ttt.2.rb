class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +   # columns
                  [[1, 5, 9], [3, 5, 7]]                # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker) # good setter method if your dealing with collections
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      first_square = @squares[line.first]
      next if first_square.unmarked?
      if @squares.values_at(*line).all? do |square|
           square.marker == first_square.marker
         end
        return first_square.marker
      end
    end
    nil
  end

  def threat(marker)
    WINNING_LINES.each do |line|
      if @squares.values_at(*line).map(&:marker).count(marker) == 2 &&
         @squares.values_at(*line).any?(&:unmarked?)
        return line[@squares.values_at(*line).find_index(&:unmarked?)]
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  attr_accessor :score, :name

  def initialize(marker)
    @marker = marker
    reset_score
  end

  def reset_score
    self.score = 0
  end
end

class TTTgame
  FIRST_TO_MOVE = 'CHOOSE'
  ROUNDS = 3

  attr_reader :board, :human, :computer, :human_marker, :computer_marker

  def initialize
    @board = Board.new
    x_or_o
    @human = Player.new(human_marker)
    @computer = Player.new(computer_marker)
    @current_marker = FIRST_TO_MOVE
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def play
    refresh_screen
    display_welcome_message
    set_name

    loop do
      choose_first if FIRST_TO_MOVE == 'CHOOSE'
      display_board

      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end

      display_result
      display_score
      break unless play_again?
      reset
      display_play_again_message
    end

    display_goodbye_message
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize

  private

  def set_name
    puts "What's your name?"
    human.name = gets.chomp
    computer.name = %w[R2D2 Hal9000 Chappie Johnny].sample
    puts "Hi #{human.name}! Your opponent is #{computer.name}."
  end

  def x_or_o
    answer = nil
    loop do
      puts "Would you like to be X or O?"
      answer = gets.chomp
      break if %w[x o].include?(answer.downcase)
      puts "Invalid input. Please choose X or O."
    end
    if answer.downcase == 'x'
      @human_marker = 'X'
      @computer_marker = 'O'
    else
      @human_marker = 'O'
      @computer_marker = 'X'
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing. Bye!"
  end

  def display_board
    puts "#{human.name} is #{human.marker}. " \
         "#{computer.name} is #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    refresh_screen
    display_board
  end

  def join_or(array)
    return array.join if array.size == 1
    return "#{array[0]} or #{array[1]}" if array.size == 2
    array[0..-2].join(', ') + ", or #{array[-1]}"
  end

  def human_moves
    puts "Choose a square between (#{join_or(board.unmarked_keys)}):"

    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Invalid input. Try again."
    end

    board[square] = human.marker
  end

  def computer_moves
    move = if board.threat(computer_marker)
             board.threat(computer_marker)
           elsif board.threat(human_marker)
             board.threat(human_marker)
           elsif board.unmarked_keys.include?(5)
             5
           else
             board.unmarked_keys.sample
           end

    board[move] = computer.marker
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human_marker
      puts "#{human.name} won!"
      human.score += 1
    when computer_marker
      puts "#{computer.name} won!"
      computer.score += 1
    else
      puts "It's a tie!"
    end
  end

  # rubocop:disable Metrics/AbcSize
  def display_score
    if human.score == 3
      puts "#{human.name} won it all! You won #{ROUNDS} rounds!"
      human.reset_score
      computer.reset_score
    elsif computer.score == 3
      puts "#{computer.name} won it all! They won #{ROUNDS} rounds before you did!"
      human.reset_score
      computer.reset_score
    else
      puts "Current Score: (first to #{ROUNDS} wins)"
      puts "#{human.name} #{human.score}: #{computer.name} #{computer.score}"
    end
  end
  # rubocop:enable Metrics/AbcSize

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again (y/n)"
      answer = gets.chomp.downcase
      break if %w[y n].include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def refresh_screen
    system 'clear'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    refresh_screen
  end

  def display_play_again_message
    puts "Let's play again!"
  end

  def choose_first
    answer = nil
    loop do
      puts "Who goes first? 1: #{human.name}, 2: #{computer.name}"
      answer = gets.chomp.to_i
      break if [1, 2].include?(answer)
      puts "Invalid input. Choose 1 or 2."
    end

    @current_marker = human_marker if answer == 1
    @current_marker = computer_marker if answer == 2
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer_marker
    else
      computer_moves
      @current_marker = human_marker
    end
  end

  def human_turn?
    @current_marker == human_marker
  end
end

game = TTTgame.new
game.play
