numbers = [1,2,3,4,5,6,7,8,9,10]
numbers.push(11) #exercise 4
numbers.unshift(0) #exercise 4
p numbers

numbers.pop #exercise 5
numbers.push(3) #exercise 5
p numbers

unique_array = numbers.uniq
p unique_array
# odds = []
# numbers.select do |num|
#   odds << num unless num % 2 == 0
# end

# puts odds

odd_array = numbers.select { |num| num.odd? }

puts odd_array

