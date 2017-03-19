# Rotation (Part 1)

# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# Example:

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_array(arr)
  arr[1..-1].concat([arr.first])
end

# further exploration

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integers(int)
  rotate_string(int.to_s).to_i
end

puts rotate_string('hello')
puts rotate_integers(12345)

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true