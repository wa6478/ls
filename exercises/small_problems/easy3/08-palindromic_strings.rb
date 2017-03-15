# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. (A palindrome reads the same forwards and backwards.) Case matters, and all characters should be considered.

def palindrome?(object)
  object == object.reverse
end
# already works with arrays, although ruby knows to use Array#reverse instead of String#reverse when it receives an array object. I just renamed the argument to object... not sure if that's a good name, but not sure what the convention around naming a potential multi_class input

# Examples:

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
puts palindrome?([1,2,3,2,1]) == true
puts palindrome?([1,2,3]) == false

=begin
understanding
- input
  a string
- output
  a boolean that indicates whether or not the string is a palindrom

since all characters matter, believe a simple #reverse on the original string should work and compare that result to the original string

if certain things didn't matter, would modify original string before comparing to reverse:
- if case didn't matter would use #lowercase
- if whitespace didn't matter would #delete(" ")
- if whitespace and punctuation didn't mater would #delete(/[!,.']/) assuming that regular expression is correct
  
=end