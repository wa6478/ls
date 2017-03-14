# Find the Duplicate

# Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

# in: array
# out: number of the one value that occurs twice in the array
# algo: 
# initial instinct is to pass each value of the array to a hash(0) and increase the count
# then pull out the key with the max value
# other possibility would be to compare this hash to a unique hash by index, and the location where it doesn't match in the second hash is where the duplicate value lies. this method seems more fun so I'm gonna try it first

def find_dup(array)
  array.size.times { |index| return array[index] if array[index] != array.uniq[index] }
end

# idea is that at the intersection where these two aren't equal to one another, we have a duplicate

# solution uses Enumerable#find which returns the first obj for which block condition is true. trying:

def find_dup(array)
  array.find { |elem| array.count(elem) == 2 }
end

# let's try my hash implementation just so I get that hash practice (and I feel a little less confident in my use of hashes)

def find_dup(array)
  count = Hash.new(0)
  array.each { |elem| count[elem] += 1 }
  count.select { |k,v| v == count.values.max }.keys[0]
end

# also could have used select instead of find I imagine (although find might be faster since it breaks as soon as it finds something that works), and need to parse the results a little more

def find_dup(array)
  array.select { |elem| array.count(elem) == 2}.uniq.join.to_i
end

# Examples:

puts find_dup([1, 5, 3, 1]) == 1
puts find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73