puts ""
puts "test 1 ----"
puts ""
def test1(arg, *args)
  p arg
  p args
end

test1(1, 2, 3, 4, 5, 6)
arr1 = [5, 5, 5]
test1(1, arr1) # passing in just the array is as if I'm giving only one argument
test1(1, *arr1) # passing the array in with the splat is like passing in all of the individual elements as arguments
puts ""
puts "test 2 ----"
puts ""
def test2(arg, *args, arg2)
  p arg
  p args
  p arg2
end

test2(1, 2, 3, 4, 5, 6)

# can't have more than one splat argument
puts ""
puts "test 3 ----"
puts ""
def test3(*args)
  p args
end

test3(1) # even if only one argument is passed into a splat argument, the method local variable will be set to an array with the passed in argument i.e. [1]
test3(1, 2) # => [1, 2] # therefore passing in *[1, 2] is the same as passing in 1, 2
test3(*[1, 2]) # => [1, 2] # array is being decomposed by being passed in with a *
test3([1, 2]) # => [[1, 2]] # not decomposed, array is just a single argument like the [1]
puts ""
puts "test 3v2 ----"
puts ""
def test3v2(*args)
  p *args # calling splat on the method local variable which in this case will always be an array because it was a splat argument
end

test3v2(1) # => 1 # calling args with * decomposes the array that was passed in via *args
test3v2(1, 2)
test3v2(*[1, 2])
test3v2([1, 2])

puts ""
puts "test 4 ----"
puts ""

def test4(*args, arg)
  p args
  p arg
end

test4(1) # non splat argument always gets priority, so args will be [], and arg will be 1
test4(1, 2)
test4(*[1, 2]) # same as above test4(1, 2)
test4([1, 2]) # args = [], arg = [1, 2]

puts ""
puts "test 5 ----"
puts ""

def test5(arg1, *args, arg)
  p arg1
  p args
  p arg
end

test5(1, 2, 3) # => 1, [2], 3
test5(1, 2, 3, 4) # => 1, [2, 3], 4
test5([1], [1], [1]) # => [1], [[1]], [1]
test5([2], *[2], [2]) # => [2], [2], [2] # remember that whatever you feed args, it's going to stick into an array, so if you want to pass in an array's contents, make sure you decompose it when you pass it in as an argument