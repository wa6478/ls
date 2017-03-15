
number = 0
loop do
  puts "How many lines would you like?"
  number = gets.chomp.to_i
  break if number >= 3
  puts "Come on, let's do at least 3."
end

number.times {puts "LS is great"}
