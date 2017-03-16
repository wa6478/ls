# Exercise 9

# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# an array ['bear']
# map returns a new array with the new values passed to it from the block, if any
# in this case the only item that meets the conditional is 'bear', which is then put into the new array
# convention would also dictate that the key be called '_' if it's an unused variable

# above is incorrect
# actually will return an array [nil, 'bear']
# just because no object got passed, doesn't mean that array slot doesn't get filled with map... it does