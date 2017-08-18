# Example 5

# Next, let's tackle a slightly more complex example.

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# => [[2, 4], [6, 8]]

# What will the return value be in this example? Use what you've learned so far to break it down on your own before checking the solution below.

# Line  Action      Object         Side Effect    Return Value            Is Return Value Used?
# 1     Arr#map     array          none           transformed new array   no
# 1-5   block exec  each arr       none           value of nested map     yes to determine transformed new array
# 2     Arr#map     arr            none           transformed new array   yes to determine each block return in outer block
# 2-4   block exec  num            none           last eval expression    yes to determine transformed new array
# 3     *           num            none           num * 2                 yes to determine each block return in inner block