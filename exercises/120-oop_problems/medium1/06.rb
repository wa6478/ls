# Number Guesser Part 1

# Create an object-oriented number guessing class for numbers in the range 1 to 100, with a maximum limit of 7 guesses per game. The game should play like this:

class PingGame
  RANGE = (1..100)
  GUESSES = 7
  # when writing a program with multiple messages, consider having a hash or other data structures that has all your messages in it

  def play
    reset
    loop do
      break if @guesses == 0 || @win == true
      status_message
      enter_number
      evaluation_message
    end
    lose_message if @guesses == 0 && @win == false
  end

  def reset
    @target_number = rand(RANGE)
    @guesses = GUESSES
    @guess = nil
    @win = false
  end

  def status_message
    puts "You have #{@guesses} guesses remaining."
  end

  def enter_number
    puts "Enter a number between #{RANGE.min} and #{RANGE.max}."

    loop do
      @guess = gets.chomp.to_i
      break if valid_number?
      puts "Invalid number. You must enter a number between 1 and 100."
    end

    @guesses -= 1
  end

  def valid_number?
    (RANGE).include?(@guess)
  end

  def evaluation_message
    case @guess
    when @target_number
      puts "#{@target_number} is the right guess! You win!"
      @win = true
    when RANGE.min...@target_number
      puts "Your guess is too low."
    when @target_number + 1..RANGE.max
      puts "Your guess is too high"
    end
  end

  def lose_message
    puts "You're out of guesses. You lose. The number was #{@target_number}."
  end
end

game = PingGame.new
game.play
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# You win!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low
# You are out of guesses. You lose.
# Note that a game object should start a new game with a new number to guess with each call to #play.