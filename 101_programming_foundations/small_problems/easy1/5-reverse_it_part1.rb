# Write a method that takes one argument, a string, and returns the same string with the words in reverse order.

def reverse_sentence(string)
  string.split.reverse.join(" ")
end

# Examples:

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
# The tests above should print true.