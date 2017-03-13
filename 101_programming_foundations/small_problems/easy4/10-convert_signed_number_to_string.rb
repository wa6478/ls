# In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

# input: integer with an optional +, -
# - how to address +, -?
# - can run a check on > < 0 to flag which signature should be added to the end
# output: string that matches input, including +. -
# model: can use the logic from last, 
#        just need to flip negative numbers perhaps as part of the lookup

DIGITS = ('0'..'9').to_a

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(number)
  case 
  when number > 0 then '+' + integer_to_string(number)
  when number < 0 then '-' + integer_to_string(number * -1)
  else '0'
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'