# Write a method that takes a string argument, and returns true if all of 
# the alphabetic characters inside the string are uppercase, false otherwise. 
# Characters that are not alphabetic should be ignored.

# input: string
# output: true/false
# - IF all letters in the string are uppercase, return true

def upcase?(string)
  string == string.upcase
end

puts upcase?("hello") == false
puts upcase?("HELLO") == true
puts upcase?("HAL9000") == true
puts upcase?("HI.") == true
puts upcase?("helLO.") == false


#

# Write a method named include? that takes an Array and a search value as 
# arguments. This method should return true if the search value is in the array, 
# false if it is not. You may not use the Array#include? method in your solution.

# in: array and search value
# out: boolean
# - do not use #include
# - if the array includes the search value, return true, ELSE false

def include?(array, query)
  array.each do |el|
    return true if el == query
  end
  false
end

#

def include?(array, query)
  array.size.times do |idx|
    return true if array[idx] == query
  end
  false
end

# 

def include?(array, query)
  return false if array.empty?
  idx = 0
  loop do
    return true if query == array[idx]
    idx +=1
    break if idx >= array.size
  end
  false
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false

