# Madlibs Revisited

# Let's build another program using madlibs. We made a program like this in the easy exercises. This time, the requirements are a bit different.

# Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.

# The challenge of this program isn't about writing your program; it's about choosing how to represent your data. Choose the right way to structure your data, and this problem becomes a whole lot easier. This is why we don't show you what the input data looks like; the input representation is your responsibility.
# Example output:

def prompt(msg)
  puts "=> #{msg}"
end

text = File.read('madlib.txt')
words = text.split

# adj_count = words.count("adj")
# ver_count = words.count("ver")
# nou_count = words.count("nou")
# adv_count = words.count("adv")

# adjectives = []
# adj_count.times do |idx|
#   prompt "Please provide adjective #{idx + 1}/#{adj_count}"
#   adjectives << gets.chomp
# end

# verbs = []
# ver_count.times do |idx|
#   prompt "Please provide verb #{idx + 1}/#{ver_count}"
#   verbs << gets.chomp
# end

# nouns = []
# nou_count.times do |idx|
#   prompt "Please provide noun #{idx + 1}/#{nou_count}"
#   nouns << gets.chomp
# end

# adverbs = []
# adv_count.times do |idx|
#   prompt "Please provide adverb #{idx + 1}/#{adv_count}"
#   adverbs << gets.chomp
# end



madlibbed = []
adjectives = %w[red blue beautiful ugly lazy morose decrepit shiny]
verbs = %w[runs walks prays eats loves sleeps]
nouns = %w[cat bear dog car TV VCR]
adverbs = %w[carefully silently quickly playfully]

words.each do |word|
  case word
  when /adj/ then madlibbed << adjectives.shuffle!.shift
  when /ver/ then madlibbed << verbs.shuffle!.shift
  when /nou/ then madlibbed << nouns.shuffle!.shift
  when /adv/ then madlibbed << adverbs.shuffle!.shift
  else madlibbed << word
  end
end

prompt "#{madlibbed.join(' ')}"