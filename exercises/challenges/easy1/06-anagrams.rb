# need to return an empty array if no match
# match is a method that returns an array of anagrams of the Anagram objects
# needs to be insensitive to case
# match needs to see if the letters could include our words
  # perhaps regex would work here
  # alternative would be to iterate through each letter with an include all? type of setup


class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    anagrams = []
    words.each do |word|
      next if word.downcase == @word.downcase
      anagrams << word if normalize(word) == normalize(@word)
    end
    anagrams
  end

  def normalize(word)
    word.downcase.chars.sort
  end
end