# Clean up the words

# Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

# Examples:

# def cleanup(string)
#   alphanum = string.gsub(/[^a-z]/i, ' ')
#   while alphanum.include?('  ')
#     alphanum.gsub!('  ', ' ')
#   end
#   alphanum
# end

# alternate, cleaner version using squeeze

# def cleanup(string)
#   string.gsub(/[^a-z]/i, ' ').squeeze(' ')
# end

# further exploration w/o regular expression

ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a
NONALPHABET = ('&'..'z').to_a.reject { |elem| ALPHABET.include?(elem) }

def cleanup(string)
  result = string.chars.map { |char| ALPHABET.include?(char) ? char : ' ' }
  result.join.squeeze(' ')
end



puts cleanup("---what's my +*& line?") == ' what s my line '