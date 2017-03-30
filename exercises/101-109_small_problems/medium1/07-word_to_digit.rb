# Word to Digit

# Write a method that takes a sentence string as input, and returns a new string that contains the original string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

# Example:
require 'pry'

DIGITS = %w[zero one two three four five six seven eight nine]

# def word_to_digit(string)
#   words = string.split
#   words.map do |word|
#     letters = word.delete('^a-zA-Z')
#     DIGITS.include?(letters) ? word.gsub(letters, DIGITS.index(letters).to_s) : word
#   end.join(' ')
# end

# works, but certain edges cases (like 'freight') would probably break this:

# def word_to_digit(string)
#   DIGITS.each.with_index do |number, digit|
#     string.gsub!("#{number}", digit.to_s)
#   end
#   string
# end

# with regex (don't understand regex very well yet):

def word_to_digit(string)
  DIGITS.each.with_index do |number, digit|
    string.gsub!(/\b#{number}\b/, digit.to_s)
  end
  string
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') 

puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'