process_the_loop = [true, false].sample

if process_the_loop == true
  loop do
    puts "the loop has been processed"
    break
  end
else 
  puts "the loop has not been processed"
end