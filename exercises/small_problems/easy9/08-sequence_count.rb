# Sequence Count

# Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

# Examples:

def sequence(count, num)
  1.upto(count).with_object([]) { |count, arr| arr << count * num }
end

def sequence(count, num)
  1.upto(count).map { |count| count * num }
end

def sequence(count, num)
  (1..count).map { |count| count * num }
end

# instead of upto or downto, using a range object or reversed range object and iterating over that seems to be the cleaner or terser option in lots of cases

# better know a few methods and classes really well and know how to use them well than to know a ton of different methods

# being able to think clearly with the tools you have trumps having a massive toolkit you're not that familiar with


puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []