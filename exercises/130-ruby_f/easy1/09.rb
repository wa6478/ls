def one?(arr)
  counter = 0
  true_count = 0

  loop do
    break if counter == arr.size || true_count > 1
    true_count += 1 if yield(arr[counter])
    counter += 1
  end

  true_count == 1
end

def one?(arr)
  true_count = 0
  arr.each do |item|
    true_count += 1 if yield(item)
    return false if true_count > 1
  end

  true_count == 1
end

# solution's idea uses next and true/false rather than a counter

def one?(arr)
  seen_one = false
  arr.each do |item|
    next unless yield(item)
    return false if seen_one
    seen_one = true
  end

seen_one
end


puts one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
puts one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
puts one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
puts one?([1, 3, 5, 7]) { |value| true }           # -> false
puts one?([1, 3, 5, 7]) { |value| false }          # -> false
puts one?([]) { |value| true }                     # -> false