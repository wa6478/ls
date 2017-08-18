# Question 3

# Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end
# Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you change the loop construct (instead of using begin/end/until) to make this work? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

# change to until dividend <= 0 so that we don't have an infinite loop
# or while dividend > 0
# could also do number validation on input

# Bonus 1

# What is the purpose of the number % dividend == 0 ?
# to figure out whether it is evenly divisible by checking if there are no remainders (i.e. is it an integer?)

# Bonus 2

# What is the purpose of the second-to-last line in the method (the divisors before the method's end)?
# the method will implicitly return the last line evaluated, so this will then return the expected factors