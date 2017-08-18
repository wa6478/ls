# this version has a separate class for each move
# feels unnecessarily cumbersome... perhaps because there isn't a lot that a given move needs to accomplish
# part of it also may be that the infrastructure in place already had a Move class which was being pulled a certain way
# and to make it initialize to the different moves meant I couldn't easily use it's initialize method and so on since I don't want the individual moves to be initialized to anything other than themselves
# also building out a method for each move to see if it beats a couple of other moves seemed repetitive
# I think the reason why putting all of these into the Move class in the first place is that the behaviors are similar enough that we don't need to further parse them into additional classes
# that just ends up adding additional layers of having to create to_s methods and the other scaffolding that a new class needs just to be called somewhat usefully by the rest of the code
# so in this case, no it wasn't a good design decision
# perhaps if it was built from the ground up to use those separate classes there may be some usefulness there, but I am skeptical

class Move
  VALUES = %w(rock paper scissors lizard spock)
  attr_reader :value
  
  def initialize(value)
    @value = case value
             when 'rock'
               Rock.new
             when 'paper'
               Paper.new
             when 'scissors'
               Scissors.new
             when 'lizard'
               Lizard.new
             when 'spock'
               Spock.new
             end
  end

  def >(other_move)
    @value.beats?(other_move.value)
  end

  def to_s
    @value.to_s
  end
end

class Rock
  def initialize
    @name = 'rock'  
  end
  
  def to_s
    @name
  end
  
  def beats?(move)
    move.to_s == 'scissors' || move.to_s == 'lizard'
  end
end

class Paper
  def initialize
    @name = 'paper'  
  end
  
  def to_s
    @name
  end
  
  def beats?(move)
    move.to_s == 'rock' || move.to_s == 'spock'
  end
  
end

class Scissors
  def initialize
    @name = 'scissors'  
  end
  
  def to_s
    @name
  end
  
  def beats?(move)
    binding.pry
    move.to_s == 'paper' || move.to_s == 'lizard'
  end
end

class Lizard
  def initialize
    @name = 'lizard'  
  end
  
  def to_s
    @name
  end
  
  def beats?(move)
    move.to_s == 'paper' || move.to_s == 'spock'
  end
end

class Spock
  def initialize
    @name = 'spock'  
  end
  
  def to_s
    @name
  end
  
  def beats?(move)
    move.to_s == 'rock' || move.to_s == 'scissors'
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
