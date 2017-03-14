# Reversed Arrays (Part 1)

# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed in to this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

# so couple of challenges here
# 1 is how to functionally operate on the array to reverse it
# 2 is how to do that while mutating the original object
#   2 is tricky because I suspect that if I use any non-mutating methods, I'll be served up a new object
# so my "in" is an array and "out" is an array
# I know push, pop, etc. are destructive, so that should allow me to move things around on the original object
# so I'm thinking of iterating through indexes in reverse using [-1] etc., then using push / pop to reorganize
# whats the core mechanic though?
# if I just do a shift push I'll end up where i started
# can use insert method to precisely tell it where to put things
# as long as that keeps counting down the number of times I have elements in my object, should work
# def reverser!(array)
#   index = -1
#   array.size.times do 
#     array.insert(index, array.shift)
#     index -= 1
#   end
#   array
# end

# alternate with value swaps from either side

def reverser!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

list = [1,2,3,4]
result = reverser!(list) # => [4,3,2,1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

list = %w(a b c d e)
reverser!(list) # => ["e", "d", "c", "b", "a"]
puts list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverser!(list) # => ["abc"]
puts list == ["abc"]

list = []
reverser!([]) # => []
puts list == []