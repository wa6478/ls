# All Substrings

# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the substrings_at_start method you wrote in the previous exercise:

# Examples:

# in: 'string'
# out: array of strings
#   - contains all substrings of input string
#   - ordered by initial index (all substrings starting at 0, then 1, etc.)
#   - substrings should be ordered from shortest to longest

def substrings(string)
  arr = (0..string.chop.size).map do |idx|
          (idx..string.chop.size).map do |idx2|
            string[idx..idx2]
          end
        end
  arr.flatten
end

# really using same as above just using helper method instead

def subsubstrings(string)
  string.size <= 1 ? [string] : [*subsubstrings(string.chop), string]
end

def substrings(string)
  (0..string.chop.size).map do |idx|
    subsubstrings(string[idx..-1]) 
  end.flatten
end

# alternate with helper method using upto instead of a range, and with_object instead of map

def substrings(string)
  0.upto(string.chop.size).with_object([]) do |idx, arr|
    arr.concat(subsubstrings(string[idx..-1]))
  end
end

# really I should just use the previous method as a helper method and then just iterate through each index per usual

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]