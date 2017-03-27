# Palindromic Substrings

# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

# Examples:

# - in: string
# - out: array of all palindromes
#   - palindrome: string chars are same forwards and backwards
#   - in order of appearance of when the substring occurs
#   - duplicates OK
#   - case matters, therefore no case normalization necessary
#   - single characters are not palindromes
  
# - algo
# - pass the string to the substrings method and get an array back of all substrings in order
# - on that array, call map with a conditional to create a new transformed array
#   - if str.size > 1 and string is equal to its reverse, have the block evaluate the word
#   - else do nothing so the new array will only contain items which are palindromes

def substrings_at_start(string)
  (1..string.size).each.with_object([]) { |count, arr| arr << string[0, count] }
end

def substrings(string)
  string.size.times.with_object([]) { |idx, arr| arr << substrings_at_start(string[idx..-1]) }.flatten
end

def palindromes(string)
  substrings(string).map { |subs| subs if subs.size > 1 && subs == subs.reverse }.compact
end

# quesition if the IF statement evaluates to false, does it return nil, and will my map have nils in it for every time it evaluated false?
# can address that with #compact

# alternate with with_object to avoid nil values from map
# feels a little cleaner

def palindromes(string)
  substrings(string).each.with_object([]) do |subs, arr|
    arr << subs if subs.size > 1 && subs == subs.reverse
  end
end

# further exploration to ignore non-alpha and case
# think I would just write up a second method that I can call on subs that normalizes it

def alpha(string)
  string.downcase.gsub(/[^a-z]/, '')
end

def palindromes_alpha(string)
  substrings(string).each.with_object([]) do |subs, arr|
    arr << subs if subs.size > 1 && alpha(subs) == alpha(subs).reverse
  end
end

puts palindromes_alpha('hello-madam-did-madam-goodbye')

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]