# Letter Swap

# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word is swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

# Examples:

=begin
in: space delimited string of words
out: string of words with first and last letter of every word flipped
model: 
- split string
- map, feeding a block that outputs a new string that takes the first and last letters and swaps them with slice

=end

# def swap(string)
#   words = string.split.map do |word|
#             word.length > 1 ? word[-1] + word[1..-2] + word[0] : word
#           end
#   words.join(' ')
# end

# alternate

def letter_swapper(word)
  word[0], word[-1] = word[-1], word[0] # apparently a "common idiom" to assign multiple variables this way
  word
end

def swap(string)
  result = string.split.map { |word| letter_swapper(word) }
  result.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'