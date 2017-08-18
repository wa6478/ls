# Exercise 8

# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = 'aeiou'.chars

hsh.each do |_, value|
  value.each do |string|
    string.chars.each do |char|
      puts char if VOWELS.include?(char)
    end
  end
end

puts "---- w regex ----"

hsh.each do |_, value|
  value.each do |string|
    string.chars.each do |char|
      puts char if char =~ /[aeiou]/i
    end
  end
end

