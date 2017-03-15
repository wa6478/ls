def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

# Write a program that requests two integers from the user, adds them together, and then displays the result. Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.

# Do not check for positive/negative requirement until after both integers are entered, and start over if the requirement is not met.

integer1 = nil
integer2 = nil

loop do
  puts "please provide two integers, one positive and one negative"
  puts ">> first integer, please"
  integer1 = gets.chomp
  puts ">> second integer, please"
  integer2 = gets.chomp
  if ( valid_number?(integer1) && valid_number?(integer2) ) && 
    (integer1.to_i * integer2.to_i) < 0
    break
  end
  puts "oops something went wrong, make sure you have one positive and one negative integer (order doesn't matter)"
end

puts "#{integer1} plus #{integer2} equal #{integer1.to_i + integer2.to_i}"