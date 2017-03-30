# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# def oddities(array)
#   output_array = []
#   array.each_with_index do |elem, idx|
#     output_array << elem if idx.even?
#   end
#   output_array
# end

# alternate 1

# def oddities(array)
#   odd_elements = []
#   index = 0
#   while index < array.size
#     odd_elements << array[index]
#     index += 2
#   end
#   odd_elements
# end

# alternate 2

# def oddities(array)
#   odd_elements = []
#   array.size.times do |idx| # if you tell times to do something 5 times, it  will iterate through 0 to 4 (total of 5), so this is helpful for mapping to an index)
#     odd_elements.push(array[idx]) if idx.even?
#   end
#   odd_elements
# end

# alternate 3

# def oddities(array)
#   array.select.with_index { |elem, idx| idx.even? } 
# end

# with_index appears to be a bit more flexible method to append an index to several iterators that might not normally have them (like #select). Maybe should start using #each.with_index instead just to get into the habit of utilizing this one. Advantage is also that you can offset the initial index by passing an argument (i.e. with_index(2), and it starts the index count off at 2 (while still iterating through each element))

# alternate 4

def oddities(array)
  array.select { |elem| array.index(elem).even? } # wonder if this index method works by looking up the object? what if there are two of the same numbers in an arrya?
end

# from the documentation: Returns the index of the first object in ary such that the object is == to obj. So yea this won't work for cases where the array has multiple of the same objects
# also found in the documentation is rindex, which returns the index of the first object from the right that matches the argument. 

# Examples:

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

=begin
understand the problem
- input
  - given an array of objects
    - need to be able to iterate through this input to pull out odd objects
- output
  - every other element in the original array, starting with index 0 (which actually means even numbers at the index level)

=end
puts "----- even alternate -----"


def evenities(array)
  even_elements = []
  array.size.times do |idx| # if you tell times to do something 5 times, it  will iterate through 0 to 4 (total of 5), so this is helpful for mapping to an index)
    even_elements.push(array[idx]) if idx.odd?
  end
  even_elements
end

# Examples:

puts evenities([2, 3, 4, 5, 6]) == [3, 5]
puts evenities(['abc', 'def']) == ['def']
puts evenities([123]) == []
puts evenities([]) == []