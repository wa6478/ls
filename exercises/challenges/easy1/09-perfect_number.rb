class PerfectNumber
  def self.classify(num)
    raise RuntimeError, "must be positive integer" unless num > 0
    number = PerfectNumber.new(num)
    number.determine_type
  end

  def initialize(num)
    @num = num
  end

  def determine_type
    sum = sum_of_factors
    if sum == @num
      'perfect'
    elsif sum > @num
      'abundant'
    elsif sum < @num
      'deficient'
    end
  end

  def sum_of_factors
    find_factors.reduce(:+)
  end

  def find_factors
    factors = []
    (1...@num).each do |integer|
      factors << integer if @num % integer == 0
    end
    factors
  end
end