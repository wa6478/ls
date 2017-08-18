# Exercise 8

# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# it would be goofed up, as we are messing with its ability to iterate properly
# if I had to guess... it determines the number of times it's going to iterate up front
# print 1
# then going to the second object at index 1, but that is now 3 instead of 2 because the 1 got shifted
# print 3
# then maybe it's built in with a feature to avoid throwing an error if trying to access a nil index 
# ( YES -- it's loop counter compares to current array length rather than original length, so if the array changes, the length / size that loop counter compares to also adjusts, so it won't throw an error)
# and then just end up returning [3, 4] (the items that got "skipped" as a result of the shifting process)
# otherwise it may throw an error
# lets see... yep ended up returning [3, 4]


# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

numbers = [1, 2, 3, 4]
numbers.each.with_index do |number, index|
  p "#{index} #{numbers.inspect} #{number}"
  numbers.pop(1)
  p "#{numbers.inspect}"
end

# so having tested how it works above
# we can evaluate as follows:
# 0th index: print 1, pop 4, numbers = [1, 2, 3]
# 1st index: print 2, pop 3, numbers = [1, 2]
# 2nd index doesn't exist anymore, so it will return [1, 2]