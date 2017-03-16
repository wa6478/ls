# Exercise 7

# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"
# ex:

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

p statement.chars.each.with_object(Hash.new(0)) { |char, hash| hash[char] += 1 if char =~ /[a-z]/i }
p statement.chars.each.with_object(Hash.new(0)) { |char, hash| hash[char] += 1 if (('A'..'Z').to_a).concat(('a'..'z').to_a).include?(char) }