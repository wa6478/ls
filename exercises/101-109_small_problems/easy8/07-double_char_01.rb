# Double Char (Part 1)

# Write a method that takes a string, and returns a new string in which every character is doubled.

# Examples:

def repeater(string)
  result = ""
  string.each_char { |char| result << char * 2}
  result
end

def repeater(string)
  string.each_char.with_object("") { |char, str| str << char + char }
end

def repeater(string)
  string.length.times.with_object("") { |idx, str| str << string[idx] * 2 } 
end

def repeater(string)
  string.chars.reduce("") { |sum, char| sum += char * 2 }
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''