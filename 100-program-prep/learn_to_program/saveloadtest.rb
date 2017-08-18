filename = "ListerQuote.txt"
test_string = "testing this string to see if it works" + "does it though?"

File.open filename, 'w' do |file|
  file.write test_string
end

read_string = File.read filename

puts(read_string == test_string)