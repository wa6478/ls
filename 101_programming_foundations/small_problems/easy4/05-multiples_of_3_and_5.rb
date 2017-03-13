# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# Examples

# def multiple_of_3_5(num)
#   num % 3 == 0 || num % 5 == 0
# end

# def multisum(num)
#   sum = 0
#   1.upto(num) { |number| sum += number if multiple_of_3_5(number) }
#   sum
# end

# puts multisum(3) == 3
# puts multisum(5) == 8
# puts multisum(10) == 33
# puts multisum(1000) == 234168


# understand
# input is "some other number"
#   which is a positive integer greater than 1
# output is sum of
#   all multipes of 3 or 5 that lie between 1 and the number
# algo
#   iterate through all numbers between 1 and the target
#   have a helper method that can do a quick check on 3, 5 multiple
#   if yes, add to the sum (alternatively could add to an array, but that seems like uneccesary steps)

# ha! the further exploration is an array after all... guess I'll get to play with that anyway

# alternative 1

# def multiple?(num, divisor)
#   num % divisor == 0
# end

# def multisum(num)
#   multiples = []
#   1.upto(num) do |number| 
#     multiples << number if multiple?(number, 3) || multiple?(number, 5)
#   end
#   multiples.inject(&:+)
# end

# alternative 2
# cleaner version yet using the Enumerable#select method on a range to return an array (although perhaps slightly more taxing to human-parse)

def multisum(num)
  (1..num).select { |num| num % 3 == 0 || num % 5 == 0}.inject(&:+)
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168

