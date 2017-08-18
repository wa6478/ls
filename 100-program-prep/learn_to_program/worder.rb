words = []
puts "Write as many words as you like. Press Enter on an empty line to stop and return an alphabetical list of words entered."

while true
  currentword = gets.chomp
  currentword == "" ? break : currentword.split(" ").each { |word| words << word }
end

puts words.sort