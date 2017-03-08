

number = 0
loop do
  puts "How many lines would you like? (Q to quit)"
  number = gets.chomp
  break if ["Q","q"].include?(number)
  number = number.to_i
  if number >= 3
    number.times {puts "LS is great"}
  else
    puts "Come on, let's do at least 3."
  end
end
