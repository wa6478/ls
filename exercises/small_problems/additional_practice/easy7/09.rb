# Give us your feedback
# Multiply Lists

# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

# Examples:

# - input: two arrays
#   - each array contains list of numbers
#   - arrays are the same size i.e. contain the same number of elements
# - output: new array that contains the product of each pair of numbers of elements in the passed arrays that share the same index

# - algo:
#   - since arrays are same size, take size of first array with times loop to provide index
#   - use #with_object and pass the result of operation to the array
#   - multiply item from arr1[index] * arr2[index]
  
def multiply_list(arr1, arr2)
  arr1.size.times.with_object([]) { |idx, output| output << arr1[idx] * arr2[idx] }
end

# can #map with index

def multiply_list(arr1, arr2)
  arr1.map.with_index { |el, idx| el * arr2[idx] }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]