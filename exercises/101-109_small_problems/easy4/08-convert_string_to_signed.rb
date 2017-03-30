# Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

# You may assume the string will always contain a valid number.

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

# def string_to_signed_integer(str)
#   signature = ['+', '-']
#   signature.include?(str[0]) ? digits_only = str[1..-1] : digits_only = str
#   digits = digits_only.chars.map { |elem| DIGITS[elem] }

#   value = 0
#   digits.each { |digit| value = value * 10 + digit }
#   str[0] == '-' ? -value : value
# end

# suppose that the easier alternative would have been to simply call on the original method rather than modifying it

# let's try that:

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
  '9' => 9
}

def string_to_integer(str)
  digits = str.chars.map { |elem| DIGITS[elem] }

  value = 0
  digits.each { |digit| value = value * 10 + digit }
  value
end

# def string_to_signed_integer(str)
#   case str[0]
#   when '-' then -string_to_integer(str[1..-1])
#   when '+' then string_to_integer(str[1..-1])
#   else          string_to_integer(str)
#   end
# end

# further exploration: only call once

def string_to_signed_integer(str)
  string_to_pass = (str[0] == '+') || (str[0] == '-') ? str[1..-1] : str
  value = string_to_integer(string_to_pass)
  str[0] == '-' ? -value : value
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100