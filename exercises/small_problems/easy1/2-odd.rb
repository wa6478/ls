# Write a method that takes one argument in the form of an integer or a float; this argument may be either positive or negative. This method should check if a number is odd, returning true if its absolute value is odd. You may assume that only integers are passed in as arguments.

def is_odd?(integer)
  # integer *= -1 if integer < 0  # commenting out this line as it seems that #odd? works on negative numbers
  # integer.odd? # commenting out because can't use odd? or even? in solution
  # feels like a good spot for a ternary conditional based on whether or not there is a remainder after dividing by two 
  # integer % 2 == 0 ? false : true
  # actually don't need ternary condtional statement, since the "==" comparator will return true or false already
  integer % 2 != 0
end


puts is_odd?(2) == false   # => false
puts is_odd?(5) == true    # => true
puts is_odd?(-17) == true # => true
puts is_odd?(-8) == false  # => false
# extra tests
puts is_odd?(-9) == true  # => false
puts is_odd?(-15) == true  # => false
puts is_odd?(-200) == false  # => false
puts is_odd?(500) == false  # => false

# If you weren't certain whether % were the modulus or remainder operator, how would you rewrite #is_odd? so it worked regardless?

puts "------- rewrite for remainder-------"

def is_odd?(integer)
  integer *= -1 if integer < 0
  integer.remainder(2) != 0
end

puts is_odd?(2) == false   # => false
puts is_odd?(5) == true    # => true
puts is_odd?(-17) == true # => true
puts is_odd?(-8) == false  # => false
# extra tests
puts is_odd?(-9) == true  # => false
puts is_odd?(-15) == true  # => false
puts is_odd?(-200) == false  # => false
puts is_odd?(500) == false  # => false
