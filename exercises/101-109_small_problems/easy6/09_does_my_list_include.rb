# Does My List Include This?

# Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

def include?(list, search)
  return false if list.empty? && search == nil  
  list.find { |elem| elem == search } == search ? true : false
end

# probably easier if I just Enumerable#each'ed my through this one and compared each element to the search value, and having to adjust for the edge case isn't cute

# cooler version from solution that uses double bang to get to the bottom of things, by calling it on the return value of find_index 

def include?(list, search)
  !!list.find_index(search)
end

# although I could probably use the double bang to clean up my original method, since find can return a nil object, it makes it cumbersome to adjust for that edge case. find_index ends up being cleaner for that reason

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false