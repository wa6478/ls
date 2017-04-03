# Optional Blocks

# Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.

def compute
  block_given? ? yield : 'Does not compute.'
end

# Examples:

puts compute { 5 + 3 } == 8
puts compute { 'a' + 'b' } == 'ab'
puts compute == 'Does not compute.'

# further exploration

def compute(arg)
  block_given? ? yield(arg) : 'Does not compute'
end

puts compute(1) { |n| n + 1 }
puts compute(5) { |n| n + 1 }
puts compute(5)