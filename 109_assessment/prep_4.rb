# Watch Others Code - Part 4
# https://launchschool.com/blog/watch-others-code-recording-part-4

# calculate number of Friday the 13ths in a year

# initialize a count
# for each month (1..12) create a new date object with the argument year, curren month, and day 13
# if friday? increase count by 1
# output count

require 'date'

def thirteens(year)
  count = 0
  (1..12).each do |month|
    count += 1 if Date.new(year, month, 13).friday?
  end
  
  count
end

p thirteens(2015)
p thirteens(1997)
p thirteens(1990)
p thirteens(1433)


# generate random English mathematical phrases
# input: length as integer, and should return that many operations

# need a list of operations to sample from
# need a list of numbers from 0..9 to sample from (assuming that's the universe of numbers eligible for this method)
# need to pull a number and an operation as many times as argument
# plus one additional number

def mathphrase(num)
  ops = %w[ plus minus times divide ]
  numbers = %w[ zero one two three four five six seven eight nine ]
  phrase = []
  
  num.times do
    phrase << numbers.sample
    phrase << ops.sample
  end
  
  phrase << numbers.sample
  puts phrase.join(' ')
end

# mathphrase(2) # => "one plus two times four" 

mathphrase(1)
mathphrase(3)
mathphrase(5)
mathphrase(8)

