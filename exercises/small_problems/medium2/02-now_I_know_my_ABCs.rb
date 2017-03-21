# Now I Know My ABCs

# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

# Examples:

# each block can only be used once
# only one letter from each block may be used
# given that, can you spell the word passed in? true/false

# process:
# have a collection of all blocks in an array
# take the first letter of passed in string
# see if the blocks have that letter available
# if true, add the letter to a result string, and reject the block that included that letter from the array
# do again for each letter, assigning the array to the remaining blocks
# if the final result string matches the passed in string, then return true, else false


BLOCKS = %w[
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M
]

def block_word?(string)
  letters = string.chars
  current_blocks = BLOCKS
  blocks_remaining = current_blocks
  result = ''

  letters.size.times do |idx|
    current_blocks.each do |block|
      if block.include?(letters[idx].upcase)
        result << letters[idx]
        blocks_remaining = blocks_remaining.reject { |block| block.include?(letters[idx].upcase) }
      end
    end

    current_blocks = blocks_remaining
  end

  result == string
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true