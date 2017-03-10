# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

# Example

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

# def prompt(msg)
#   puts "=> #{msg}"
# end

# prompt "first number please"
# number1 = gets.chomp.to_i
# prompt "second number please"
# number2 = gets.chomp.to_i

# prompt "#{number1} + #{number2} = #{number1 + number2}"
# prompt "#{number1} - #{number2} = #{number1 - number2}"
# prompt "#{number1} * #{number2} = #{number1 * number2}"
# prompt "#{number1} / #{number2} = #{number1 / number2}"
# prompt "#{number1} % #{number2} = #{number1 % number2}"
# prompt "#{number1} ** #{number2} = #{number1 ** number2}"

# with floats

# def prompt(msg)
#   puts "=> #{msg}"
# end

# prompt "first number please"
# number1 = gets.chomp.to_f
# prompt "second number please"
# number2 = gets.chomp.to_f

# prompt "#{number1} + #{number2} = #{number1 + number2}"
# prompt "#{number1} - #{number2} = #{number1 - number2}"
# prompt "#{number1} * #{number2} = #{number1 * number2}"
# prompt "#{number1} / #{number2} = #{number1 / number2}"
# prompt "#{number1} % #{number2} = #{number1 % number2}"
# prompt "#{number1} ** #{number2} = #{number1 ** number2}"

# if I were to set up validation I would set up a method that returns true or false based on valid number input
# then I would put each prompt in a loop, so if it fails the valid number test it would re-prompt the user for input

#using Kernel#eval method

def prompt(msg)
  puts "=> #{msg}"
end

def valid_number(num)
  if num == 0
    false
  elsif num.class != Fixnum # wonder if I can test class like this -> yes I can!
    false
  else
    true
  end
end

num1 = nil
loop do
  prompt "first number"
  num1 = gets.chomp.to_i
  break if valid_number(num1)
  prompt "invalid input, please enter a valid non-zero integer"
end

num2 = nil
loop do
  prompt "second number"
  num2 = gets.chomp.to_i
  break if valid_number(num2) && num2 > 0 # check for negative number also
  prompt "invalid input, please enter a valid positive integer"
end

%w( + - * / % ** ).each do |op| # use this construct more often, makes things a lot easier
  equation = "#{num1} #{op} #{num2}"
  prompt "#{equation} = #{eval(equation)}" # kernel eval method is super helpful
end
