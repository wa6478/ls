# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

puts ">> Name please"
name = gets.chomp
# name = "Teddy" if name == "" # going to try alternative with String#empty? method
name = "Teddy" if name.empty?

# puts "#{name}'s age is #{rand(20..200)}!"

# alternative to rand would be to sample... I know it would work on an array but I wonder if it would work on a range... let's try

# puts "#{name}'s age is #{(20..200).sample}!"

# nope that doesn't work. will just convert the range to an array first then.

puts "#{name}'s age is #{(20..200).to_a.sample}!"

# so that's two ways to check an empty string "" and String#empty?, and two ways to get a random number from a range