def lab_checker(word)
  if word =~ /lab/i
    puts word
  else
    puts "Doesn't include 'lab'"
  end
end

words = %w(laboratory experiment Pans_Labyrinth elaborate polar_bear)

p words

words.each do |word|
  lab_checker(word)
end