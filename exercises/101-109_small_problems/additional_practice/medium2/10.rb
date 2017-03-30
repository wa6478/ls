# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

# Examples:

# in: integer
# out: integer
#   - square of the sum of integers (1...n)**2 - sum of the squares of integers (1**2..n**2)

def sum_square_difference(num)
  integers = (1..num).to_a
  integers.reduce(:+)**2 - integers.reduce(0) { |sum, n| sum += n**2 }
end

puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150