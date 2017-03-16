# Example 10

# Let's say we have the following data structure of nested arrays and we want to increment every number by 1 without changing the data structure.

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

# This example is more complicated than the rest, but at this point you should be able to break it down effectively. Use the tools you've learned about in this lesson and take as much time as needed. Work on breaking down each component and understanding the return value of each expression. What will be the final return value? Check the solution only after you've tried this on your own.

# we call map on an array object
# this will pass each element to the following block and return a new array with the return value from each block's execution
# we call map on each element passed from the original array object and pass each inner element of the element to the block and return a value from each block's execution
# we check if the element is an integer by converting it so a string and checking that the size == 1
# if true, the block returns the inner element + 1
# else, it will call map on the inner element and pass it's inner inner element to the inner inner block
# the inner inner block will add + 1 to the inner inner element and return it to the transformed map array
#
# output will be #> [[[2, 3], [4, 5]], [6, 7]]

# maybe try to describe with eight or fewer words per line
# we call map on an array
# we call map on each element passed
# the inner element of each element is tested
# if it's an integer return element += 1
# else call map on each inner element passed
# inner inner element += 1
# maps return their modified arrays to calling objects