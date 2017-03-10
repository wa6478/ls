# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.




puts ">> Please enter an integer greater than 0:"
number = gets.chomp.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
choice = gets.chomp.downcase

case choice
when "s"
  sum = (1..number).to_a.inject(&:+)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
when "p"
  product = (1..number).to_a.inject(&:*)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Invalid choice"
end


#alternative to inject using #upto

# def sum_up(number)
#   sum = 0
#   1.upto(number) do |number|
#     sum += number
#   end
#   sum
# end


# puts ">> Please enter an integer greater than 0:"
# number = gets.chomp.to_i
# puts ">> Enter 's' to compute the sum, 'p' to compute the product."
# choice = gets.chomp.downcase

# case choice
# when "s"
#   sum = sum_up(number)
#   puts "The sum of the integers between 1 and #{number} is #{sum}."
# when "p"
#   product = (1..number).to_a.inject(&:*)
#   puts "The product of the integers between 1 and #{number} is #{product}."
# else
#   puts "Invalid choice"
# end

