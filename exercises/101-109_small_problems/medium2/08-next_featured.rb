# Next Featured Number Higher than a Given Value

# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.

# Examples:

# - odd number
# - multiple of 7
# - digits occur only once

# requirements
# - output is the next featured number greater than the argument
# - issue an error if there is no next featured number

def featured(num)
  num +=1 
  until num % 7 == 0 && num.odd?
    num += 1
  end

  loop do
    return num if num.to_s.chars.uniq == num.to_s.chars
    num += 14
    break if num >= 9_876_543_210
  end

  "Your quest is doomed. There is no featured number beyond these walls."
end



puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
puts featured(9_999_999_999)