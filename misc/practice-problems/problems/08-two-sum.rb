# Write a method that takes an array of numbers. If a pair of numbers
# in the array sums to zero, return the positions of those two numbers.
# If no pair of numbers sums to zero, return `nil`.
#
# Difficulty: medium.

# in: array of integers
# out: positions of numbers that sum to zero, otherwise nil
# - initialize an output array
# - iterate through passed array with two indexes
# - if the sum of the integers at those indexes is equal to zero, pass the indexes to the output array
# - if at the end the array is empty, return nil

def two_sum(nums)
  output = []
  nums.size.times do |idx|
    1.upto(nums.size - (idx + 1)) do |plus_idx|
      if nums[idx] + nums[idx + plus_idx] == 0
        output += [idx, idx + plus_idx]
      end
    end
  end
  output.empty? ? nil : output
end

# so what the solution does is simply stay away from iterators as such, and employ loops and counters instead
# let me try that

def two_sums(nums)
  output = []
  idx = 0
  idx2 = idx + 1

  while idx < nums.length
    idx2 = idx + 1
    while idx2 < nums.length
      output += [idx, idx2] if nums[idx] + nums[idx2] == 0
      idx2 += 1
    end
    idx += 1
  end

  output.empty? ? nil : output
end

# if I'm only working with indexes, loops may actually be preferable to iterators, because they give you more granular control of the index values, as opposed to what the iterator is passing

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'two_sum([1, 3, 5, -3]) == [1, 3]: ' + (two_sum([1, 3, 5, -3]) == [1, 3]).to_s
)
puts(
  'two_sum([1, 3, 5]) == nil: ' + (two_sum([1, 3, 5]) == nil).to_s
)
