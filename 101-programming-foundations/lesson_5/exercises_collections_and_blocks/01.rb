# Exercise 1

# How would you order this array of number strings by descending numeric value?

p arr = ['10', '11', '9', '7', '8']

sorted = arr.sort do |num1, num2|
  num2.to_i <=> num1.to_i
end

p sorted