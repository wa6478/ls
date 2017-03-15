PASSWORD = "mypass"
input = ""
attempts = 0

loop do
  puts "password please"
  input = gets.chomp
  input == PASSWORD ? break : (puts "try again")
  attempts += 1
  puts "this is attempt ##{attempts}" if attempts % 10 == 0
end

puts "you got it"