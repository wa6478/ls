loop do
  puts ">> print something? (y/n)"
  answer = gets.chomp

  unless "ynYN".chars.include?(answer)
    puts "please answer y/n"
    next
  end

  puts "something" if "yY".chars.include?(answer)
  break
end