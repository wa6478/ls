# Write a method that takes a string in and returns true if the letter
# "z" appears within three letters **after** an "a". You may assume
# that the string contains only lowercase letters.
#
# Difficulty: medium.

# in: string
# out: boolean
# - return TRUE if 'z' appears within three letters after an 'a'
# - only lowercase letters
# - iterate through with index, when it encounters an 'a', grab the string from the idx to three characters out, and #include? to see if it has a 'z'

def nearby_az(string)
  string.length.times do |idx|
    if string[idx] == 'a'
      return true if string[idx + 1..idx + 3].include?('z')
    end
  end
  false
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts('nearby_az("baz") == true: ' + (nearby_az('baz') == true).to_s)
puts('nearby_az("abz") == true: ' + (nearby_az('abz') == true).to_s)
puts('nearby_az("abcz") == true: ' + (nearby_az('abcz') == true).to_s)
puts('nearby_az("a") == false: ' + (nearby_az('a') == false).to_s)
puts('nearby_az("z") == false: ' + (nearby_az('z') == false).to_s)
puts('nearby_az("za") == false: ' + (nearby_az('za') == false).to_s)
