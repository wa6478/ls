# Write a method that takes in a string. Your method should return the
# most common letter in the array, and a count of how many times it
# appears.
#
# Difficulty: medium.

# in: string
# out: two element array, consisting of a string of the most common char, and the integer count of that char within the passed string
# - create an array of uniq chars
# - initialize each in the output array
# - and if any of the letters beat the current letter in the output, reassign the output

def most_common_letter(string)
  most_common = ''
  most_common_count = 0

  string.chars.uniq.each do |char|
    if string.count(char) > most_common_count
      most_common = char
      most_common_count = string.count(char)
    end
  end

  [most_common, most_common_count]
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'most_common_letter("abca") == ["a", 2]: ' +
  (most_common_letter('abca') == ['a', 2]).to_s
)
puts(
  'most_common_letter("abbab") == ["b", 3]: ' +
  (most_common_letter('abbab') == ['b', 3]).to_s
)
