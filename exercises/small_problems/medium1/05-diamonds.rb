# Diamonds!

# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

def how_many_stars(size, line_count, stars)
  case
  when line_count == 1
    stars
  when line_count <= size / 2 + 1
    stars + '**'
  else
    stars[0..-3]
  end
end

def diamond(size)
  stars = '*'
  1.upto(size) do |line_count|
    stars = how_many_stars(size, line_count, stars)
    puts "#{stars}".center(size)
  end
end

# using array to store possible strings and using index

def diamond(size)
  stars = []
  1.step(size, 2) { |count| stars << '*' * count }
  stars << stars.reverse[1..-1]

  size.times do |idx|
    puts "#{stars.flatten[idx]}".center(size)
  end
end

# thinking of it as two ranges

def print_stars(num, width)
  stars = '*' + '*' * (num - 1) * 2
  puts "#{stars}".center(width)
end

def diamond(size)
  top = size / 2
  bottom = size - top
  1.upto(top) { |row| print_stars(row, size) }
  bottom.downto(1) { |row| print_stars(row, size) }
end

diamond(1)
diamond(3)
diamond(5)
diamond(9)

# Examples

# diamond(1)

# *
# diamond(3)

#  *
# ***
#  *
# diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *