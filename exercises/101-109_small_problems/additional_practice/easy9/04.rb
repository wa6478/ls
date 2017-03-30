# Counting Up

# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

# Examples:

# in: integer
#   - always a valid integer, > 0
# out: array 
#   - all integers between 1 and the input integer in sequence
  
# algo:
#   - create range 1..input
#   - call map on that range, returning each element in the block
  
def sequence(num)
  (1..num).map { |n| n }
end

# definitely overthought that...

def sequence(num)
  (1..num).to_a
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]