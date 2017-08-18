def fibonacci(num1, num2, n)
  fib = num1 + num2
  p fib
  num1, num2 = num2, fib
  n -= 1
  return fib if n == 0
  fibonacci(num1, num2, n)
end

fibonacci(1, 1, 10)