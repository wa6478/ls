# Question 7

# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# the instance variables and the related attr_accessor methods assuming the class method is what's important
# the instance variables are irrelevant to class methods

# but if the class method isn't important, then the class method itself is superfluous -- it can't use the instance variables, and with the getter and setter methods, there is already some functionality here

# and... the return in the class method itself is superfluous. An implict return will do fine here, no need to explicitly return.