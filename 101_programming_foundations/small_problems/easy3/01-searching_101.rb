# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].

numbers = []
numbers_to_solicit = 6

puts "Enter six numbers, and we'll check if the last one is in the first five."
numbers_to_solicit.times do |round|
  puts ">> Enter the #{round + 1} number:"
  numbers << gets.chomp.to_i
end

array_to_check = numbers.take(numbers_to_solicit - 1)
value_to_find = numbers[-1]

if array_to_check.include?(value_to_find)
 puts "The number #{value_to_find} appears in #{array_to_check}."
else
 puts "The number #{value_to_find} does not appear in #{array_to_check}."
end

# alternative answer I liked a lot
puts "---- alternate ----"

def prompt(msg)
  puts "=> #{msg}"
end

numbers = %w( 1st 2nd 3rd 4th 5th )
numbers.each_with_index do |pos, idx|
  prompt "Please enter the #{pos} number:"
  numbers[idx] = gets.chomp.to_i
end

prompt "Please provide the last number:"
last_number = gets.chomp.to_i
appears = numbers.include?(last_number) ? "appears" : "does not appear"
prompt "The number #{last_number} #{appears} in #{numbers}"
