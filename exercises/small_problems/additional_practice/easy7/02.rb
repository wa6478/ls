# Lettercase Counter

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

# Examples

# in: string
# out: hash, with 3 keys: lowercase, uppercase, neither
#   values of each key represents the count of characters in the passed string that is either lowercase, uppercase, or neither
# notes:
# need a hash
# need to iterate through the string, and evaluate whether each char matches the criteria (upper, lower, neither)
# if neither upper or lower, then default to neither
# algo:
# initialize a hash
# set each key equal to the result of a String#count, which I can feed 'a-z' or 'A-Z'
# neither will be equal to the string length less the counts of the previous two
# return the hash

def letter_case_count(string)
  result = {}
  result[:lowercase] = string.count('a-z')
  result[:uppercase] = string.count('A-Z')
  result[:neither] = string.length - result.values.inject(:+)
  result
end

# using regex

def letter_case_count(string)
  count = {}
  count[:lowercase] = string.scan(/[a-z]/).size
  count[:uppercase] = string.scan(/[A-Z]/).size
  count[:neither] = string.scan(/[^a-zA-Z]/).size
  count
end

# using the patterns with count

def letter_case_count(string)
  case_count = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }
  case_count.map { |type, pattern| [type, string.count(pattern)] }.to_h
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }