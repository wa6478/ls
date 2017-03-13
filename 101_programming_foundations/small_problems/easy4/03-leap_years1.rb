# In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.

# def leap_year?(year)
#   case
#   when year % 400 == 0 then true
#   when year % 100 == 0 then false
#   when year % 4 == 0 then true
#   else
#     false
#   end
# end

# above works because it goes from least to most common cases, and that if the least common case is true, the other cases are by definition also true (400 is divisible 100 and 4, etc.)

# -- further exploration, with tests in reverse order --- ""
# not going to write out, but for each if on the more common cases, I would have to have nested ifs to check for the less common cases still possible, so it would be inherently more complex

# although just one of the answers, which use sort of negative logic to accomplish the reverse order... let me try it

def leap_year?(year)
  case
  when year % 4 != 0 then false
  when year % 100 != 0 then true # this works because what hits this stage by definition is already divisible by four. 
  when year % 400 == 0 then true
  else
    false
  end
end

# this method may actually be more computationally efficient because the first test that evaluates to false screens out most numbers from going any further. I think this partially only works though because each common condition must be true for a later condition to even be possible to evaluate

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true