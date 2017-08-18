# Question 6

# What could we add to the class below to access the instance variable @volume?

class Cube
  def initialize(volume)
    @volume = volume
  end
end

# attr_accessor :volume for both read and write access (getter and setter method)
# attr_writer :volume for just a setter method
# attr_reader :volume for just a getter method

# per the solution don't need to technically use getter methods to access an instance variable
# can use `instance_variable_get` to return a value from an instance variable
# preferable to use a getter method

# def get_volume
#   @volume
# end
