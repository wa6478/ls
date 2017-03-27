# Give us your feedback
# Sequence Count

# Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

# Examples:

# - input: two integers
#   - first is a count
#     - always value of 0 or greater
#   - second is first number of sequence that method will create
#     - can be any integer value
# - output: array
#   - same number of elements as count argument
#   - values of each element will be multiples of starting number
#   - if count is 0, return an empty array
#     - (guard clause necessary?)
    
# - algo
#   - multiple is index + 1 * starting value at each spot in index
#   - can just use a times loop
#   - going to use map for it's return value usefulness with a range
  
def sequence(count, start)
  (1..count).map { |count| count * start }
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []