# Exercise 2

# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# we can find out by checking documentation or testing it in irb or running it with p
# my guess is that count returns an integer equal to the count
# confirmed