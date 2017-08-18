# Question 2

# The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

# Can't just put an integer to puts, because puts really means "puts string" and there is no implicit conversion of a Fixnum to a string

# two ways to fix:
# 1 - use string interpolation #{40 + 2}
# 2 - (40 + 2).to_s and convert it to a string outright