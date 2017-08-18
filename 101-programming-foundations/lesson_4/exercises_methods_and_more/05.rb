# Exercise 5

# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# Assuming shift is a valid Hash method or enumerable method, I imagine it would remove the first inserted element (since hashes have no order, but Ruby keeps track of an insertion order these days)
# so it would => { a: 'ant'} || [:a, 'ant'] (it's the latter, returns an array with the value pair)
# and the remaining hash would be without that key_value pair