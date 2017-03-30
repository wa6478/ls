# Lettercase Percentage Ratio

# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# Examples

# - in: string
# - out: 3 key hash with the % of the count of lower, upper, and neither case chars

# - algo
#   - count all the chars by type, then assign to hash

def letter_percentages(string)
  percentages = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }
  
  characters = string.chars
  
  characters.each do |char|
    case
    when char =~ /[a-z]/ then percentages[:lowercase] += 1
    when char =~ /[A-Z]/ then percentages[:uppercase] += 1
    else                      percentages[:neither] += 1
    end
  end
  
  total = percentages.values.reduce(:+).to_f
  
  percentages.keys.each do |key|
    percentages[key] = percentages[key] / total * 100
  end
  
  p percentages
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }