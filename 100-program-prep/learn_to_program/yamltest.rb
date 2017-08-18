require 'yaml'

test_array = [1, 2, 3, [1,2,3,[1,2,3,["hello",{"hi" => "hello", "cat" => "sad"}]]], true, "true"]
              
test_string = test_array.to_yaml

filename = 'tshirts.txt'

File.open(filename, 'w') do |file|
  file.write(test_string)
end

read_string = File.read(filename)

read_array = YAML::load(read_string)

puts(read_string == test_string)
puts(read_array == test_array)