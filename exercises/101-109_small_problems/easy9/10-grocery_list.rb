# Grocery List

# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

# Example:

def buy_fruit(array)
  array.map { |fruit, count| [fruit] * count }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])
puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]