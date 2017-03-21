# Fix the Bug

# The following code:

def my_method(array)
  if array.empty?
    []
  elsif # <- missing a condition
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])
# is expected to print:

# []
# [21]
# [9, 16]
# [25, 36, 49]

# However, it does not. Obviously, there is a bug. Find and fix the bug, then explain why the buggy program printed the results it did.

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1 # missing a condition
    array.map do |value| # or rather array.map becomes the condition (and it's truthy), and there is no code left to run as a result of that condition, so it returns nil
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([]) == []
p my_method([3]) == [21]
p my_method([3, 4]) == [9, 16]
p my_method([5, 6, 7]) == [25, 36, 49]