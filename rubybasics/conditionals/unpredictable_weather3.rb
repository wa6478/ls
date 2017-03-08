sun = ['visible', 'hidden'].sample

puts "clouds blocking" unless sun == 'visible'
puts "The sun is so bright!" if sun == 'visible'