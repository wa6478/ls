# Leading Substrings

# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

# Examples:

# - input: string
# - output: array of strings
#   - consist of all substrings that start at index 0 of original string
#   - should be sorted from shortest to longest substring
  
# - can use index or count to grab the required number of chars

# - algo:
#   - initialize an array
#   - iterate over string using 0...string.size
#   - push current string into the array
#   - order that I'm doing this in will by definition be shortest to longest
#   - return the array
  
def substrings_at_start(string)
  output = []
  (1..string.size).each do |count|
    output << string[0, count]
  end
  output
end

def substrings_at_start(string)
  (1..string.size).each.with_object([]) { |count, arr| arr << string[0, count] }
end


puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']