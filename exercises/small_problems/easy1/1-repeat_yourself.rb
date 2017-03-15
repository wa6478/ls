# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

def repeat(string, repeats)
  repeats.times { puts string }
end

repeat('hello', 3)
repeat('five', 5)
repeat('picasso', 10)