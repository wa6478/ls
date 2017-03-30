# Give us your feedback
# Capitalize Words

# Write a method that takes a single String argument and returns a new string that contains the original value of the argument, but the first letter of every word is now capitalized.

# You may assume that words are any sequence of non-blank characters, and that only the first character of each word must be considered.

# Examples

# input: single string argument 
# output: new string (contains original value of input, except every word is capitalized)
# - words are non-blank characters
#   - non alpha characters still count as a first character (everything other than ' ')
# - only the first character of each word matters

# algo:
# - #split words into an array
# - call #map on the array, and calling #capitalize on each word within the array, returning a new array with the capitalized words
# - call #join(' ') on the array to create the string output

# algo-alt1:
# - use #gsub to detect the first letter of each word and call upcase on just that letter (although not sure how to pass the upcased letter to gsub)

def word_cap(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

# more succinctly

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

# trying alt1

def word_cap(string)
  string.gsub(/\S+/, &:capitalize)
end

def word_cap(string)
  string.gsub(/\S+/) { |word| word.capitalize}
end

def word_cap(string)
  string.gsub(/\A\S|\s\S/, &:upcase).gsub(/\B[A-Z]*/, &:downcase)
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'