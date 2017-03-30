# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

# in: text file
# out: print longest sentence in text file
#      print number of words in longest sentence
# - sentences delimited by . ! ?
# - word count constitutes sentence length
# 
# - split on /.!?/
# - words within sentence are separated by spaces
# - split sentence on spaces to get words
# - array.size of sentence split == sentence length
# - print the sentence for which this is the longest
# - print array.size of that sentence

def longest_sentence(input)
  text = File.read(input)
  sentences = text.split(/[.?!]/)
  
  longest_sentence = sentences.first
  
  sentences.each do |sentence|
    longest_sentence = sentence if sentence.split.size > longest_sentence.split.size
  end
  
  puts "The longest sentence is '#{longest_sentence}' and is #{longest_sentence.split.size} words long."
end

longest_sentence('text_sample.txt')
longest_sentence('pg84.txt')