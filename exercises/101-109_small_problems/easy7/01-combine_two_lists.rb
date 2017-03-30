# Combine Two Lists

# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

# Example:

def interleave(arr1, arr2)
  result = []
  arr1.size.times do |idx|
    result << arr1[idx]
    result << arr2[idx]
  end
  result
end

# with zip

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

# transpose which assumes an array of arrays which I can pass with a splat argument

def interleave(*arrays)
  arrays.transpose.flatten
end

# each with index on next level 

def interleave(arr1, arr2)
  arr1.each.with_object([]).with_index { |(e, result), idx| result << e << arr2[idx] }
end


puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']