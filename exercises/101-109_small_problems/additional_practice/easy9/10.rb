# Grocery List

# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

# Example:

# - input: array of arrays
#   - fruits with quantities (integer)
# - output: array of strings
#   - array with correct number of each fruit
  
# - algo:
#   - initialize output array
#   - call each on input array with two elements |fruit, count| 
#   - << into the output array fruit * count
#   - return the output array

def buy_fruit(arr)
  output = []
  arr.each { |fruit, count| output += [fruit] * count  }
  output
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]