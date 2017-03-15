# Question 2

# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# => { a: "hi there" }
# assumptions:
# access by index/key grants access the specific object stored within a container object (in this case a hash)
# this object is assigned to informal_greeting
# this object is then mutated by '<<''
# thus the object that ':a' points at has been mutated, and therefore greeting returns the mutated object
