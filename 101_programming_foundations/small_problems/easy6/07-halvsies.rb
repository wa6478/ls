# Halvsies

# Write a method that takes an Array as an argument, and returns two Arrays that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

# in: one array
# out: array with two nested arrays (the first one being the bigger one if the original was odd)
# algo: 
# set up result array
# loop over input and shift -> push objects into a new subarray while the index is less than original array.length / 2
# push subarray into result array
# push remaining original array into result array
# since if the result is odd the second chunk will be longer, present result reversed (or maybe not depending on how I set up the loop break condition)

def halvsies(array)
  length = array.length
  return [[], []] if array.empty?
  first_half = []
  until first_half.length.to_f >= length / 2.0
    first_half << array.shift
  end
  [first_half, array]
end

# this took forever because I struggled with calibrating the break condition to work with odd number of arrays. I think I overcomplicated it to be honest. Think it would have been faster if I had stepped back for a second to try and actually understand what was happening.

# although the solution also used a float to figure out the break point for an odd numbered array, so at least the core intuition wasn't necessarily off



puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]