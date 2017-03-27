# Now I Know My ABCs

# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

# Examples:
require 'pry'

def block_word?(word)
  letters = %w[ bo gt vi xk re ly dq fs zm cp jw na hu ]
  blocks = {}
  letters.each { |el| blocks[el] = 0 }

  word.chars.each do |char|
    blocks.keys.each do |key|
      blocks[key] += 1 if key.include?(char.downcase)
    end
  end
  
  blocks.values.any? { |value| value > 1 } ? false : true
end

def block_word?(word)
  blocks = %w[ bo gt vi xk re ly dq fs zm cp jw na hu ]
  blocks.none? { |block| word.downcase.count(block) > 1 }
end


puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true