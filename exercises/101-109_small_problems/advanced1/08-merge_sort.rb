# Merge Sort

# Sort an array of passed in values using merge sort. You can assume that this array may contain only one type of data. And that data may be either all numbers or all strings.

# Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays, then recombining those nested sub-arrays in sorted order. It is best shown by example. For instance, let's merge sort the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]
# We then work our way back to a flat array by merging each pair of nested sub-arrays:

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]
# Examples:

require 'pry'
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

def merge_sort(array)
  return array if array.size == 1
  half = array.size / 2
  
  left = array[0...half]
  right = array[half..-1]
  
  left = merge_sort(left)
  right = merge_sort(right)
  
  merge(left, right)
end



puts merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
puts merge_sort([5, 3]) == [3, 5]
puts merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
puts merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
puts merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]