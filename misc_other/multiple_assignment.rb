def test1(arg, *args)
  p arg
  p args
end

test1(1, 2, 3, 4, 5, 6)
arr1 = [5, 5, 5]
test1(1, arr1)
test1(1, *arr1)

def test2(arg, *args, arg2)
  p arg
  p args
  p arg2
end

# test2(1, 2, 3, 4, 5, 6)

# can't have more than one splat argument