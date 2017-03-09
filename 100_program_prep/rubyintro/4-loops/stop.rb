
while true
  puts "Do you want to STOP, or keep going?"
  user_input = gets.chomp
  break if user_input == "STOP"
  puts "Alright let's keep going then."
end

#

input = ""
while input != "STOP"
  puts "Keep it going?"
  input = gets.chomp
end