# Question 1

# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers 
# expect the following since Array#uniq is not destructive:
# 1
# 2
# 2
# 3

# p numbers == puts numbers.inspect