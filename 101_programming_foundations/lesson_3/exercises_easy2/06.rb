# Question 6

# How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones << "Dino"
p flintstones.push("Dino")
p flintstones.insert(-1, "Last Dino")
p flintstones.concat(["Lastest Dino"])