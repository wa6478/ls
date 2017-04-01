def times(num)
  return num if num <= 0
  count = 0

  loop do
    yield(count)
    count += 1
    break if count == num
  end

  count
end

times(5) { |num| puts num }

arr = %w[cats dogs and many other animals]
times(arr.size) { |idx| puts arr[idx] }