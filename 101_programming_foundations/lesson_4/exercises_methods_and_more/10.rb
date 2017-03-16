# Exercise 10

# What is the block's return value in the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# return will be [1, nil, nil]
# because puts will return nil