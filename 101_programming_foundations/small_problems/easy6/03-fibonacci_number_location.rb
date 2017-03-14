# Fibonacci Number Location By Length

# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

# Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

# You may assume that the argument is always greater than or equal to 2.

# in: an integer that represents the first fibonacci number that has that many digits
# out: an integer that represents the INDEX of the fibonacci number that matches the above criteria
#  (The first Fibonacci number has index 1.) << need to adjust output for this
# data structure: going to use a hash since we will want to return the index, although we may want to keep track of the index externally (although is there an index method I could call to see what the index is? there is, and it's called Array#index)
# as fibonacci is calculating, we can pass a check on the current iteration to see if it matches the above criteria (but how to compare the digits count of an integer? need to do string conversion)
#   - need to set up the fibonacci calculation first, initialize with [1, 1]

# if the above doesn't work, could probably do something based on the number of times the loop has calculated and keeping track of the calculation counter

# def find_fibonacci_index_by_length(target_length)
#   fibonacci = [1, 1]
#   index = 1
#   while fibonacci[index].to_s.length < target_length
#     fibonacci << fibonacci[-2] + fibonacci[-1]
#     index += 1
#   end
#   index + 1
# end

# alternate without keeping track of an array

def find_fibonacci_index_by_length(target_length)
  first = 1
  second = 1
  index = 2

  loop do
    break if second.to_s.length >= target_length
    fibonacci = first + second
    first = second
    second = fibonacci
    index += 1
  end

  index
end


puts find_fibonacci_index_by_length(2) == 7
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
