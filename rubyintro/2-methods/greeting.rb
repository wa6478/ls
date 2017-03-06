def greeter(name)
  puts "Hey there #{name}"
end

puts "name please"
name = gets.chomp
greeter(name)