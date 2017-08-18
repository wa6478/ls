[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# Line  Action      Object         Side Effect    Return Value            Is Return Value Used?
# 1     map         outer object   none           transformed new array   no (last return value)
# 1-4   block exec  arr            none           arr.first               yes in output to the new transformed array
# 2     first       arr            none           arr[0]                  yes, used in puts
# 2     puts        arr.first      prints object  nil                     no
# 3     first       arr            none           arr[0]                  yes, as last evaluated line in block execution

# 1
# 3
# => [1, 3]

# arr == each subarray