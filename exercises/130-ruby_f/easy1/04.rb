# Divisors

# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

# Examples

def divisors(num)
  1.upto(num).with_object([]) do |div, arr| 
    arr << div if num % div == 0
  end
end

def divisors(num)
  (1..num).map { |div| div if num % div == 0 }.compact
end

def divisors(num)
  1.upto(num).select { |div| num % div == 0 }
end

def divisors(num)
  sq_num = num**0.5
  first_half = 1.upto(sq_num).select { |div| num % div == 0 }
  second_half = first_half.map { |div| num / div}.sort

  num == 1 ? first_half : first_half + second_half
end
puts divisors(1) == [1]
puts divisors(7) == [1, 7]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute