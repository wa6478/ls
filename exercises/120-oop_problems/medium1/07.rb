class PingGame
  GUESSES = 7
  def initialize(min, max)
    @range = (min..max)
  end

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
    @target_number = rand(@range)
    @guesses = Math.log2(@range.max - @range.min).to_i + 1
    @guess = nil
    @win = false
  end

  def status_message
    puts "You have #{@guesses} guesses remaining."
  end

  def enter_number
    puts "Enter a number between #{@range.min} and #{@range.max}."

    loop do
      @guess = gets.chomp.to_i
      break if valid_number?
      puts "Invalid number. You must enter a number between 1 and 100."
    end

    @guesses -= 1
  end

  def valid_number?
    (@range).include?(@guess)
  end

  def evaluation_message
    case @guess
    when @target_number
      puts "#{@target_number} is the right guess! You win!"
      @win = true
    when @range.min...@target_number
      puts "Your guess is too low."
    when @target_number + 1..@range.max
      puts "Your guess is too high"
    end
  end

  def lose_message
    puts "You're out of guesses. You lose. The number was #{@target_number}."
  end
end

game = PingGame.new(1,1500)
game.play
