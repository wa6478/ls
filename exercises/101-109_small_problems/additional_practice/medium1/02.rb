# Rotation (Part 2)

# Write a method that can rotate the last n digits of a number. For example:

# Note that rotating just 1 digit results in the original number being returned.

# You may use the rotate_array method from the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.

# - in: two arguments: an integer to rotate, and an integer of n last digits to rotate
#     - assume valid input
# - out: the rotated integer
#   - if n equal to 1, then the output would be the same as the initial integer to rotate

# - going to need a string to manipulate
# - going to need to turn that string into an array, to manipulate certain elements

# - algo:
#   - convert integer to string
#   - convert string chars to array
#   - right chunk of [-n, n]
#   - left chunk of [0...-n]
#   - rotate_array on the chunk
#   - combine left chunk with rotated right chunk
#   - join the array into a string
#   - convert the string into an integer and RETURN this value

def rotate_array(array)
  array[1..-1] << array[0]
end

def rotate_rightmost_digits(number, n)
  numbers_to_rotate = number.to_s.chars
  right = rotate_array(numbers_to_rotate[-n, n])
  left = numbers_to_rotate[0...-n]
  left.concat(right).join.to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
