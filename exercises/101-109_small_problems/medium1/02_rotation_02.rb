# Rotation (Part 2)

# Write a method that can rotate the last n digits of a number. For example:

def rotate_array(arr)
  first, *rest = arr
  [*rest, first]
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end

def rotate_rightmost_digits(num, digits)
  (num.to_s[0..(-digits - 1)] + rotate_string(num.to_s[-digits..-1])).to_i
end

def rotate_rightmost_digits(num, digits)
  left_string = num.to_s[0..(-digits - 1)]
  right_string = num.to_s[-digits..-1]
  result = left_string + rotate_string(right_string)
  result.to_i
end

def rotate_rightmost_digits(num, digits)
  all_digits = num.to_s
  all_digits[-digits..-1] = rotate_string(all_digits[-digits..-1])
  all_digits.to_i
end


puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917

# Note that rotating just 1 digit results in the original number being returned.

# You may use the rotate_array method from the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.