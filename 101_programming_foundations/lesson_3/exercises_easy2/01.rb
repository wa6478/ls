# Question 1

# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if "Spot" is present.

p ages.keys.include?('Spot')
p !!ages['Spot']
p ages.key?('Spot')
p ages.has_key?('Spot')
p ages.member?('Spot')
