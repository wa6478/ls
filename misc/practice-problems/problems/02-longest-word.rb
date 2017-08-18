# Write a method that takes in a string. Return the longest word in
# the string. You may assume that the string contains only letters and
# spaces.
#
# You may use the String `split` method to aid you in your quest.
#
# Difficulty: easy.

# in: string (sentence) - only letters and spaces
# out: longest_word in string
# - need to split string
# - iterate through words and check length
# - return the word for which length was longest

def longest_word(sentence)
  words = sentence.split
  longest = words[0]

  words.each do |word|
    longest = word if word.length > longest.length
  end

  longest
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'longest_word("short longest") == "longest": ' +
  (longest_word('short longest') == 'longest').to_s
)
puts(
  'longest_word("one") == "one": ' +
  (longest_word('one') == 'one').to_s
)
puts(
  'longest_word("abc def abcde") == "abcde": ' +
  (longest_word('abc def abcde') == 'abcde').to_s
)
