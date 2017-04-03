# Find Missing Numbers

# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

# Examples:

# in: array of integers
# out: array of integers
  # includes all numbers between the first and last element in the Array argument that are not part of the Array argument
# initialize empty array
# from first element upto last element, check if that element is part of original array
# if not, move into initialized array

def missing(numbers)
  missed = []
  numbers.first.upto(numbers.last) do |num|
    missed << num unless numbers.include?(num)
  end
  missed
end

def missing(numbers)
  (numbers.min..numbers.max).to_a - numbers
end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []