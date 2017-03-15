# What is your name? Bob
# Hello Bob.
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

# ----- first attempt -----

# puts "What is your name?"
# name = gets.chomp

# if name.include?("!")
#   puts "hello #{name}. why are we screaming?".upcase
# else
#   puts "hello #{name}.".capitalize
# end 

# ----- further ----- exploration


puts "What is your name?"
name = gets.chomp!

if name.include?("!")
  puts "hello #{name}. why are we screaming?".upcase
else
  puts "hello #{name}.".capitalize
end 
