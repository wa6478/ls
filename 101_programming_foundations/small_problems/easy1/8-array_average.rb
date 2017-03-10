# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.

def average(array_of_integers)
  array_of_integers.map.inject(&:+) / array_of_integers.size
end


# Examples:

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# with floats


def average(array_of_integers)
  array_of_integers.map(&:to_f).inject(&:+) / array_of_integers.size # denominator here doesn't need to also be a float. appears that ruby will do a float operation as long as one of the numbers is a float
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52]) 

# although if that is true...

def average(numbers)
  numbers.inject(&:+) / numbers.size.to_f # denominator here doesn't need to also be a float. appears that ruby will do a float operation as long as one of the numbers is a float
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52]) 