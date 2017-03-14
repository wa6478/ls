# Lettercase Counter

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

# in: string
# out: hash
#   key is one of three types: :lowercase, :uppercase, :neither
#   value is an integer
#   need to make sure all three keys are initialized when some of them are 0
# data structure:
#   - could use an array of the characters and iterate through
#   - slice through the string as a string and use a loop construct without an array
#   - gonna go with array because it seems easier
# algo:
#   - tricky part seems to be how to validate whether a character is upcase or downcase
#   - can use constants of upcase and downcase letters to see if they include the passed char
#   - if neither has them, it's a neither

UPCASE   = ('A'..'Z').to_a
DOWNCASE = ('a'..'z').to_a

def letter_case_count(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }

  string.each_char do |char|
    case
    when DOWNCASE.include?(char) then result[:lowercase] += 1
    when UPCASE.include?(char)   then result[:uppercase] += 1
    else                              result[:neither] += 1
    end
  end

  result
end

# with regular expressions and Array#count

def letter_case_count(string)
  result = {}
  chars = string.chars
  result[:lowercase] = chars.count { |char| char =~ /[a-z]/}
  result[:uppercase] = chars.count { |char| char =~ /[A-Z]/}
  result[:neither]   = chars.count { |char| char =~ /[^a-zA-z]/}
  results
end

# with map and #to_h conversion
# this works great because count uses the same logic as delete, so we can define those strings here
# I suppose when we are counting existing patterns, creating a hash that assigns those patterns combined with the map method are pretty powerful

def letter_case_count(string)
  types = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z'} 
  types.map { |type, pattern| [type, string.count(pattern)] }.to_h
end

# Examples

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }