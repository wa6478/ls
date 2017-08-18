# Write a method that takes in an integer `num` and returns the sum of
# all integers between zero and num, up to and including `num`.
#
# Difficulty: easy.

# in: integer
# out: integer (sum of all integers between zero and num)
# - can probably use a range object, and call in inject/reduce on it


def sum_nums(num)
  (0..num).inject(:+)
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts('sum_nums(1) == 1: ' + (sum_nums(1) == 1).to_s)
puts('sum_nums(2) == 3: ' + (sum_nums(2) == 3).to_s)
puts('sum_nums(3) == 6: ' + (sum_nums(3) == 6).to_s)
puts('sum_nums(4) == 10: ' + (sum_nums(4) == 10).to_s)
puts('sum_nums(5) == 15: ' + (sum_nums(5) == 15).to_s)
