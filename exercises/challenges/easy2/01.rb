# how to work with a code problem

# dont underestimate; resist the urge to dive into code
# read the description 3 times, produce an outline if necessary (what are the requirements??)
# communicate and clarify
# have a plan (algorithm), and verify with that
# test cases (happy paths, fail paths, edge cases)
# manage your energy

# character set consisting of letters, a space, and a point
# words consist of one or more, but at most 20 letters
# input text consists of one or more words separated by one or more spaces
# words are terminated by 0 or more spaces followed by a point
# input should be read from, and including the first letter of the first word
# up to and including the terminating point
# output:
# odd words are copied in reverse order
# even words are merely echoed

# "whats the matter with kansas." => "whats eht matter htiw kansas."

# BONUS POINTS: the characters must be read and printed one at a time

# in: string of words delimited by spaces terminating in a point
# out: same as in, but with odd words (the second word is odd - therefore odd index) put in reverse order

# characters must be read and printed one at a time
# can use #putc to print to the same line
# key is informing an "odd" state at which point to print characters in reverse order
# think splitting and reading each word letter by letter should still work fine
# also, how to manage the terminating point -- can just split on it as well, and reintroduce it at the end

# happy path algo
# split string on ' '* and '.' (' '* to compensate for cases of one or more spaces)
# map with index and call reverse on every odd index element
# iterate through each words characters letter by letter and print with putc

# edge cases we need to consider
# input validation?
#   words more than 20 letters? assuming that our inputs will conform
#   empty string? assuming valid input
#   one word string? shouldn't be a problem
#   what if it doesn't terminate in a period? assume that it does
# multiple spaces for separating words (captured by split)



def odd_reverser(sentence)
  words = sentence.split(/ +|\./)
  odds_reversed = words.map.with_index { |word, index| index.odd? ? word.reverse : word }
  puts odds_reversed.join(' ') + '.' # honestly reading each character at this point and printing out seems against the spirit of the bonus
end

# one line refactor

def odd_reverser(sentence)
  puts sentence.split(/ +|\./).map.with_index { |word, index| index.odd? ? word.reverse : word }.join(' ') + '.'
end

def odd_reverser(sentence)
  puts sentence.split(/\W+/).map.with_index { |word, index| index.odd? ? word.reverse : word }.join(' ') + '.'
end

# so if we did a character by character reader and printer, I think we'd have to parse each letter
# and when it encounters a space, grab the end of the next word (which seems to again be using word level logic, at which point doing it character by character seems pointless)
# and if we are printing one at a time, we would have to create like a mini cache of an odd word
# that we add to until the next space or period is encountered, and then print from it rather than the next char

odd_reverser('whats the matter with kansas.')
odd_reverser('one.')
odd_reverser('one    two. ')
odd_reverser('one    two  three    . ')



