require 'byebug'

def sort(some_array) # This "wraps" recursive_sort.

  recursive_sort(some_array, [])
  
end

def recursive_sort(unsorted_array,sorted_array)
  
  return sorted_array if unsorted_array == []
  smallest_word = unsorted_array[0]
  new_unsorted_array = []
  
  unsorted_array.each do |word|
    smallest_word = word if word <= smallest_word
  end
  
  unsorted_array.each do |word|
    new_unsorted_array << word unless word == smallest_word
  end

  (unsorted_array.count(smallest_word)).times do 
    sorted_array << smallest_word
  end
  
  recursive_sort(new_unsorted_array,sorted_array)

end

words = []
puts "Write as many words as you like. Press Enter on an empty line to stop and return an alphabetical list of words entered."

while true
  currentword = gets.chomp
  currentword == "" ? break : currentword.split(" ").each { |word| words << word }
end

puts sort(words) == words.sort
p sort(words)
p words.sort