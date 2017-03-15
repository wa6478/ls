# Swap Case

# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

# Example:

# in: string
# out: string
# algo:
# - i'm sure there's an easy regex way of handling this
# - without that... what about a dictionary that I zip together of opposite cases and just pass through a lookup

CASE_UP_TO_DOWN = ('A'..'Z').to_a.zip(('a'..'z').to_a)
CASE_DOWN_TO_UP = ('a'..'z').to_a.zip(('A'..'Z').to_a)
CASESWAP = (CASE_UP_TO_DOWN + CASE_DOWN_TO_UP).to_h

def swapcase(string)
  result = ''
  string.chars.each do |char|
    CASESWAP[char] ? result << CASESWAP[char] : result << char
  end
  result
end

# using regex

def swapcase(string)
  characters = string.chars.map do |char|
                 if char =~ /[a-z]/
                   char.upcase
                 elsif char =~ /[A-Z]/
                   char.downcase
                 else
                   char
                 end
               end
  characters.join('')
end

# using String#tr method ... pretty dang powerful for things like this

def swapcase(string)
  string.tr('A-Za-z', 'a-zA-Z')
end

# can also use Array#include

def swapcase(string)
  character = string.chars.map do |char|
                case 
                when ('A'..'Z').to_a.include?(char)
                  char.downcase
                when ('a'..'z').to_a.include?(char)
                  char.upcase
                else
                  char                  
                end
              end  
  character.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'