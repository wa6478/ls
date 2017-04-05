# class Phrase
#   def initialize(phrase)
#     @phrase = phrase
#   end

#   def word_count
#     words = Hash.new(0)
#     @phrase.split(/ |,/).each do |word|
#       words[scrub(word).downcase] += 1 unless scrub(word) == ''
#     end
#     words
#   end

#   def scrub(word)
#     word.gsub(/^\'|\'$|[^a-zA-Z0-9\']/, '')
#   end
# end

# refactor with `String#scan`

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = Hash.new(0)

    @phrase.scan(/\b[\w']+\b/) do |word|
      words[word.downcase] += 1
    end

    words
  end
end