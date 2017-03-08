#method to capture names and return the number of characters in the name


puts "What's your first name?"
first = gets.chomp
puts "What's your middle name?"
middle = gets.chomp
puts "What's your last name?"
last = gets.chomp

letters_in_name = first.length + middle.length + last.length

puts "Your name has #{letters_in_name} letters in it."