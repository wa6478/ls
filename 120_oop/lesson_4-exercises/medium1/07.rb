# Question 7

# How could you change the method name below so that the method name is more clear and less repetitive.

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end

# A:

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    self.brightness = brightness # utilize setter methods
    self.color = color
  end

  def self.default_preference # change to be more specific about this since it's a class method
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end

# from the solution, the key is to avoid repeating class names in class methods
# i.e. `Light.information` reads better than `Light.light_information`
