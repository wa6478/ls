# Part 5 - Conrad does a few exercises
# https://launchschool.com/blog/live-session-beginning-ruby-part-5

# vowels removed
# input: list of words
# return: list of words with vowels removed

# - input: array of words
# - output: array of words with vowels removed

# - algo:
#   - use delete on string to remove all letters at intersection 'aeiou'
#   - use gsub to substitute /[aeiou]/ with ''
#   - or create a constant called vowels, iterate through each char, see if vowels includes it, and if it doesn't, don't pass the char to a new output string

def vowel_remover(words)
  words.map { |word| word.delete('aeiou') }
end

def vowel_remover(words)
  words.each.with_object([]) { |word, arr| arr << word.gsub(/[aeiou]/, '') }
end

p vowel_remover(%w[hello darkness my old friend])
p vowel_remover(%w[apple pie blueberry pie pineapple fries])

# balanced parens

# given a string, are the parens within it balanced (i.e. there is always a closing parentheses for each open parantheses)

# input: string
# output: boolean
# have an open counter of parens
#   - parse through each char in the string argument
#   - if it encounters an open parens, increase the counter by 1
#   - if it encounters a closed parens, decrease the counter by 1
#   - if the counter ever goes negative, return false because you can't close an unopened parens
#   - if the counter at the end if anything other than zero, has to be false, as that means there are open parens that weren't closed
#   - else, true


def bal_parens(string)
  open_parens = 0
  string.each_char do |char|
    open_parens += 1 if char == '('
    open_parens -= 1 if char == ')'
    return false if open_parens < 0
  end
  
  open_parens.zero?
end

p bal_parens('()') == true
p bal_parens(')(') == false
p bal_parens('((hello))()') == true



# input: two numbers, print all primes between those two numbers. don't use prime class

# - input: two positive integers
# - output: print all primes between beginning and ending number

# - algo
#   - iterate over all numbers between start and stop integers
#   - call helper method prime
#     - definition of a prime: 
#       - a number greater than 1, divisible by only itself and 1
#     - from 2 upto number - 1, check if % remainder is 0, if so FALSE, else TRUE
#   - puts number if prime? == TRUE
  
def prime?(num)
  return false if num == 1
  (2..num - 1).each { |divisor| return false if num % divisor == 0 }
  true
end
  
def primes(start, stop)
  (start..stop).each { |num| puts num if prime?(num) }
end

# mind my do's and end's and {} when I'm doing one line vs multi line

primes(1, 15)
primes(5, 30)