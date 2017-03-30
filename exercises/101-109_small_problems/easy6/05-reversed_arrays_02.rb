
# 101-109 - Small ProblemsEasy 6Reversed Arrays (Part 2)
# Reversed Arrays (Part 2)

# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

# Examples:

# def reverse(array)
#   reversed_result = []
#   array.size.times do |index|
#     reversed_result.unshift(array[index])
#   end
#   reversed_result
# end

# each with object

# def reverse(array)
#   array.each_with_object([]) { |item, arr| arr.unshift(item) }
# end

# using map (not map!) and using just the index to return a new array

def reverse(array)
  array.map.with_index { |elem, idx| array[-idx-1] } # this works because for each element it's assigning it the opposite position from the original array, and map then returns those elements as a new array without destroying the original array
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b c d e)) == %w(e d c b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 2, 3]                     # => true
puts new_list == [3, 2, 1]                 # => true