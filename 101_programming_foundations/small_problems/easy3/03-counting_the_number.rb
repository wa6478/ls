# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

# input:

# Please write word or multiple words: walk
# output:

# There are 4 characters in "walk".

def prompt(msg)
  puts "==> #{msg}"
end

prompt "Please write word or multiple words:"
user_string = gets.chomp

characters = user_string.delete(" ").size

prompt "There are #{characters} characters in \"#{user_string}\""