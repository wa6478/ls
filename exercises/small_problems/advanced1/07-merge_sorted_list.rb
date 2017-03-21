# Merge Sorted Lists

# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

def merge(arr1, arr2)
  result = []
  idx1 = 0
  idx2 = 0
  
  loop do
    break if arr1[idx1] == nil && arr2[idx2] == nil
    
    case
    when arr1[idx1] == nil
      result = result + arr2[idx2..-1]
      break
    when arr2[idx2] == nil
      result = result + arr1[idx1..-1]
      break
    when arr1[idx1] >= arr2[idx2]
      result << arr2[idx2]
      idx2 += 1
    when arr1[idx1] < arr2[idx2]
      result << arr1[idx1]
      idx1 += 1
    end
  end
  
  result
end

# Examples:

puts merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge([], [1, 4, 5]) == [1, 4, 5]
puts merge([1, 4, 5], []) == [1, 4, 5]