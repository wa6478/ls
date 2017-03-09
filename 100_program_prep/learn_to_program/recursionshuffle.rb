
def shuffle(array)
  shuffled_array = []
  shuffled_index = []
  
  until shuffled_index.count == array.count
    random_index = rand(0...array.count)
    shuffled_index << random_index unless shuffled_index.include?(random_index)
  end
  
  shuffled_index.each do |index|
    shuffled_array << array[index]
  end
  
  if shuffled_array == array || shuffled_array == array.reverse
    shuffle(array) 
  else shuffled_array
  end  
end

test_array = ['hello', 'how', 'are', 'you', 'my', 'friend', 'once', 'more', 'alone', 'again']

puts shuffle(test_array)

