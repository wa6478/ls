# Right Triangles

# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

# in: integer 
# out: strings
# notes:
# - will have as many rows as there are integers
# - the bottom row will be all *s
# - top row starts with one star on the very right
# - should be able to use a loop construct that at each iteration prints TOTAL - iteration ' ' + iteration "*"
# - should be able to use a times loop for the five rows

def triangle(number)
  number.times do |count|
    space = ' ' * (number - (count + 1))
    star  = '*' * (count + 1)
    puts space + star
  end
end


# Further Exploration

# Try modifying your solution so it prints the triangle upside down from its current orientation. 

def triangle(number)
  number.times do |count|
    space = ' ' * count
    star  = '*' * (number - count)
    puts space + star
  end
end

# Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.

def triangle(number, coord=4) # coord responds to 1, 2, 3, or 4
  case coord
  when 1   # top-left-corner
    top    = '*'
    bottom = ' '
    start  = 'left'   # top starts from which side
  when 2    # bottom-right-corner
    top    = ' '
    bottom = '*'
    start  = 'left'   # top starts from which side
  when 3    # bottom-left-corner
    top    = ' '
    bottom = '*'
    start  = 'right'  # top starts from which side
  when 4    # top-right-corner
    top    = '*'
    bottom = ' '     
    start  = 'right'  # top starts from which side
  end

  number.times do |count|
    case top
    when ' '
      right = bottom * (count + 1)
      left  = top    * (number - count + 1)
    when '*'
      right = bottom * count
      left  = top    * (number - count)
    end
    if start == 'right'
      puts right + left
    else
      puts left + right
    end
  end
end

# using rjust

def triangle(number)
  number.times do |count|
    puts ('*' * (count + 1)).rjust(number)
  end
end

# could use ljust and rjust to create a cleaner version of the 4 ways above

def triangle(number, coord=4)
  case coord
  when 1 #top-left
    number.times do |count|
      puts ('*' * (number - count)).ljust(number)
    end
  when 2 #top-right
    number.times do |count|
      puts ('*' * (number - count)).rjust(number)
    end
  when 3 #bottom-left
    number.times do |count|
      puts ('*' * (count + 1)).ljust(number)
    end
  when 4 #bottom-right
    number.times do |count|
      puts ('*' * (count + 1)).rjust(number)
    end
  end

  loop do
  
  end
end

# using upto and downto for slightly cleaner look

def triangle(number, coord=1)
  case coord
  when 1 #top-left
    number.downto(1) do |count|
      puts ('*' * count).ljust(number)
    end
  when 2 #top-right
    number.downto(1) do |count|
      puts ('*' * count).rjust(number)
    end
  when 3 #bottom-left
    1.upto(number) do |count|
      puts ('*' * count).ljust(number)
    end
  when 4 #bottom-right
    1.upto(number) do |count|
      puts ('*' * count).rjust(number)
    end
  end
end

# can assign the string to a variable on whether it's left or right? might make things less readable

triangle(5)

#     *
#    **
#   ***
#  ****
# *****
triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********