def each_cons(arr, els)
  idx_span = els - 1
  (idx_span...arr.size).each do |idx|
    idx2 = idx - idx_span
    els == 1 ? yield(arr[idx]) : yield(arr[idx2..idx])
  end
  nil
end

# solution with splat

def each_cons(arr, els)
  arr.each_index do |idx|
    break if idx + els - 1 >= arr.size
    yield(*arr[idx..(idx + els - 1)])
  end
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
puts hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
puts hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
puts hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
puts hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
puts hash == {}