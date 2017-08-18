# Exercise 13

# Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically according to the numeric value of the odd integers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

out = arr.sort_by do |elem|
        elem.select { |num| num.odd? }
      end
# The sorted array should look like this:
p out
[[1, 8, 3], [1, 6, 7], [1, 4, 9]]