# Convert a Number to a String!

# In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

# in: integer
# out: string that matches the order of the integers put in
# # model:
#  - can't use standard conversion methods, to_s, String(), format
#  - need to do it by analyzing and manipulating the number
#  - so I think approach can be similar to last one, using a hash dictionary for lookup, just in reverse
#  - missing step: how to perform the lookup? loop with modulo % 10 to get the last digit, then divide the number by 10
#  - and then just pushing the looked up values into the output string

# DIGITS = (0..9).to_a.zip(('0'..'9').to_a).to_h

# def integer_to_string(number)
#   number_string = ""
#   loop do
#     last_digit = number % 10
#     number_string << DIGITS[last_digit]
#     number /= 10
#     break if number == 0
#   end
#   number_string.reverse # need to reverse since we are shoveling rather than unshifting << actually can't unshift a string!! have to use String#prepend instead
# end

# solution uses an array which makes sense, since index is already a list of integers...
# and uses divmode to set the number and remainder, (rather than modulo 10 and % 10 which makes sense, but uses the same break condition)
# fundamentally the same answer, just cleaner implementation than above

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


puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'