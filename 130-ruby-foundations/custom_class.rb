# define my own each, select, reduce, map

class CustomEnumerators
  def self.each(arr)
    counter = 0

    loop do
      break if counter >= arr.size
      yield(arr[counter])
      counter += 1
    end

    arr
  end

  def self.select(arr)
    counter = 0
    result = []

    loop do
      break if counter >= arr.size
      result << arr[counter] if yield(arr[counter])
      counter += 1
    end

    result
  end

  def self.reduce(arr)
    counter = 0
    sum = 0

    loop do
      break if counter >= arr.size
      sum = yield(sum, arr[counter])
      counter += 1
    end

    sum
  end

  def self.map(arr)
    counter = 0
    result = []

    loop do
      break if counter >= arr.size
      result << yield(arr[counter])
      counter += 1
    end

    result
  end

  # def map
  #   result = []
  #   self.each { |el| result << el }
  #   result
  # end

end

p CustomEnumerators.map([1, 2, 3]) { |num| num + 1 }
p CustomEnumerators.select([1, 2, 3]) { |num| num.odd? }
p CustomEnumerators.reduce([1, 2, 3]) { |sum, num| sum + num }
p CustomEnumerators.each([1, 2, 3]) { |num| puts num }