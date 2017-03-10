# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

def digit_list(integer)
  integer.to_s.chars.map { |string_letter| string_letter.to_i }
  # cleaner version from answer:
  # integer.to_s.chars.map {&:to_i} # need to pay more attention to where this sort of truncation is possible in blocks
end

# Examples:

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]