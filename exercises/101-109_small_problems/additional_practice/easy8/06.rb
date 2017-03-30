# fizzbuzz

# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# Example:
# - in: two integers, starting and ending number
# - out: print all numbers between start and end, printing 'fizz', 'buzz', or 'fizzbuzz' depending on the following
#   - divisible by 3 "fizz"
#   - 5 "buzz"
#   - 3 & 5 'fizzbuzz'
#   - print on one line, comma delimited
  
# - observations
#   - probably want to have an array with all of the values
#   - create a string by joining on ', '
#   - then puts that string
  
# - algo
#   - initialize a new array to store result of iteration
#   - use #upto with our starting and ending numbers
#   - for each number passed to the block
#   - call fizzbuzzvalue on number
#     - fizzbuzzvalue takes a number
#     - checks several conditions
#       - IF number % 3 and number % 5 are zero, then return string 'Fizzbuzz'
#       - ELSIF number % 3 then 'Fizz'
#       - ELSIF number % 5 then 'Buzz
#       - ELSE number
#   - push result into initialized array
#   - call puts on the array on which we also call join ', '

def fizzbuzzvalue(num)
  case
  when num % 3 == 0 && num % 5 == 0 then 'FizzBuzz'
  when num % 3 == 0                 then 'Fizz'
  when num % 5 == 0                 then 'Buzz'
  else                                   num
  end
end

def fizzbuzz(start, stop)
  result = []
  start.upto(stop) do |num|
    result << fizzbuzzvalue(num)
  end
  puts result.join(', ')
end

def fizzbuzz(start, stop)
  (start..stop).map { |num| fizzbuzzvalue(num) }.join(', ')
end

puts fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz