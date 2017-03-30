# Question 10

# If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# A:

purse = Bag.new('color', 'material')
puts purse.inspect

sportspack = Bag.new
puts sportspack.inspect

# my question is will it reject my new object method invocation if I don't give it at least two arguments, or would it just assign them nil
# my guess is raise an exception because the parameters were not initialized and it was expecting two arguments
# confirmed: intialize method invocation fails if it isn't given the expected number of arguments (could be avoided by either giving it sufficient arguments or providing default values for those arguments)