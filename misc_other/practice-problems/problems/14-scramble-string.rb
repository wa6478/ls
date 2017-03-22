# Write a method that takes in a string and an array of indices in the
# string. Produce a new string, which contains letters from the input
# string in the order specified by the indices of the array of indices.
#
# Difficulty: medium.

# in: string and array of indices in the string
# out: new string, containing letters from the input string, in the order specified by the array of indices
# - appears that array size is equal to the string length
# - initialize a new string
# - iterate through the array, calling the letter from the passed string at the current el (which is an index)
# - return the new string

def scramble_string(string, positions)
  result = ''
  positions.each do |idx|
    result << string[idx]
  end
  result
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'scramble_string("abcd", [3, 1, 2, 0]) == "dbca": ' +
  (scramble_string("abcd", [3, 1, 2, 0]) == "dbca").to_s
)
puts(
  'scramble_string("markov", [5, 3, 1, 4, 2, 0]) == "vkaorm"): ' +
  (scramble_string("markov", [5, 3, 1, 4, 2, 0]) == "vkaorm").to_s
)
