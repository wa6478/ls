# Write a method that takes in a string of lowercase letters (no
# uppercase letters, no repeats). Consider the *substrings* of the
# string: consecutive sequences of letters contained inside the string.
# Find the longest such string of letters that is a palindrome.
#
# Note that the entire string may itself be a palindrome.
#
# You may want to use Array's `slice(start_index, length)` method,
# which returns a substring of length `length` starting at index
# `start_index`:
#
#     "abcd".slice(1, 2) == "bc"
#     "abcd".slice(1, 3) == "bcd"
#     "abcd".slice(2, 1) == "c"
#     "abcd".slice(2, 2) == "cd"
#
# Difficulty: hard.

# in: string
# out: longest palindrome substring within the original string
# - longest substring may be the string itself
# - need to find all substrings (so for each starting index, what are all the possible substrings)
#   - for a given index, how do I find all substrings
#   - run that for each starting index within the passed string
# - of all those substrings I need to select palindromes (#select given block string == string.reverse)
# - of those palindromes I need the longest (iteration to find longest)

def substrings(string)
  result = []
  string.length.times do |idx|
    result << string[0..idx]
  end
  result
end

def all_substrings(string)
  result = []
  string.length.times do |idx|
    result << substrings(string[idx..-1])
  end
  result.flatten
end

def palindrome?(string)
  i = 0
  while i < string.length
    if string[i] != string[(string.length - 1) - i]
      return false
    end

    i += 1
  end

  return true
end

def longest_palindrome(string)
  substrings = all_substrings(string)
  palindromes = []
  
  substrings.each do |substring|
    palindromes << substring if palindrome?(substring)
  end
  
  longest_palindrome = palindromes.first
  palindromes.each do |palindrome|
    longest_palindrome = palindrome if palindrome.length > longest_palindrome.length
  end

  longest_palindrome
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'longest_palindrome("abcbd") == "bcb": ' +
  (longest_palindrome('abcbd') == 'bcb').to_s
)
puts(
  'longest_palindrome("abba") == "abba": ' +
  (longest_palindrome('abba') == 'abba').to_s
)
puts(
  'longest_palindrome("abcbdeffe") == "effe": ' +
  (longest_palindrome('abcbdeffe') == 'effe').to_s
)
