# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

# For example, the string "01234" has the following 3-digit series:

# - 012
# - 123
# - 234
# And the following 4-digit series:

# - 0123
# - 1234
# And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.

# input: string, length of series
# output: array of sequences as arrays
# Series class
# initialized with a string
# has a series-slice generator based on an argument for how many digits
# need to be able to generate all strings of a given length from a string
# each_cons should work to give me a certain length
# so will need an array

class Series
  def initialize(string)
    @series = string.chars.map(&:to_i)
  end

  # def slices(num)
  #   raise ArgumentError, "slice bigger than string" if @series.size < num
  #   result = []
  #   @series.each_cons(num) do |set|
  #     result << set
  #   end
  #   result
  # end

  # without Enumerable#each_cons

  def slices(num)
    raise ArgumentError, "slice bigger than string" if @series.size < num
    result = []
    slice_to_idx = num - 1
    idx = 0
    loop do
      idx2 = idx + slice_to_idx
      break if idx2 >= @series.size
      result << @series[idx..idx2]
      idx += 1
    end
    result
  end
end

# tester = Series.new('123456')
# p tester.slices(1)
# p tester.slices(2)
# p tester.slices(3)
# p tester.slices(4)
# p tester.slices(5)
# p tester.slices(6)
# p tester.slices(7)

