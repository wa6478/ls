# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def multiply(num1, num2)
  num1 * num2
end

def square(num1)
  multiply(num1, num1)
end

puts square(1)
# puts square(1..2)          # can't multiple a range object
# puts square([1,2,3,4])     # guess it doesn't like multiplying an array by an array
puts square(5)
puts square(10)
# puts square({car: "fast"}) # doesn't like hashes either
# puts square({car: 1})      # sure don't
puts square(0)
puts square(-8)

# further exploration "power to the n"
puts "---- power to the n ----"

def power(number, to_the_power)
  return 1 if to_the_power == 0
  return number if to_the_power == 1
  output = number
  (to_the_power - 1).times { output = multiply(output, number)}
  output
end

puts power(-8, 1)
puts power(1, 4)
puts power(2, 4)
puts power(2, 2)
puts power(3, 3)

puts "----- recursive -----"

def recursive_power(num, n)
  return 1 if n == 0
  multiply(num, recursive_power(num, n - 1))
end

puts recursive_power(10, 0) == 1
puts recursive_power(10, 1) == 10
puts recursive_power(10, 2) == 100
puts recursive_power(10, 3) == 1000
puts recursive_power(-10, 4) == 10000
puts recursive_power(3, 3) == 27
