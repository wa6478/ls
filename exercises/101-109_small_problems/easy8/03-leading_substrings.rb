# Leading Substrings

# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

# Examples:

def substrings_at_start(string)
  result = []
  string.length.times { |idx| result << string[0..idx] }
  result
end

# using each_object([])

def substrings_at_start(string)
  string.chars.each_index.with_object([]) { |idx, arr| arr << string[0..idx] }
end

# using upto

def substrings_at_start(string)
  1.upto(string.size).with_object([]) { |count, arr| arr << string[0, count] }
end

# times with unnecessary chars.take.join instead of slice

def substrings_at_start(string)
   string.size.times.with_object([]) { |idx, arr| arr << string.chars.take(idx + 1).join}
end

# clean times + each object with slice

def substrings_at_start(string)
  string.size.times.with_object([]) { |idx, arr| arr << string[0..idx] }
end

# recursive

def substrings_at_start(string, arr=[])
  return arr if arr.size == string.size
  arr << string[0..arr.size]
  substrings_at_start(string, arr)
end

# using map because it already returns an array is very helpful

def substrings_at_start(string)
  (1..string.size).map { |count| string[0, count] }
end

# one line recursive... dangerous territory haha

def substrings_at_start(string)
  string.size <= 1 ? [string] : [*substrings_at_start(string.chop), string] 
end

# 1: s_a_s('abc') => [*s_a_s('ab'), 'abc'] 
# 2: s_a_s('ab') => [*s_a_s('a'), 'ab']
# 3: s_a_s('a') => ['a']
# ['a', 'ab', 'abc']
# the * returns the contents of array at each level, and thereby prevents multi dimensionality

def substrings_at_start(string)
  string.size <= 1 ? [string] : [substrings_at_start(string.chop), string].flatten
end
# 1: s_a_s('abc') => [s_a_s('ab'), 'abc']
# 2: s_a_s('ab') => [s_a_s('a'), 'ab']
# 3: s_a_s('a') => ['a']
# [[['a'], 'ab'], 'abc']
# since we're not using the * "modifier" (correct name?) we get a multidimensional array from each level of recursion
# so we use flatten to remove those levels

puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']