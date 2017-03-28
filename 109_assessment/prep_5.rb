# vowels removed

# write a program, that given an array of words, returns an array of those words with all of the vowels removed

# write a program, 
# that given an array of words, 
# returns an array of those words 
#     with all of the vowels removed

# - input: array of strings
#   - the strings in the array are words
# - output: array of strings
#   - the strings in the original array with the vowels removed
  
# - remove vowels from a string
# - return a new array with a modified string
# - is this method destructive?
# - input validation
#   - assume that input will always be valid? (i.e. always an array of words)
# - what do we mean by "vowel"?
#   - 'aeiou'

# - algo
#   - use map to iterate through Array argument
#     - get rid of all the vowels within the word passed into the block
#     - opt1 - String#gsub regular expression character class to define characters to remove
#     - opt2 - String#delete on 'aeiou'

def vowel_remover(input)
  input.map { |word| word.delete('aeiou') }
end

p vowel_remover( %w[ blue yellow green red apple cinnamon ])
  
