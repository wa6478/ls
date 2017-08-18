class Dragon
  
  def initialize(name)
    @name = name
    @asleep = false
    @stuff_in_belly = 10 #he's full
    @stuff_in_intestine = 0 #doesn't need to go
    
    puts "#{name}, the dragon, is born."
  end
  
  def feed
    puts "You feed #{@name}."
    @stuff_in_belly = 10
    passage_of_time
  end
  
  def walk
    puts "You walk #{@name}."
    @stuff_in_intestine = 0
    passage_of_time
  end
  
  def put_to_bed
    puts "You put #{@name} to bed."
    @asleep = true
    3.times do
      if @asleep
        passage_of_time
      end
      if @asleep
        puts "#{@name} snores filling the room with smoke"
      end
    end
    if @asleep
      @asleep = false
      puts "#{@name} wakes up slowly"
    end
  end
  
  def toss
    puts "You toss #{@name} into the air"
    puts "He giggles, which singes your eyebrows"
    passage_of_time
  end
    
  def rock
    puts "You rock #{@name} gently"
    @asleep = true
    puts "He briefly dozes off..."
    passage_of_time
    if @asleep
      @asleep = false
      puts "... but wakes when you stop"
    end
  end

  private

  def hungry?
    @stuff_in_belly < 3
  end
  
  def poopy?
    @stuff_in_intestine > 7
  end
  
  def passage_of_time
    if @stuff_in_belly > 0 #move food to intestine
      @stuff_in_belly -= 1
      @stuff_in_intestine +=1
    else #dragon is starving
      if @asleep
        @asleep = false
        puts "He wakes up suddenly!"
      end
      puts "#{@name} is starving, in desperation he ate you!"
      exit
    end
    
    if @stuff_in_intestine > 9
      @stuff_in_intestine = 0
      puts "Whoops! #{@name} had an accident"
    end
    
    if hungry?
      if @asleep
        @asleep = false
        puts "He wakes up suddenly!"
      end
      puts "#{@name}'s stomach grumbles..."
    end
    
    if poopy?
      if @asleep
        @asleep = false
        puts "He wakes up suddenly!"
      end
      puts "#{@name} does the potty dance..."
    end
  end
  
end

puts "Welcome to the Baby Dragon simulator"
puts "Please enter a name for the baby"
name = gets.chomp
pet = Dragon.new(name)

while true
  puts "What would you like to do?"
  puts "feed | walk | toss | rock | bed | quit"
  action = gets.chomp.downcase
  case action
  when "feed" then pet.feed
  when "walk" then pet.walk
  when "toss" then pet.toss
  when "rock" then pet.rock
  when "bed"  then pet.put_to_bed
  when "quit" then break
  else puts "what would you like to do?"
  end
end

puts "You have ended the dragon simulator"
  
