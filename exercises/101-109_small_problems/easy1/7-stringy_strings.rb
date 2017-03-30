# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.


# def stringy(integer)
#   string = ""

#   until string.length >= integer
#     string << "10"
#   end

#   string.slice(0,integer)
# end

# alternate with times and index checking if even or odd

def stringy(size)
  string = ""

  size.times do |index|
    index.even? ? string << "1" : string << "0"
  end

  string
end

# Examples:

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts "--- Further exploration ---"

def stringy(size, leading = 1)
  numbers = []

  size.times do |index|
    index.even? ? numbers << leading : numbers << (leading == 1 ? 0 : 1)
  end

  numbers.join
end

puts stringy(6)
puts stringy(9, 0)
puts stringy(4)
puts stringy(7, 0)

# a little more cleanup

def stringy(size, leading = 1)
  numbers = []

  size.times do |index|
    numbers << (index.even? ? leading : (leading == 1 ? 0 : 1))
  end

  numbers.join
end

puts stringy(6)
puts stringy(9, 0)
puts stringy(4)
puts stringy(7, 0)

# with reverse to clean up leading option

def stringy(size, leading = 1)
  numbers = []

  size.times do |index|
    numbers << (index.even? ? 1 : 0)
  end

  leading == 1 ? numbers.join : numbers.reverse.join
end

puts stringy(6)
puts stringy(9, 0)
puts stringy(4)
puts stringy(7, 0)

