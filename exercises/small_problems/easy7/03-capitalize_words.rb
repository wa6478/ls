# Capitalize Words

# Write a method that takes a single String argument and returns a new string that contains the original value of the argument, but the first letter of every word is now capitalized.

# You may assume that words are any sequence of non-blank characters, and that only the first character of each word must be considered.

# Examples

def word_cap(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

# concise

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

# without capitalize method

def word_cap(string)
  string.split.map { |word| word[0].upcase + word[1..-1].downcase }.join(' ')
end

# using gsub with regex is an option, I just don't know regex very well at all

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'