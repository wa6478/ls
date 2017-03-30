# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# Example:

# given a starting number and ending number, print all numbers, and for numbers for which 3 and/or 5 are factors, print out Fizz, Buzz, or FizzBuzz

# in: start, number end number
# effectively a range of numbers

# out: no return value, just side effect of printing

def fizzbuzz_value(num)
  case
  when num % 3 == 0 && num % 5 == 0
    'FizzBuzz'
  when num % 3 == 0
    'Fizz'
  when num % 5 == 0
    'Buzz'
  else
    num
  end    
end

def fizzbuzz(start, stop)
  start.upto(stop).map do |num|
    fizzbuzz_value(num)
  end.join(', ')
end

def fizzbuzz(start, stop)
  start.upto(stop).with_object([]) do |num, arr|
    arr << fizzbuzz_value(num)
  end.join(', ')
end


puts fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz