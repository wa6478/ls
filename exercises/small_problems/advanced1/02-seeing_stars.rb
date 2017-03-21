# Seeing Stars

# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

# Examples

def half(n)
  rows = []
  empty_chars = (n - 3) / 2
  (n / 2).times do
    rows << '*' + ' ' * empty_chars + '*' + ' ' * empty_chars + '*'
    empty_chars -= 1
  end
  rows
end

def star(n)
  top = half(n)
  middle = ['*' * n]
  bottom = top.reverse
  (top + middle + bottom).each do |row|
    puts row.center(n)
  end
end

star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *
star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *

star(11)

star(15)