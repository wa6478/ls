# Pig Latin

# Pig Latin is a made-up children's language that's intended to be confusing. It obeys a few simple rules (below), but when it's spoken quickly it's really difficult for non-children (and non-native speakers) to understand.

# Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
# Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word.
# There are a few more rules for edge cases, and there are regional variants too.

# =============================

# Notes:
# IF VOWEL SOUND ADD "ay" to end of word
# IF CONSONANT SOUND move consonant to end of word and add "ay"

# Algo: 
# move everything before the first vowel to the end and add ay
# edge cases per the tests:
# if it begins with a x or y followed by a vowel, treat like consonant
# if it begins with a x or y followed by a consonant, treat like vowel

class PigLatin
  VOWELS = 'aeiou'.split('')
  XY = 'xy'.split('')

  def self.translate(words)
    result = []
    words.split(' ').each do |word|
      chunk, stem = first_consonants(word)
      result << stem + chunk + 'ay'
    end
    result.join(' ')
  end

  def self.first_consonants(word)
    chunk = ''
    stem_index = 0
    word.each_char.with_index do |char, index|
      stem_index = index
      break if VOWELS.include?(char) unless chunk[-1] == 'q'
      break if (XY.include?(char) && 
        VOWELS.include?(word[index + 1]) == false)
      chunk << char
    end
    stem = word[stem_index..-1]
    [chunk, stem]
  end
end