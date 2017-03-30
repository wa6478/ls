# Multiply All Pairs

# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

# Examples:

# - input: two array arguments
#   - each array is list of numbers
#   - neither argument is an empty array
# - output: new array
#   - contains the product of every pair of numbers that can be formed between the elements of the two arrays
#   - result sorted in order of increasing value
  
# - algo:
#   - output array
#   - call each on arr1
#   - call each on each element in arr2
#   - multiply el from arr1 with el in arr2 and pass result to output
#   - return output sorted
  
# - algo-alt:
#   - #product of arr1, arr2, and call inject on each
#   - output

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |pairs| pairs.inject(:*) }.sort
end

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |a, b| a * b }.sort
end

# def multiply_all_pairs(arr1, arr2)
#   output = []
#   arr1.each do |num1|
#     arr2.each do |num2|
#       output << num1 * num2
#     end
#   end
#   output.sort
# end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]