
# adjectives = %w[ red lazy fast slippery slick ]
# verbs = %w[ walk drink dip drip ]
# nouns = %w[ cat car toaster ]
# adverbs = %w[ quickly carefully ]

# sentence = 'Do you :verb: your :adjective: :noun: :adverb:? Are you having a laugh?'

# sentence.sub!(/\:adjective\:/, adjectives.sample)
# sentence.sub!(/\:verb\:/, verbs.sample)
# sentence.sub!(/\:noun\:/, nouns.sample)
# sentence.sub!(/\:adverb\:/, adverbs.sample)

# puts sentence

# alternate using formats for substitution and multiple assignment

adj, noun, verb, adv = %w[adj, noun, verb, adv].map do |word|
                         puts "Please provide #{word}"
                         gets.chomp
                       end
                       
# using multiple assignment with map like this for capture is great because it captures a lot of the logic within the data structure early on
# simplifies things visually a bit and is still quite understandable

puts format("'Do you %s your %s %s %s?", verb, adj, noun, adv)

# using format for substitution seems like it could come in handy