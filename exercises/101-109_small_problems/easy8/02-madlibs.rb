# Madlibs

# Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

# Example

# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!

def prompt(msg)
  puts "=> #{msg}"
end

# prompt "Enter a noun:"
# noun = gets.chomp
# prompt "Enter a verb:"
# verb = gets.chomp
# prompt "Enter an adjective:"
# adjective = gets.chomp
# prompt "Enter an adverb:"
# adverb = gets.chomp

# prompt "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's just great."

# using a hash to minimize repetition

# can assign a variable name within the argument for #with_object!!!
# %w[noun verb adjective adverb].each.with_object(hash = {}) do |word, hash|
#   prompt "Please enter a #{word}:"
#   hash[word] = gets.chomp
# end

# prompt "Do you #{hash['verb']} your #{hash['adjective']} #{hash['noun']} #{hash['adverb']}? That's just great."

# using multiple assignment with map

def madlib
  noun, verb, adjective, adverb = %w[noun verb adjective adverb].map do |word|
    prompt "Would you kindly enter a #{word}"
    gets.chomp
  end
  
  prompt "Do you #{verb} your #{adjective} #{noun} #{adverb}? What a show."
end

madlib


