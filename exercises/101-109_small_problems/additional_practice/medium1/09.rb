# Fibonacci Numbers (Procedural)

# In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. In a language that is not optimized for recursion, some (not all) recursive methods can be extremely slow and require massive quantities of memory and/or stack space.

# Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; as a result, the Fibonacci solution is only useful up to about fibonacci(40). With higher values of nth, the recursive solution is impractical. (Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

# Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

# Rewrite your recursive fibonacci method so that it computes its results without recursion.

# Examples:

# def fibonacci(n, num1=1, num2=1)
#   return num1 if n <= 1
#   fib = num1 + num2
#   num1, num2 = num2, fib
#   fibonacci(n - 1, num1, num2)
# end

def fibonacci(n, num1=1, num2=1)
  latest_fib = 1
  return latest_fib if n <= 2
  
  (n - 2).times do
    latest_fib = num1 + num2
    num1, num2 = num2, latest_fib
  end
  
  latest_fib
end

# don't actually need to store value

def fibonacci(n)
  return 1 if n < 3
  first, last = 1, 1
  
  3.upto(n) do 
    first, last = [last, first + last]
  end
  
  last
end

puts fibonacci(3) == 2
puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
# puts fibonacci(100_001) # => 4202692702.....8285979669707537501