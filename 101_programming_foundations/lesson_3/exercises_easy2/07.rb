# Question 7

# In the previous exercise we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# We could have used either Array#concat or Array#push to add Dino to the family.

# How can we add multiple items to our array? (Dino and Hoppy)

p flintstones << "Dino" << "Hoppy"
p flintstones.concat(["Dino", "Hoppy"])
p flintstones.push("Dino", "Hoppy")