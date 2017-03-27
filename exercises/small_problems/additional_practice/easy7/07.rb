# Staggered Caps (Part 2)

# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

# Example:

# input: string
# output: input string with alternating staggered case
# - non-alpha characters should not be changed
# - only alpha chars toggle upcase/downcase
# - have to have a switch that toggles whenever a switch is made

# algo:
# - initialize output string
# - initialize upcase-swap variable as TRUE
# - iterate through each index of string using times or upto and the length of string
# - IF upcase-swap == TRUE AND char is an alpha char, send the upcased-char to the output string, and flip the upcase-swap switch
# - ELSE IF upcase-swap == FALSE and char is an alpha char, send the downcase-char to the output string and flip the switch
# - return output string

def staggered_case(string)
  output = ''
  upcase_swap = true
  
  string.length.times do |idx|
    if string[idx] =~ /[a-zA-Z]/
      upcase_swap ? output << string[idx].upcase : output << string[idx].downcase
      upcase_swap = !upcase_swap
    else
      output << string[idx]
    end
  end
  
  output
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'