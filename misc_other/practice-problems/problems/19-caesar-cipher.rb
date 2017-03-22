# Write a method that takes in an integer `offset` and a string.
# Produce a new string, where each letter is shifted by `offset`. You
# may assume that the string contains only lowercase letters and
# spaces.
#
# When shifting "z" by three letters, wrap around to the front of the
# alphabet to produce the letter "c".
#
# You'll want to use String's `ord` method and Integer's `chr` method.
# `ord` converts a letter to an ASCII number code. `chr` converts an
# ASCII number code to a letter.
#
# You may look at the ASCII printable characters chart:
#
#     http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters
#
# Notice that the letter 'a' has code 97, 'b' has code 98, etc., up to
# 'z' having code 122.
#
# You may also want to use the `%` modulo operation to handle wrapping
# of "z" to the front of the alphabet.
#
# Difficulty: hard. Because this problem relies on outside
# information, we would not give it to you on the timed challenge. :-)

# in: integer 'offset' and a 'string' (string only has lowercase letters and spaces)
# out: new string where each letter is shifted by 'offset'
# - alphabet wraps around 
# - my instinct is to create a new alphabet, that is already rotated by the offset
# - so that when I call the same index, but in the separate alphabet, it will already be the offset one
# - and I can find the index using the #index method on the regular alphabet

def caesar_cipher(offset, string)
  alphabet = ('a'..'z').to_a
  offset_alphabet = alphabet[offset..-1] + alphabet[0...offset]

  output = ''
  string.chars.each do |char|
    if alphabet.include?(char)
      output << offset_alphabet[alphabet.index(char)]
    else
      output << char
    end
  end

  output
end

#

def caesar_cipher(offset, string)
  output = ''
  string.chars.each do |char|
    if char =~ /[a-z]/
      output << (((char.ord - 'a'.ord + offset) % 26) + 'a'.ord).chr
    else
      output << char
    end
  end

  p output
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'caesar_cipher(3, "abc") == "def": ' +
  (caesar_cipher(3, 'abc') == 'def').to_s
)
puts(
  'caesar_cipher(3, "abc xyz") == "def abc": ' +
  (caesar_cipher(3, 'abc xyz') == 'def abc').to_s
)
