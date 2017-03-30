# Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

def palindromic_number?(number)
  string = number.to_s
  string == string.reverse
end

# Examples:

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
puts palindromic_number?(0) == true
puts palindromic_number?(00123) == false

=begin
understanding the problem
- input
  - an integer
- output
  - a boolean that is true if the integer reads the same forward and backwards, false otherwise

approach
- don't belive we can #reverse integers
- but we can #reverse a string
- convert integers to a #string, then compare the output to the reversed version of that string

=end