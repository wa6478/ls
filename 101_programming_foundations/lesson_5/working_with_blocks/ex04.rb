# Example 4

# Here's another example.

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
# Can you take this code apart, just like before? What will be output and what will be the value of my_arr? Check the solution below once you have tried this on your own.

# output:
# 18
# 7
# 12
# => [[18, 7], [3, 12]]

# Line  Action      Object                   Side Effect    Return Value                               Is Return Value Used?
# 1     assignment  result of each on array  none           same as object variable is assigned to     no
# 1     each method array                    none           [[18, 7], [3, 12]] (calling object)        yes, in assignment to my_arr
# 1-7   block exec  each subarray from array none           last eval expression from nested each      no
# 2     each method subarray                 none           [18, 7] and [3, 12] (each subarray)        yes, used to determine outer block
# 2-6   block exec  each num from subarray   none           output of conditional                      no
# 3     if cond     current num pass by bloc none           conditionals evaluate to nil or return val yes, used to determine inner block
# 4     puts        current num pass by bloc print num      nil                                        yes, used in the output of if           
 