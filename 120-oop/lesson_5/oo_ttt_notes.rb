# oo_ttt.rb

# 1. my own initial attempts prior to observing the answers

# Write a description of the problem and extract major nouns and verbs.

# tic tac toe is a game played by two players on a board.
# this board consists of a 3x3 grid.
# the players take turns marking one square on the grid
# the first player to mark 3 squares in a line (horizontally, vertically, or diagonally) wins
# if no player succeeds in marking 3 squares, it's a tie

# Make an initial guess at organizing the verbs into nouns and do a spike to explore the problem with temporary code.

# nouns: game, board, player, mark, turn, square
# verbs: play, mark

# Game
# Board
# Square
# Turn
# Player
# - mark
# - play

# Optional - when you have a better idea of the problem, model your thoughts into CRC cards.

class Game
  def initialize
    # this would be what holds the other pieces together
    # initializes a board, its squares, the players, (the turns?)
    # the orchestration engine
  end
end

class Board
  def initialize
    # would need to initialize some squares
    # set up a fresh board without marks and track board state
    # could have behaviors that identify a winner
    # what data structure to use? 
    # - array of arrays? square objects?
    # - array of integers?
  end
end

class Square
  def initialize
    # an individual square on a board
    # could have states such as blank, marked (and what kind of mark)
  end
end

class Turn
  def initialize
    # maybe this is more "take a turn" and more of a verb than a noun
  end
end

class Player
  def initialize
    # initialize a human or computer player
    # keep track of player stats such as scores or moves
    # maybe initialize what this particular's marker is
  end
  
  def mark
    # action of marking a specific square on the board
  end
  
  def play
    # does the player want to play another game?
  end
end
  
  