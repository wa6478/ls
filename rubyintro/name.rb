puts "Hi there, what's your name?"
name = gets.chomp
puts "Hi #{name}, so very nice to meet you."

10.times { puts name }

puts "Hi there, what's your first name?"
first_name = gets.chomp
puts "And your last?"
last_name = gets.chomp
name = first_name + " " + last_name
puts "Hi #{name}, so very nice to meet you."