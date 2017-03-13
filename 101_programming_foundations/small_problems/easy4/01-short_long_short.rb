# Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

def short_long_short(string1, string2)
  short = ""
  long  = ""
  if string1.length > string2.length
    long  = string1
    short = string2
  else
    long  = string2
    short = string1
  end

  short + long + short
end

# point of this exercise is probably that it's possible to do many things in dense and clever ways that are hard to read. Go for readability and clarity over density.

# Examples:

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"

=begin
understand
- input
  - two strings of different lengths
- output
  - concatenated string of short-long-short

need to determine which string is longer, and assign it to a long_string variable, and the other to a short_string variable. then concatenate away
=end