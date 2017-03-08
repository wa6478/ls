def quicksort(array)
  return array if array.length <= 1
  
  middle = array[0]
  less = array.select { |element| element < middle }
  more = array.select { |element| element > middle }
  
  quicksort(less) + [middle] + quicksort(more)
  
end

puts "Enter a string of words to sort alphanumerically"
to_sort = gets.chomp.split
p to_sort
puts quicksort(to_sort) == to_sort.sort