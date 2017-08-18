bye_counter = 0

while true
  puts "say something to granny:"
  words = gets.chomp
  
  if words == "BYE"
    bye_counter += 1
  else
    bye_counter = 0
  end
  
  if bye_counter == 3
    puts "OK BYE!!!"
    break
  elsif words == "BYE"
    puts "I CAN'T HEAR YOU!!"
  elsif words == words.upcase
    puts "NO, NOT SINCE #{rand(1930..1950)}"
  else
    puts "HUH? SPEAK UP!"
  end
  
end