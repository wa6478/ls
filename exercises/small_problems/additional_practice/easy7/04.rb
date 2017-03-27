# Swap Case

# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

# Example:

# input: string
# output: same as input string, except all lowercase characters are uppercase and vice versa
# - can't use swapcase
# - can't change non alpha chars

# algo:
# - gsub all lowercase chars with upcase
# - gsub all uppercase chars with downcase
# - actually doesn't work because once all of them are downcase it will upcase all of them in the second pass

# algo alt 1
# - call chars on the string
# - iterate through each char, using a conditional statement to see whether it is =~ /[a-z]/ or /[A-Z]/
# - call #upcase or #downcase respectively

def swapcase(string)
  output = ''
  string.chars.each do |char|
    if char =~ /[a-z]/
      output << char.upcase
    elsif char =~ /[A-Z]/
      output << char.downcase
    else 
      output << char
    end
  end
  output
end


puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'