# Question 3

# In other exercises we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => 'one'
puts "two is: #{two}" # => 'two'
puts "three is: #{three}" # => 'three'

# the method doesn't change the outer variables, only rearranges assignment of local variables within the scope of the method

B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => 'one'
puts "two is: #{two}" # => 'two'
puts "three is: #{three}" # => 'three'

# method doesn't change the out variables, only the local variables within the method are assigned to new objects which aren't accessible by the outer puts


C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => 'two'
puts "two is: #{two}" # => 'three'
puts "three is: #{three}" # => 'one'

# method mutated the original objects passed to the method, and therefore the objects that the outer variables are pointing it have been modified. The local variables within the method still aren't available to the puts, but the modified value of the objects is being pointed at by the outer variables.