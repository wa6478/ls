# Combine Two Lists

# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

# Example:

# input: two arrays
#   non-empty
#   both arrays have the same number of elements
# output: one array, consisting of the elements from the input inserted in alternating fashion from the passed arrays
# algorithm:
#   using Array#zip is one option
#   alternatively, since the arrays are the same size, can use a shared index to populate a new array with the element at the index for the passed arrays

# with zip

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

# shared index approach

def interleave(arr1, arr2)
  arr1.size.times.with_object([]) do |idx, arr|
    arr.concat([arr1[idx], arr2[idx]])
  end
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']