# Exercise 7

# Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# a = 2
# b = [5, 8]
# arr = [2, [5, 8]]
# arr[0] += 2  (is changing what arr[0] is pointing at, but doesn't change what a is pointing at since integers are immutable)
#   arr => [4, [5,8]]
# arr[1][0] -= a (a is still pointing at integer 2, so arr[1][0] is pointed at 3 instead of 5)
# the objects a and b are pointing at cannot be reassigned through mutation, since they are pointing at immutable objects
# the only way to reassign them is to actually assign them to different objects
# actually b is equal to [3, 8] because b is not pointing at an immutable object
# b is pointing at a collection, which includes immutable objects
# the arr[1] and b point at the same collection
# when one of the integers within the collection is modified through assignment by index, it's reflected in both 'b' and the array