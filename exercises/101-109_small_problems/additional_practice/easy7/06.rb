# Staggered Caps (Part 1)

# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

# Example:

# input: string
# output: new string that is passed in string with every other character capitalized, and the remaining characters lower case
# - non-letter characters should not change
# - non-letter characters count towards 'every other' when switching
# - capitalization starts with index 0 or first char in the string

# algo:
# - initialize empty output string
# - iterate through string using a times loop set to string's length
# - For all even indexes, call upcase, for all others, call downcase before sending the string[idx] to the output string
# - return output string

def staggered_case(string)
  output = ''
  string.length.times do |idx|
    if idx.even?
      output << string[idx].upcase
    else
      output << string[idx].downcase
    end
  end
  output
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'