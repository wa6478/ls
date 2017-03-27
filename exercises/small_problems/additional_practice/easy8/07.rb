# Double Char (Part 1)

# Write a method that takes a string, and returns a new string in which every character is doubled.

# Examples:

# - in: string
# - can be empty
# - out: string
# - but every char in the original string is doubled
# - looks like based on the example this includes non-alpha chars
# - maintains capitalization
# - spaces are doubled as well
 
# - algo
#   - initialize a new output string
#   - iterate through each char of the passed string
#   - push 2 * of current char into the result string
#   - return the result string
  
def repeater(string)
  result = ''
  string.each_char { |char| result << char * 2 }
  result
end

def repeater(string)
  string.each_char.with_object('') { |char, str| str << char + char }
end

def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''