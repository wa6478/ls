# Question 4

# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?("Dino")
p advice.match("Dino")
p advice.match("dino")
# puts advice.scan("Dino") # not good because it returns an array
# puts advice.scan(/Dino/) # not good because it returns an array
