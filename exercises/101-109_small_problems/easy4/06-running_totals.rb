# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

# def running_total(array)
#   # return [] if array.empty? # so don't actually need this, the each iterator called on an empty array won't iterate anything (plus doesn't throw a nil value sort of exception), so our original empty array will stay empty
#   sum = 0
#   running_array = []

#   array.each do |elem|
#     sum += elem
#     running_array << sum
#   end

#   running_array
# end

# could have made this easier with map instead of each

# def running_total(array)
#   sum = 0
#   array.map { |elem| sum += elem }
# end

# further exploration

# Enumerable#inject

# def running_total(array)
#   running_array = []
#   array.each_index { |idx| running_array << array[0..idx].inject(&:+) }
#   running_array
# end

# Array#each_with_object
# Documentation:
# each_with_object(obj) { |(*args), memo_obj| ... } → obj click to toggle source
# each_with_object(obj) → an_enumerator
# Iterates the given block for each element with an arbitrary object given, and returns the initially given object.

# def running_total(array)
#   array.each_with_object([]) do |elem, running| 
#     if running.empty?
#       running << elem
#     else
#       running << elem + running[-1]
#     end
#   end
# end

# what I'm trying to do here is to say, take whatever the current element is plus the sum of the new array "running" so far

# alternative of that (to get rid of the IF/ELSE logic by not having a starting sum)

# def running_total(input_array)
#   sum = 0
#   input_array.each_with_object([]) { |elem, output_array| output_array << sum += elem }
# end

# another way yet:

# def running_total(input_array)
#   input_array.each_with_object([]) { |elem, output_array| output_array << elem + output_array.last.to_i }
# end

# wow ok! can use #to_i on nil to make it be 0. this could be useful in lots of situations where I have a pesky nil at the beginning or end

# another way without using the Enumerable#each iterator (by getting the total first and working backwards with what's left)

def running_total(input_array)
  running = []
  return running if input_array.empty?
  input_array.size.times do # this works because my output array is same size as input
    running << input_array.inject(&:+) # could use unshift, but I like the shovel.
    input_array.pop
  end
  running.reverse # reversing output because I didn't use unshift above
end

# Examples:

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []


# in: n element array, out: array with same # of elements as in
# what if array is empty? just pass empty
# algo: each element should be added to a running total so far
# so as we iterate through the array we should keep track of the sum so far to determine the value to store in the new array