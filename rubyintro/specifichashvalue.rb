# def specific_value_finder(hash)
#   puts "What value are you hoping to find?"
#   lookingfor = gets.chomp
  
#   if hash.values.include?(lookingfor)
#     puts "Yes the hash includes it"
#   else
#     puts "No, the hash doesn't include it"
#   end
    
# end

def specific_value_finder(hash)
  puts "What value are you hoping to find?"
  lookingfor = gets.chomp
  
  if hash.has_value?(lookingfor) # alternate using has_value?
    puts "Yes the hash includes it"
  else
    puts "No, the hash doesn't include it"
  end
    
end

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

specific_value_finder(person)