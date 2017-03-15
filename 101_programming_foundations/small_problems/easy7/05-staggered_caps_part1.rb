# Staggered Caps (Part 1)

# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

# Example:

def staggered_case(string)
  result = ""
  string.chars.each.with_index do |char, idx|
     idx.even? ? result << char.upcase : result << char.downcase
  end
  result
end

# further exploration (toggle upcase/downcase start on first or second character)

def staggered_case(string, need_upcase=true)
  result = ''
  string.length.times do |index|
    need_upcase ? result << string[index].upcase : result << string[index].downcase
    need_upcase = !need_upcase
  end
  result
end

# gsub with regular expression

def staggered_case(string)
  string.gsub(/..?/, &:capitalize)
end

# scan with regular expression

def staggered_case(string)
  string.scan(/..?/).map(&:capitalize).join
end


puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'