# Exercise 16

# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

# requirements
# need to define possible range of hex values
# there may be a method, but I'm going to go ahead and use a 0-15 mapped to 0-f in a hash
# generate a random number, look it up in the hash table and add it to my string



def uuid
  hex = ((0..15).to_a).zip((('0'..'9').to_a).concat(('a'..'f').to_a)).to_h
  result = ""
  32.times do
    result << hex[rand(0..15)]
  end
  result.insert(8, '-')
  result.insert(13, '-')
  result.insert(18, '-')
  result.insert(23, '-')
  result
end

p uuid

# using sections and #sample

def uuid2
  hexchars = (('0'..'9').to_a).concat(('a'..'f').to_a)
  sections = [8, 4, 4, 4, 12]
  result = ''

  sections.each do |section|
     section.times do
       result << hexchars.sample.to_s
     end
     result << '-'
  end

  result.chop # to cut off trailing char
end

p uuid2