def zip(arr1, arr2)
  zipped = []
  arr1.size.times do |idx|
    zipped << [arr1[idx], arr2[idx]]
  end
  zipped
end

def zip(arr1, arr2)
  arr1.each_index.with_object([]) { |idx, result| result << [arr1[idx], arr2[idx]] }
end

def zip(arr1, arr2)
  arr1.each_index.reduce([]) { |result, idx| result << [arr1[idx], arr2[idx]] }
end

puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]