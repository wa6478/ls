# ddaaiillyy ddoouubbllee

# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.

# Examples:

# def crunch(string)
#   string.squeeze('A-Za-z0-9')
# end

# shorter squeeze without passing an argument

# def crunch(string)
#   string.squeeze
# end

# alternate without String#squeeze
# in which case...
# start with a new string
# add characters to it to the extent that the current character doesn't match the last character

# def crunch(string)
#   result = ""
#   characters = string.chars
#   characters.each.with_index do |char, idx| 
#     result << char if char != characters[idx + 1]
#   end 
#   result
# end

# solution probably didn't use each/chars because that way the comparison of indexes is probably more human readable (just iterated through with index)
# ok tho - since how to do with each / char was part of further exploration
# let me build that version just for my own fluency:

# def crunch(string)
#   result = ''
#   index = 0
#   while index < string.length
#     result << string[index] unless string[index] == string[index + 1]
#     index += 1
#   end
#   result
# end

# another version using chars and each

# def crunch(string)
#   result = ''
#   string.chars.each { |char| result << char unless char == result[-1] }
#   result
# end

# w/ regex

def crunch(string)
  string.gsub(/(.)(?=\1)/, '') # copy pasta'ed that regex, but I know that /./ is for any character, and I would guess from the syntax of the second bit that it translates to 'characters more than one' or something of that sort
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''