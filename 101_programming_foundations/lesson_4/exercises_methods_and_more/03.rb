# Exercise 3

# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# guess before doc check, that like select, it returns the array for which the block evaluated true for
# since puts evaluates to nil which has a boolean value of false, reject will not reject any of the elements in the array
# therefore it will return => # [1, 2, 3]