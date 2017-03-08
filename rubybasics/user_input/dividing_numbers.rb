def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil

loop do
  puts ">>please enter numerator"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts "invalid number, try again."
end

denominator = nil

loop do
  puts ">>please enter denominator"
  denominator = gets.chomp
  if denominator == "0"
    puts "0 can't be the denominator"
    next
  end
  break if valid_number?(denominator)
  puts "invalid number, try again."
end

puts "#{numerator} divided by #{denominator} equals #{numerator.to_i / denominator.to_i}"
