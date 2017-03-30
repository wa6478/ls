# All Substrings

# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the substrings_at_start method you wrote in the previous exercise:

# Examples:

# - input: string
# - output: array of strings
#   - consists of all substrings from each index, in the order of the starting index

# - observations
#   - can utilize substrings_at_start to determine all substrings from a given index
#   - since they are in sequential orders, expect that I can just shovel things into an array in order of processing the string from left to right
  
# - algo
# - use times on the string size to get my index for my substring
# - use with_object to provide my output array
# - call all substrings on the substring with my starting index
# - push into array provided by with_object

def substrings_at_start(string)
  (1..string.size).each.with_object([]) { |count, arr| arr << string[0, count] }
end

def substrings(string)
  string.size.times.with_object([]) { |idx, arr| arr << substrings_at_start(string[idx..-1]) }.flatten
end


puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]


