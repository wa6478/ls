# puts "Give me a number"
# number = gets.chomp.to_i

# if (number >= 0) && (number <= 51)
#   puts "your number is between 0 and 50"
# elsif (number >= 0) && (number <= 100)
#   puts "your number is between 51 and 100"
# elsif number > 100
#   puts "your number is greater than 100"
# else
#   puts "your number is negative or something else weird"
# end

def numbersize
  puts "Give me a number"
  number = gets.chomp.to_i

  if (number >= 0) && (number <= 51)
    puts "your number is between 0 and 50"
  elsif (number >= 0) && (number <= 100)
    puts "your number is between 51 and 100"
  elsif number > 100
    puts "your number is greater than 100"
  else
    puts "your number is negative or something else weird"
  end
end

numbersize


def numbersize_case(number)
  case 
  when number < 0
    puts "can't be negative"
  when number < 51
    puts "between 0 and 50"
  when number < 101
    puts "between 51 and 100"
  else
    puts "greater than 100"
  end
end

def numbersize_case2(number)
  case number
  when 0..50
    puts "between 0 and 50"
  when 51..100
    puts "between 51 and 100"
  else
    if number < 0
      puts "no negatives yo"
    else
      puts "over 100"
    end
  end
end

puts "number please"
number = gets.chomp.to_i
numbersize_case(number)
puts = "-----"
numbersize_case2(number)