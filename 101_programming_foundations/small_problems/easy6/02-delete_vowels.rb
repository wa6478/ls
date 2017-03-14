# Delete vowels

# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

# in: array of strings
#    can be a one character string or multi length string
# out: array of strings
# data structure: keep the array and iterate over it if it includes VOWELS
# tricky part is to iterate over characters within strings

# VOWELS = "aeiouAEIOU"

# def remove_vowels(array)
#   result = []
#   array.each do |string|
#     result << string.delete(VOWELS)
#   end
#   result
# end

# when I manipulate an array like this and want the updated array, should get in the habit of reaching for map instead of each

#gsub

def remove_vowels(array)
  array.map { |string| string.gsub(/[aeiou]/i, '') }
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']