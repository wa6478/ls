# Part 4 - Derick does a few exercises
# https://launchschool.com/blog/live-session-beginning-ruby-part-4

# write a method that takes a string as an argument
# returns reversed string without using String#reverse

# - input: string
# - output: string argument reversed (without using String#reverse)

# - algo:
#   - initialize output string
#   - iterate through each char of the input string
#   - prepend each char to the output string
#   - return the output string

# - maintain capitalization, keep everything as is

def string_rev(str)
  output = ''
  str.each_char { |char| output.prepend(char) }
  output
end

def string_rev(str)
  str.each_char.with_object("") { |char, string| string.prepend(char) }
end

def string_rev(str)
  str.size.downto(1).with_object("") { |idx, string| string.prepend(str[-idx]) }
end

puts string_rev("hello") == "olleh"
puts string_rev("HELLO") == "OLLEH"
puts string_rev('123Hi') == "iH321"



# input start and ending number
# print all numbers in between
# if divisible by: 3 Fizz, if 5 Buzz, if 3 & 5 Fizzbuzz

# - input: start, stop integer
# - output: print a string
#   - string has all integers between start and stop
#   - if the integer is divisible by 3, then Fizz
#   - if the integer is divisible by 5, then Buzz
#   - if both, then FizzBuzz

# - initialize an output string
# - want to iterate from start through stop, and add each to the output string
# - at each stage in the iteration, need to check fizzbuzz value
# - fbvalue helper method
# - checks if divisible by 3 && 5, then 3, then 5, else
#   - returns the appropriate value (whether Fizz, Buzz, FizzBuzz, or just the original passed in value)
# - print output string

def fbvalue(num)
  case
  when num % 3 == 0 && num % 5 == 0 then 'FizzBuzz'
  when num % 3 == 0 then 'Fizz'
  when num % 5 == 0 then 'Buzz'
  else num
  end
end

def fizzbuzz(start, stop)
  output = []
  (start..stop).each { |num| output << fbvalue(num) }
  puts output.join(', ')
end

fizzbuzz(1, 15)


PRODUCTS = [
  { name: 'Thinkpad X210', price: 200 },
  { name: 'Thinkpad X220', price: 250 },
  { name: 'Thinkpad X230', price: 300 },
  { name: 'Thinkpad X240', price: 400 },
  { name: 'Thinkpad X250', price: 550 },
  { name: 'Thinkpad X210', price: 600 },
  { name: 'Dell Latitude', price: 200 },
  { name: 'Dell Latitude', price: 400 },
  { name: 'Dell Inspiron', price: 600 }
  ]
  
query = {
  price_min: 240,
  price_max: 280,
  q: 'thinkpad'
}

query2 = {
  price_min: 300,
  price_max: 550,
  q: 'latitude'
}

# given a list of products (an array full of hashes)
# passing an a hash as argument
# return all items in the array full of hashes that meet the criteria
# three criteria
# max price, min price
# and string that roughly (case insensitive) matches the name of the product

# algo
# - select all products that match the regex of :q
# - of those products, select all that have a price within the band provided by the lower and upper bound of the query
# - or, could just combine those two criteria with an &&

def search(query)
  PRODUCTS.select do |product|
    product[:name].downcase =~ /#{query[:q]}/ &&
    product[:price] <= query[:price_max] &&
    product[:price] >= query[:price_min]
  end
end

# without regex, could have split product[:name], and checked if it #include? the query name

p search(query)
  # => [ {items that match } ]
p search(query2)
  # => [ {items that match },
  #      {items that match } ]