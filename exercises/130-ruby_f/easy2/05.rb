def drop_while(arr)
  arr.each_index { |idx| return arr.drop(idx) unless yield(arr[idx]) }
  []
end

# using slice
def drop_while(arr)
  arr.each_index { |idx| return arr[idx..-1] unless yield(arr[idx]) }
  []
end

# loop with loop

def drop_while(arr)
  idx = 0
  loop do
    break if idx == arr.size || yield(arr[idx]) != true
    idx += 1
  end

  arr[idx..-1]
end


puts drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
puts drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| true } == []
puts drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
puts drop_while([]) { |value| true } == []