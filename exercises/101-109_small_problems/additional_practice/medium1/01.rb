# Rotation (Part 1)

# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# Example:

# - in: array
#   - that the original array should not be modified
# - out: array
#   - have the first element of input array as its last element
# - do not use Array#rotate

# - algo
#   - initialize a new array for my output
#   - initialize output equal the slice from the original array, that is the second element to the last element + the first element
#     - will slicing it this way break it for one or two elements?
#   - return the output array

def rotate_array(array)
  array[1..-1] << array[0]
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true