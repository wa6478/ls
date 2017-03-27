# Word to Digit

# Write a method that takes a sentence string as input, and returns a new string that contains the original string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

# Example:

# - in: string - sentence
# - out: string - sentence
#   - with all instances of 'zero'..'nine' converted to '0'..'9'
#   - need to keep all punctuation and whitespace in place
#   - don't modify anything other than the specified words
  
# - algo ideas
#   - regex gsub with all of the keywords
#   - '%s' syntax in the Kernel#format
#     - would require a array of desired outputs in the order of occurrence
#   - iterate through each word and do a lookup on an array(with_index) or hash
#     - would have to consider how to treat punctuation
#       - regex with gsub to substitute just the word, and leave the punctuation be
      
#   - iterate through original sentence by char
#   - adding to a new string called current word
#   - resetting current word whenever we hit a space OR we have a match and sub in one or the array digits instead of the word
#   - and whenever current word is reset, we will push its value to the new output string
  
# - algo
#   - initialize an array with all of the words 'zero'..'nine'
#   - initialize result string
#   - split all the words of input on spaces
#   - iterate through each word
#     - check with include? if our array of digits includes it
#       - if that's true, gsub the word at the index in our digit array that matches the current word
#         - and the sub value will be the index at which word occurs in our digits array
#     - push word or sub word into the result string
#   - return result string

# - algo
#   - if digits include current_word? if yes push and reset current_word
#   - elsif char == ' ' push and reset current_word


def word_to_digit(sentence)
  digits = %w[ zero one two three four five six seven eight nine ]
  numbers = (0..9).to_a
  digits_hash = digits.zip(numbers).to_h
  result = ''
  current_word = ''
  characters = sentence.chars
  
  characters.each do |char|
    current_word << char
    
    if digits.include?(current_word)
      result << digits_hash[current_word].to_s
      current_word = ''
    elsif char == ' '
      result << current_word
      current_word = ''
    end
    
  end
  
  result + current_word
end

# important thing I could have done is to simply clean up my current word for the purposes of lookup, without changing the string I'm passing

# the other good answer would have been to use \b in gsub to delimit where words begin and end so I didn't have to worry about punctuation there

# and the way to use gsub on multiple values, is to iterate through the hash, rather than your target sentence. that way, your gsub would be whatever the current key in your hash is

def word_to_digit(sentence)
  digits = %w[ zero one two three four five six seven eight nine]
  
  digits.each.with_index do |word, idx|
    sentence.gsub!(/\b#{word}\b/, idx.to_s)
  end
  
  sentence
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'