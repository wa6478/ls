# Sum of Sums

# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

# Examples:

# - input: array of numbers
# - always contains at least one number
# - output: integer
#   - sum of sums of each leading subsequence for that Array
#   - leading subsequence is like a "substring" of sequential numbers starting with the first number in the array
  
# - observations
#   - looks like we need to perform a summing operation once for each number in the array, since each one represents a different ending of a subsequence
  
# - algo
#   - initialize a output sum that I can add each sum to
#   - use a times loop or 0.upto loop, up to the size of the array
#   - use each index to grab the array from 0 to the idx position
#   - can call inject on that slice (or loop through it)
#   - add it to the output sum
#   - return the output sum

def sum_of_sums(numbers)
  sum = 0
  numbers.size.times do |idx|
    sum += numbers[0..idx].inject(:+)
  end
  
  sum
end

# without times or inject, using loops only
# - need to initialize an index as well
# - add counter to the loop
# - outer loop tracks what idx we're on
# - break loop if idx equals array size
# - call a separate loop on each subarray
# - inner loop adds each element of the subarray to the sum
# - initialize subarray counter
# - add each number to our sum
# - break if idx equals subarray size

def sum_of_sums(numbers)
  sum = 0
  idx = 0
  
  loop do
    
    idx2 = 0
    loop do
      sum += numbers[0..idx][idx2]
      idx2 += 1
      break if idx2 == numbers[0..idx].size
    end
    
    idx += 1
    break if idx == numbers.size
  end
  
  sum
end

# rewrite the above do/while loops with until

def sum_of_sums(numbers)
  sum = 0
  idx = 0
  
  until idx == numbers.size
    idx2 = 0
    
    until idx2 == numbers[0..idx].size
      sum += numbers[0..idx][idx2]
      idx2 += 1
    end
    
    idx += 1
  end
  
  sum
end

# rewrite with while loops

def sum_of_sums(numbers)
  sum = 0
  idx = 0
  
  while idx < numbers.size
    idx2 = 0
    
    while idx2 < numbers[0..idx].size
      sum += numbers[0..idx][idx2]
      idx2 += 1
    end
  
    idx += 1
  end
  
  sum
end

# Enumerable#reduce
# 0...numbers.size for idx

def sum_of_sums(numbers)
  (0...numbers.size).reduce(0) { |sum, idx| sum += numbers[0..idx].reduce(:+) }
end

# Enumerable#reduce
# 1..numbers.size for count (i.e. for slice(0, count))

def sum_of_sums(numbers)
  count = 1..numbers.size
  count.reduce(0) { |sum, cnt| sum += numbers[0, cnt].reduce(:+) }
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35