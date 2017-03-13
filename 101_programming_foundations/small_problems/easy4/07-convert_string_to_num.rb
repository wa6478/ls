# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_int and Integer behave similarly. In this exercise, you are going to create your own conversion method.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

#understand
# in: a string of numbers
# out: an integer that is the same as the string
# algo: (can't use built in methods)
#   need a "dictionary" of number strings to their corresponding integers for 0-9
#   then split my string and use each or map for a lookup of its corresponding integer value
#   then how do I get my array into a integer? (so far I've only gotten my string of numbers into an array of integers)
#   could do like, count the size of the array, and create a "1000th" place kind of tracker, that is divided by 10 for each iteration of the array to correctly be able to add the numbers together


# def int_lookup(str)
#   num_strings       = ("0".."9").to_a
#   num_integers      = (0..9).to_a
#   number_dictionary = Hash.new(0)
  
#   num_strings.each.with_index do |number, idx|
#     number_dictionary[number] = num_integers[idx]
#   end
  
#   number_dictionary[str]
# end
# while I was busy coming up with a special "automatic way" of coming up with the dictionary, the solution just hard keys it out -- which is probably the more time efficient way tbh. If you know exactly what it's supposed to look like, might as well spend the minute hammering it out rather than worrying about testing more code. Also the solution sets this dictionary as a constant, which I think is also cleaner

# def string_to_integer(str)
#   array_of_number_strings = str.chars
#   array_of_integers = array_of_number_strings.map { |num_str| int_lookup(num_str) }
#   place = 10**array_of_integers.size # number of places (will be one power to but we will divide)
#   sum = 0
#   array_of_integers.each { |int| sum += (int * (place /= 10))} 
#   # add the integer for its corresponding place and move the place marker
#   sum
# end

# the solution also has a much more elegant way of finding the correct place
# it just uses whatever the latest number is, multiplies it by 10 and adds the latest integer. so clean.

# alright I'm gonna try to rewrite this in a cleaner way

# DIGITS = {
#   '0' => 0,
#   '1' => 1,
#   '2' => 2, 
#   '3' => 3,
#   '4' => 4,
#   '5' => 5,
#   '6' => 6,
#   '7' => 7,
#   '8' => 8,
#   '9' => 9
# }

# def string_to_integer(str)
#   digits = str.chars.map { |elem| DIGITS[elem] }

#   value = 0
#   digits.each { |digit| value = value * 10 + digit }
#   value
# end

# puts string_to_integer('4321') == 4321
# puts string_to_integer('570') == 570
# puts string_to_integer('0') == 0
# puts string_to_integer('10000000000') == 10000000000

# further exploration: hexadecimal
# so a hexadecimal is base 16, and therefore it has a bit longer dictionary
# although my hunch is that I can get to a similar place just by creating the new dictionary with all of the hexadecimal values, and multiplying by 16 instead of 10 (since it's base 16)
# I would assume that's correct, let me test that

DIGITS = {
  '0' => 0,
  '1' => 1,
  '2' => 2, 
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'a' => 10,
  'b' => 11,
  'c' => 12,
  'd' => 13,
  'e' => 14,
  'f' => 15
}

def hex_to_integer(str)
  digits = str.chars.map { |elem| DIGITS[elem.downcase] } #need downcase in case of capitals

  value = 0
  digits.each { |digit| value = value * 16 + digit }
  value
end

puts hex_to_integer('9') == 9
puts hex_to_integer('7DE') == 2014
puts hex_to_integer('7ffff') == 524287
puts hex_to_integer('abcd67') == 11259239
puts hex_to_integer('FF') == 255
puts hex_to_integer('AF3') == 2803
puts hex_to_integer('4D9f') == 19871




