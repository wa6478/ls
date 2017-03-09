=begin my own attempt first 
Kernel.puts(">> first number please:")
num1 = Kernel.gets().chomp().to_i()
Kernel.puts(">> second number please")
num2 = Kernel.gets().chomp().to_i()
Kernel.puts(">>[a]dd, [s]ubtract, [m]ultiply, or [d]ivide first number to/from/by the second number")
operation = Kernel.gets().chomp().downcase()

output = nil
case operation
when "a" then output = num1 + num2
when "s" then output = num1 - num2
when "m" then output = num1 * num2
when "d" then output = num1 / num2
else Kernel.puts("Please provide a valid operation: 'a', 's', 'm', or 'd'")
end

Kernel.puts("Your result is #{output}")
=end

# below is the version following along with video

# pseudocode:
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

Kernel.puts("Welcome to the calculator!")

Kernel.puts("What's the first number?")
number1 =  Kernel.gets().chomp()

Kernel.puts("What's the second number?")
number2 =  Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("the result is #{result}")
