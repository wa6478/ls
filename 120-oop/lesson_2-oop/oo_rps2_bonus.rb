class Move
  VALUES = %w(rock paper scissors lizard spock)
  VICTORY_TABLE = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['paper', 'spock'],
    'spock' => ['rock', 'scissors']
  }
  
  def initialize(value)
    @value = value
  end

  def >(other_move)
    VICTORY_TABLE["#{self}"].include?("#{other_move}")
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    self.score = 0
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose #{Move::VALUES.join(', ')}:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    self.human = Human.new
    self.computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to #{Move::VALUES.join(', ')}!"
  end

  def display_goodbye_message
    puts "Thanks for playing #{Move::VALUES.join(', ')}. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      human.score += 1
    elsif computer.move > human.move
      puts "#{computer.name} won!"
      computer.score += 1
    else
      puts "Tie!"
    end
  end
  
  def display_score
    puts "Score #{human.name} #{human.score}: #{computer.name} #{computer.score}"
    if human.score == 10
      puts "#{human.name} won 10 rounds and wins it all!"
      human.score = 0
      computer.score = 0
    elsif computer.score == 10
      puts "#{computer.name} won 10 rounds and wins it all!"
      human.score = 0
      computer.score = 0
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if %w[y n].include?(answer.downcase)
      puts "Sorry, must be y or n"
    end

    answer.downcase == 'y'
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      display_score
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play

# rubocop:disable all

# Compare this design with the one in the previous assignment:

# is this design, with Human and Computer sub-classes, better? Why, or why not?
  # prefer the sub classes because it removes the conditional logic which I could see become cumbersome to always evaluate especially when dealing with much larger code projects
# what is the primary improvement of this new design?
  # the primary improvement is aligning the fundamentally different type of action the computer and the human undertake into their own unique subclasses and avoiding a bunch of conditional to make them work within one class
# what is the primary drawback of this new design?
  # primary drawback is that there is some duplication in terms of the methods, e.g. there's a choose method for both the computer class and the human class
  
# Compare this design (refactoring of display winner logic) with the one in the previous assignment:

# what is the primary improvement of this new design?
  # cleans up the conditional logic by using the properties of the new Move object instead of just relying on the result of the move method from the Player's class
  # makes the intention of the program a little more easy to read (perhaps not so much for a program of this size, but if this program was much larger, could definitely see that)
# what is the primary drawback of this new design?
  # the logic in this case wasn't that complex and not sure it warranted being abstracted into its own class, so in a way, in this particular instance it may have been a little more than necessary
  
# the tradeoff for flexibility is indirection (like modularizing my financial models)
# the more flexible your code via classes, the more indirection is introduced
# so finding that right balance is part of the design process
