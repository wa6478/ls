class OrangeTree
  def initialize(name = "Orangey")
    @name = name
    @maxage = rand(1..30)
    @height = 0
    @age = 0
    @fruit = 0
  end
  
  def one_year_passes
    @age += 1
    @height += rand(1..20)
    @fruit = @age / 4 * rand(10..20) + rand(1..5)
    if @age == @maxage
      puts "#{@name} the orange tree was a good tree, and he passed with dignity. It's hard to make it as an orange tree."
      exit
    end
    puts "#{@name} the orange tree is #{@age} years old, is #{@height} cms tall, and bore #{@fruit} oranges this year"
  end
  
  def count_the_oranges
    puts "There are #{@fruit} oranges on the tree."
  end
  
  def pick_an_orange
    if @fruit > 0
      @fruit -= 1
      puts "You pluck a delicious orange from #{@name} the orange tree."
    else
      puts "There is no fruit on the tree!"
    end
  end
  
  def height
    puts "#{@name} is #{@height} cm tall."
  end
  
end

puts "Welcome to orange tree simulator."
puts "Please name your orange tree"
name = gets.chomp
tree = OrangeTree.new(name)

while true
  puts "What would you like to do with your tree?"
  puts "Check its [height], [count] the oranges, [pick] a fruit, let a year [pass], or [quit]"
  action = gets.chomp.downcase
  case action
  when "height" then tree.height
  when "count"  then tree.count_the_oranges
  when "pick"   then tree.pick_an_orange
  when "pass"   then tree.one_year_passes
  when "quit"   then break
  else puts "please enter a command from within the brackets"
  end

end