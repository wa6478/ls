# Write a method that will take a string as input, and return a new
# string with the same letters in reverse order.
#
# Don't use String's reverse method; that would be too simple.
#
# Difficulty: easy.

def reverse(string)
  new_string = ''
  1.upto(string.length) do |idx|
    new_string << string[-idx]
  end
  new_string
end

##

def reverse(string)
  new_string = ''
  string.chars.each do |char|
    new_string.prepend(char)
  end
  new_string
end


# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'reverse("abc") == "cba": ' + (reverse("abc") == "cba").to_s
)
puts(
  'reverse("a") == "a": ' + (reverse("a") == "a").to_s
)
puts(
  'reverse("") == "": ' + (reverse("") == "").to_s
)
