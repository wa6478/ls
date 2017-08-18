# Exercise 1

# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are the positions in the array.


flintstones.each.with_index.with_object({}) { |(el, idx), hash| hash[el] = idx }

# obviously can initialize a hash outside of the one line and iterate through in the same way

# could even do an each index and call the array's index position to get the element