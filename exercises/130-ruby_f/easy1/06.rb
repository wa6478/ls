
def any?(arr)
  return false if arr.empty?
  counter = 0

  loop do
    return true if yield(arr[counter])
    counter += 1
    break if counter >= arr.size
  end

  false
end

def any?(arr)
  arr.each { |item| return true if yield(item) }
  false
end

puts any?([1, 3, 5, 6]) { |value| value.even? } == true
puts any?([1, 3, 5, 7]) { |value| value.even? } == false
puts any?([2, 4, 6, 8]) { |value| value.odd? } == false
puts any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
puts any?([1, 3, 5, 7]) { |value| true } == true
puts any?([1, 3, 5, 7]) { |value| false } == false
puts any?([]) { |value| true } == false