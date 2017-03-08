class Dice
  
  def initialize
    roll
  end
  
  def roll
    @numbershowing = rand(1..6)
  end
  
  def showing
    @numbershowing
  end
  
  def cheat
    puts "What number do you want to show?"
    @numbershowing = gets.chomp
  end
  
end

die = Dice.new
puts die.showing
puts die.cheat
puts die.showing