# Exercise 4

# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# since we are passing each_with_object a hash as an argument, we are going to get a hash
# it will be filled as 'a' = >'ant', etc, since we are calling [0] on the value[0]
