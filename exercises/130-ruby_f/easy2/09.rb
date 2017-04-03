def each_cons(arr)
  idx = 1
  loop do
    break if idx >= arr.size
    idx2 = idx - 1
    yield(arr[idx2], arr[idx])
    idx += 1
  end

  nil
end

def each_cons(arr)
  (1..arr.size - 1).each do |idx|
    idx2 = idx - 1
    yield(arr[idx2], arr[idx])
  end

  nil
end


hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end

result == nil
puts hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([]) do |value1, value2|
  hash[value1] = value2
end
puts hash == {}

hash = {}
each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
puts hash == {'a' => 'b'}