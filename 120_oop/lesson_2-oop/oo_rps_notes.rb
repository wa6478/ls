# The game flow should go like this:

# the user makes a choice
# the computer makes a choice
# the winner is displayed

# The classical approach to object oriented programming is:

# 1. Write a textual description of the problem or exercise.
# 2. Extract the major nouns and verbs from the description.
# 3. Organize and associate the verbs with the nouns.
# 4. The nouns are the classes and the verbs are the behaviors or methods.

# Notice that in OO, we don't think about the game flow logic at all. It's all about organizing and modularizing the code into a cohesive structure - classes. After we come up with the initial class definitions, the final step is to orchestrate the flow of the program using objects instantiated from the classes. We won't worry about that final step yet.

# *1* textual description
# first attempt textual description of RPS:
# RPS is a game player by two players
# The players each make a choice from rock < paper < scissors (rock beats scissors)
# If the players chose the same object, it's a draw
# If it's a different object, one of the players wins based on the above logic

# From lesson: 

# Rock, Paper, Scissors is a two-player game where each player chooses
# one of three possible moves: rock, paper, or scissors. The chosen moves
# will then be compared to see who wins, according to the following rules:

# - rock beats scissors
# - scissors beats paper
# - paper beats rock

# If the players chose the same move, then it's a tie.

# *2* extract major nouns and verbs
# Nouns: player, move, rule
# Verbs: choose, compare

# *3* organize verbs with the nouns
# Player # nouns are the classes
# - choose # verbs are the behaviors or words
# Move # no verbs for Move or Rule
# Rule
#
# - compare # no noun associated with this for now

# this is the initial rough napkin modeling of the problem
# makes sense for there to be lots of unanswered questions at this point

class Player
  def initialize
    # initialize a name? a move?
  end
  
  def choose
    
  end
end

class Move
  def initialize
     # need something to keep track
     # a move object can be 'paper' 'rock' 'scissors'
  end
end

class Rule
  def initialize
    # not sure what state should a rule object be
  end
end

# not sure where compare goes yet (maybe Move?)
def compare(move1, move2)
  
end

# Orchestration Engine!!!!!

RPSGame.new.play

class RPSGame
  attr_accessor :human, :computer
  
  def initialize
    self.human = Player.new
    self.computer = Player.new
  end
  
  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    display_goodbye_message
  end
end


