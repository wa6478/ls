factorial = Enumerator.new do |yielder| # yielder object, given as block param is special
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1: accumulator * number
    yielder << accumulator # `<<` method on the yielder object is special, which is why there is no break in this loop.
    number += 1            # yielder yields a value when called
  end
end

7.times { puts factorial.next }

factorial.rewind

factorial.each_with_index do |number, index|
  puts number
  break if index == 6
end

#

factorial = Enumerator.new do |y|
  number = 0
  accumulator = 1
  loop do
    y << accumulator
    accumulator *= (number += 1)
  end
end

10.times {puts factorial.next}
p factorial

factorial.each do |fact|
  puts fact
  break if fact > 1000
end