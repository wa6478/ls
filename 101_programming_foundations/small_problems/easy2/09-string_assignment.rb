name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# what does the above return? (nil because of puts, but in terms of the string)
# prints "Alice, Bob" 
# => nil

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# save_name points at the same location in memory as name
# name.upcase! mutates the caller, modifying the object both name and save_name are pointing at
# PRINT "BOB, BOB"
# => nil

# pass by reference vs pass by value