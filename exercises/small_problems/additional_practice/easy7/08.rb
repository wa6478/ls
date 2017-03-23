# Multiplicative Average

# Write a method that takes an Array of integers as input, multiplies all of the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places.

# Examples

# input: array of integers
# output: float rounded to 3 decimal places
# - multiply all numbers in input array together
# - divide by number of entries in array
# - print the result rounded to 3 decimal places

# - algo:
# - use #inject on the input array and divide by array #size converted to a float and save output as variable
# - use Kernel#format to format the output to 3 decimal places format('%.3f', argument)

def show_multiplicative_average(array)
  output = array.inject(:*) / array.size.to_f
  puts "The result is #{format("%.3f", output)}"
end

puts show_multiplicative_average([3, 5])
# The result is 7.500

puts show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667