# Always Return Negative

# Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

# Examples;

# in: integer
# out: integer
#   - if positive return negative
#   - if 0 or negative, return original number
  
# algo:
#   - if num > 0
#   - then num * - 1
#   - else num
  
def negative(num)
  num *= -1 if num > 0
  num
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0      # There's no such thing as -0 in rubyputs 