loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer =~ /yes/i
end