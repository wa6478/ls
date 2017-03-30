# Start the Engine (Part 1)

# Modify the following code so that #start_engine is invoked upon initialization of truck1.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year)
    super(year) # if you were to invoke super without parentheses, it defaults to passing all arguments to the superclass's method
    start_engine
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year

# Expected output:

# Ready to go!
# 1994