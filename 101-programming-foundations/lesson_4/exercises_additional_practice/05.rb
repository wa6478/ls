# Exercise 5

# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

flintstones.each.with_index do |name, idx|
  p idx if name[0, 2] == "Be"
end

p flintstones.index { |name| name[0, 2] == "Be" }