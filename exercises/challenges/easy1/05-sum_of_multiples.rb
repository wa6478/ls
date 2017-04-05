# input: number, optional: multiples of given numbers (default: 3, 5)
# required output: number that is the sum of all multiples of given numbers up to but excluding the input number

# class SumOfMultiples
#   attr_reader :multiples

#   def initialize(*mult)
#     @multiples = mult
#   end

#   def self.to(num)
#     all_multiples = []

#     1.upto(num - 1) do |number|
#       all_multiples << number if [3, 5].any? { |mult| number % mult == 0 }
#     end

#     all_multiples.reduce(0, :+)
#   end

#   def to(num)
#     all_multiples = []

#     1.upto(num - 1) do |number|
#       all_multiples << number if multiples.any? { |mult| number % mult == 0 }
#     end

#     all_multiples.reduce(0, :+)
#   end

# end

# refactor


# class SumOfMultiples
#   def initialize(num1 = 3, num2 = 5, *mult)
#     @multiples = num1, num2, *mult
#   end

#   def self.to(num)
#     new.to(num)
#   end

#   def to(num)
#     all_multiples = []

#     1.upto(num - 1) do |number|
#       all_multiples << number if @multiples.any? { |mult| number % mult == 0 }
#     end

#     all_multiples.reduce(0, :+)
#   end
# end

# select from a range

class SumOfMultiples
  def initialize(num1 = 3, num2 = 5, *mult)
    @multiples = num1, num2, *mult
  end

  def self.to(num)
    new.to(num)
  end

  def to(num)
    (1...num).select { |number| @multiples.any? { |mult| number % mult == 0 } }.reduce(0, :+)
  end
end