# Rotation (Part 3)

# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

# Example:

# - in: integer
# - out: integer that has been maximally rotated

# - maximal rotation
#   - 1. rotate the entire number
#   - 2. keep the first digit in place, and rotate the rest of the number
#   - 3. keep the first 2 digits in place, and rotate the rest of the number
#   - ...
#   - 4. when you reach the final 2 digits, rotate those two, then return the number to get the maximally rotated number
  
# - algo:
#   - size of number as array (chars) down to 2
#   - this will pass to the block, the number I need to pass to n in the rightmost method
#     - in each iteration of the block
#       - set number = result of calling rightmost with n
#   - return number

def rotate_array(array)
  array[1..-1] << array[0]
end

def rotate_rightmost_digits(number, n)
  numbers_to_rotate = number.to_s.chars
  right = rotate_array(numbers_to_rotate[-n, n])
  left = numbers_to_rotate[0...-n]
  left.concat(right).join.to_i
end

def max_rotation(number)
  number.to_s.size.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  
  number
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845