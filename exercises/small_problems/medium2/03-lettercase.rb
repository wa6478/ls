# Lettercase Percentage Ratio

# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# Examples

def letter_percentages(string)
  case_hash = { lowercase: 0, uppercase: 0, neither: 0 }

  string.each_char do |char|
    case
    when char =~ /[A-Z]/ then case_hash[:uppercase] += 1
    when char =~ /[a-z]/ then case_hash[:lowercase] += 1
    else                      case_hash[:neither] += 1
    end
  end

  characters = string.length.to_f
  case_hash.keys.each do |key|
    case_hash[key] /= characters
    case_hash[key] *= 100
  end

  case_hash
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }