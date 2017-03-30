# Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

def real_palindrome?(string)
  normalized_string = string.downcase.delete("^a-z0-9") #need to call downcase first, otherwise the capital letters will get removed
  normalized_string == normalized_string.reverse
end

# String#delete uses "regular-expression-like" string of characters, the intersection of which it will remove. The documentation for String#count has more details on how to compose those strings and uses the same methodology as String#delete to determine the intersection of characters to actually count

# above is better version that deletes everything but alphanumeric characters

# def real_palindrome?(string)
#   normalized_string = string.delete("/[! ,']/").downcase 
#   normalized_string == normalized_string.reverse
# end
# Examples:

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false