numbers = {
  high:   100,
  medium: 50,
  low:    10
}

# half_numbers = []

# numbers.map do |k,v|
#   half_numbers.push(v / 2)
# end

# p half_numbers

# or

half_numbers = numbers.map do |k,v|
                 "#{k} + #{v / 2}"
               end

p half_numbers

