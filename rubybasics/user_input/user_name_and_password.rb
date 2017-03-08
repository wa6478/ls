USER = "catdog"
PASS = "mypass"

user_input = ""
pass_input = ""

loop do
  puts "please enter username"
  user_input = gets.chomp
  puts "please enter password"
  pass_input = gets.chomp
  break if (user_input == USER) && (pass_input == PASS)
  puts "wrong username or password. try again."
end

puts "you're good to go"
