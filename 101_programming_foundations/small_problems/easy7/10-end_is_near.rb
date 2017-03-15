# The End is Near But Not Here

# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

# Examples:

def penultimate(string)
  string.split[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'

# middle word returner

def middle(string)
  return '' if string.empty?
  words = string.split
  slice_spot = -words.count / 2
  words.slice(slice_spot)
end

puts middle('hi there friend') == 'there'
puts middle('what is up sir') == 'up' #edge here being the middle of an even numbered sentence
puts middle('one') == 'one'
puts middle('') == ''