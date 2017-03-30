# Diamonds!

# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

# Examples

# - input: integer n
#   - odd integer
#   - no input validation required
# - output: 
#   - grid n x n
#   - a "diamond" shape
#     - *'s in the following order for n = 5 grid:
#       - 1, 3, 5, 3, 1
#     - *'s for a n = 9 grid
#       - 1, 3, 5, 7, 9, 7, 5, 3, 1

# - #center the string on width n
# - or prepend the appropriate number of spaces in front of each row

# - algo
#   - create a new array from iterating over 1..n and selecting odd numbers
#   - for each element in the array print '*' * element center adjusted to n
#   - repeat above step except with the array reversed, and slice on [1..-1]

def diamond(n)
  rows = (1..n).select{ |num| num.odd? }
  rows.each { |row| puts "#{'*' * row}".center(n) }
  rows.reverse[1..-1].each { |row| puts "#{'*' * row}".center(n) }
end

diamond(1)

# *
diamond(3)

# *
# ***
# *
diamond(5)
diamond(9)

#     *
#   ***
#   *****
# *******
# *********
# *******
#   *****
#   ***
#     *