pets = ['cat', 'dog', 'fish', 'lizard']

mypet = [pets[2],pets[3]]
# or
mypet = pets.slice(2..3)
mypet.pop

puts "I have a pet #{mypet[0]}"

#I have a pet fish and a pet lizard!