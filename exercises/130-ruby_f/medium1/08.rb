# Using this information, together with the course page linked above, fill in the missing part of the following code so we can convert an array of integers to base 8. Use the comments for help in determining where to make your modifications, and make sure to review the "Approach/Algorithm" section for this exercise; it should prove useful.

def convert_to_base_8(n) # define a method
  n.to_s(8).to_i
end

# The correct type of argument must be used below
puts method(:convert_to_base_8).class
base8_proc = method(:convert_to_base_8).to_proc # use Object#method to create a Method object by passing in the method name as a symbol -- then use Method#to_proc to convert that Method object into a Proc
puts base8_proc.class

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
p [8,10,12,14,16,33].map(&base8_proc) # use & to convert the proc into a block

# The expected return value of map on this number array should be:

# [10, 12, 14, 16, 20, 41]