# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

# input: string
# output: integer representing ascii value of each character
# model: pass each char through String#ord and keep a running total of these numbers

def ascii_value(str)
  str.chars.map(&:ord).inject(0, &:+)
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

# further exploration mystery method: Integer#chr does the opposite of String#ord and returns the character for that integer