# Sum of Sums

# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

# Examples:

def sum_of_sums(array)
  sum = 0
  array.size.times do |idx|
    sum += array[0..idx].inject(:+)
  end
  sum
end

# each_index

def sum_of_sums(array)
  sum = 0
  array.each_index do |idx|
    sum += array[0..idx].inject(:+)
  end
  sum
end

# upto

def sum_of_sums(array)
  sum = 0
  1.upto(array.size) do |count|
    sum += array[0, count].reduce(&:+)
  end
  sum
end

# can i do with each_object?

def sum_of_sums(array)
  array.each_index.with_object([]) { |idx, num| num << array[0..idx].reduce(:+) }.reduce(:+)
end

# reduce with a block

def sum_of_sums(array)
  (1..array.size).reduce(0) { |sum, n| sum += array.take(n).reduce(:+) }
end

# alternate reduce with a block

def sum_of_sums(array)
  (1..array.size).reduce(0) { |sum, n| sum += array[0, n].reduce(:+) }
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35