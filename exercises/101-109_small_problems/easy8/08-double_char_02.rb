# Double Char (Part 2)

# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

# Examples:

CONSONANTS = (('a'..'z').to_a).join.delete('aeiou')

def double_consonants(string)
  string.chars.reduce("") do |sum, char| 
    if CONSONANTS.include?(char.downcase)
      sum += char * 2 
    else
      sum += char
    end
  end
end

def double_consonants(string)
  result = ''
  string.each_char do |char|
    CONSONANTS.include?(char.downcase) ? result << char * 2 : result << char
  end
  result
end


puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""