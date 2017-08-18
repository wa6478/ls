# Write a method that takes in two numbers. Return the greatest
# integer that evenly divides both numbers. You may wish to use the
# `%` modulo operation.
#
# Difficulty: medium.

# in: two integers
# out: integer that represents the greatest common factor
# - what is a factor?
# - a factor is a number that a number can be evenly divided by
# - test: number % factor == 0 IF TRUE then factor, ELSE not
# - if I have two numbers, the largest possible factor can be the smaller of the two numbers
# - so starting with the smallest number, working down to 1, check if it's a factor for both, if true, return
# - by definition by going from largest to smallest, the first number for which this returns true, will be the largest common factor

def greatest_common_factor(number1, number2)
  number1 <= number2 ? start = number1 : start = number2

  start.downto(1) do |factor|
    return factor if number1 % factor == 0 && number2 % factor == 0
  end
end

# not as clean, but using a range
def greatest_common_factor(number1, number2)
  number1 <= number2 ? start = number1 : start = number2

  (1..start).to_a.reverse.each do |factor|
    return factor if number1 % factor == 0 && number2 % factor == 0
  end
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'greatest_common_factor(3, 9) == 3: ' +
  (greatest_common_factor(3, 9) == 3).to_s
)
puts(
  'greatest_common_factor(16, 24) == 8: ' +
  (greatest_common_factor(16, 24) == 8).to_s
)
puts(
  'greatest_common_factor(3, 5) == 1: ' +
  (greatest_common_factor(3, 5) == 1).to_s
)
