array = %w(fun words are fun to write)

array.each_with_index do |word, index|
  puts "#{word} is the #{index + 1} word in this array"
end 