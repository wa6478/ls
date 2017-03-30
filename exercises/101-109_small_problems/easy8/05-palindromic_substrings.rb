
require 'pry'

# Palindromic Substrings

# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

# Examples:

# in: string
# out: all palindromic substrings
#   - what does that mean?
#   - working backwards of requirements
#     - need to collect all palindromic(sp?) substrings (all_palindrome_substrings)
#     - need to check if a substring is a palindrome (is_palindrome?)
#     - need to collect all substrings for all indexes (all_substrings)
#     - need to find all substrings for a given string (substrings_of_string)

def substrings_at_index(string)
  substrings = []
  string.chars.each_index do |idx|
    substrings << string[0..idx]
  end
  substrings
end

def all_substrings(string)
  substrings = []
  string.chars.each_index do |idx|
    substrings << substrings_at_index(string[idx..-1])
  end
  substrings.flatten
end

def is_palindrome?(string)
  string.length > 1 && string == string.reverse
end

def palindromes(string)
  all_substrings(string).select do |substring|
    is_palindrome?(substring)
  end
end

# try super compact version

def is_palindrome?(string) # case insensitive
  norm_string = string.downcase.gsub(/[^a-z]/, '')
  norm_string.length > 1 && string == norm_string.reverse
end

def palindromes(string)
  substrings = []
  string.size.times do |idx|
    string[idx..-1].size.times do |idx2|
      substrings << string[idx..-1][0..idx2]
    end
  end
  substrings.select { |string| is_palindrome?(string) }
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]