words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          
# array_of_anagrams = []

# words.each do |word|
#   anagram = []
#   words.each do |wordcheck|
#     anagram << wordcheck if word.chars.sort == wordcheck.chars.sort
#   end
#   array_of_anagrams << anagram.uniq.sort
# end

# array_of_anagrams.uniq.each do |anagrams|
#   p anagrams
# end

result = {}

words.each do |word|
  key = word.chars.sort
  result.has_key?(key) ? result[key] << word : result[key] = [word]
end

result.each_value { |v| p v }