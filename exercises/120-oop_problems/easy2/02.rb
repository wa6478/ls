# Fix the Program - Drivable

# Correct the following program so it will work properly. Assume that the Car class has a complete implementation; just make the smallest possible change to ensure that cars have access to the drive method.

module Drivable
  def drive # remove self -- otherwise this ends up being a module method (does it become a class method? No -- has to be called via Drivable.drive by the class, and not at all accessible by instance methods)
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive