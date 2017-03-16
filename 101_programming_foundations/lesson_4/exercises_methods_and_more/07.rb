# Exercise 7

# What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code. What gets output by this code?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# return value is true false based on what #any evaluates to
# since there are odd numbers, which is the last evaluated statement in the block, it will return true
# it will print 1 - 3 as it iterates through the array before returning true / false
# actually when it evaluates to true
# looks like it returns the first value for which it is true, so will only print values until it has reached such a condition
# if false, it will by defintion have iterated through the entire array