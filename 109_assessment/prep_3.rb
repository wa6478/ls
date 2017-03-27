# Watch Others Code - Part 1
# https://launchschool.com/blog/watch-others-code-recording-part-1


# calculating primes
# is an integer a prime?
# take an array, return only those values that are primes
# take an array, return the number of primes in the array

def prime?(num)
  return false if num < 2
  (2..num - 1).each { |div| return false if num % div == 0 }
  true
end

def primer(array)
  p array.map { |el| el if prime?(el) }.compact
end

def prime_count(array)
  primer(array).size
end

p prime_count((1..20).to_a)

# finding sum or product of a series of numbers
# write a program that asks user for an integer greater than 0
# ask if they want the sum or product of all the integers between 1 and entered number

# - input: positive integer, and operation string 'sum' or 'product'

def sum_or_product(num, op)
  case op
  when 'sum' then (1..num).to_a.reduce(:+)
  when 'product' then (1..num).to_a.reduce(:*)
  end
end

puts sum_or_product(3, 'sum')
puts sum_or_product(3, 'product')
puts sum_or_product(4, 'sum')
puts sum_or_product(4, 'product')
puts sum_or_product(10, 'sum')
puts sum_or_product(10, 'product')



# interleave two arrays
# input two arrays, same number of elements, return a new array that contains all the elements of the array arguments take in alternation

# - input: two arrays of same size
# - output: one array with elements of array arguments taken in alternation

# - algo
#   - since arrays are same size, iterate through one, and put el @ index into new array

def interleaver(arr1, arr2)
  arr1.map.with_index { |el, idx| [el, arr2[idx]] }.flatten
end

def interleaver(arr1, arr2)
  output = []
  arr1.size.times do |idx|
    output << arr1[idx]
    output << arr2[idx]
  end
  output
end

p interleaver([1,2,3], [4,5,6])