# Double Char (Part 2)

# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

# Examples:

# - in: string
#   - possible to have empty input
# - out: string
#   - every consonant doubled
#   - all other characters are not doubled
#   - capitalization is preserved
  
# - algo
#   - set a CONSTANT equal to the alphabet and delete vowels from it
#   - alternatively, we could use regex
#   - initialize an output string
#   - iterate through each character in the input string
#   - IF CONSTANT includes? downcase char then 2x char to the output string
#   - ELSE move char to the output string
#   - return output string

CONSONANTS = ('a'..'z').to_a.join.delete('aeiou').chars

CONSONANTS = %w[ b c d f g h j k l m n p q r s t v w x y z ]

def double_consonants(string)
  output = ''
  string.each_char do |char|
    CONSONANTS.include?(char.downcase) ? output << char * 2 : output << char
  end
  output
end

def couble_consonants(string)
  string.chars.map { |char| char =~ /[^aeiou_\W\d\s]/ ? char * 2 : char }.join
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""