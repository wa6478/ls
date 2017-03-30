# Question 2

# Ben and Alyssa are working on a vehicle management system. So far, they have created classes called Auto and Motorcycle to represent automobiles and motorcycles. After having noticed common information and calculations they were performing for each type of vehicle, they decided to break out the commonality into a separate class called WheeledVehicle. This is what their code looks like so far:

module Travelable
  attr_accessor :speed, :heading
  
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end
  
  # alternatively to moving part of the initialize method to the module, could have created setter methods for these instance variables in the Module which then the classes could call via self.setter_method
  # maybe cleaner if you don't want your initialize all split up, but by passing the arguments to `super` it actually isn't too unclear
  # nice to know that there are multiple ways to tackle a problem like this
  
  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Travelable
  
  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    super(km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end
# Now Alan has asked them to incorporate a new type of vehicle into their system - a Catamaran defined as follows:

class Catamaran
  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end
# This new class does not fit well with the object hierarchy defined so far. Catamarans don't have tires. But we still want common code to track fuel efficiency and range. Modify the class definitions and move code into a Module, as necessary, to share code among the Catamaran and the wheeled vehicles.

# A:
# I think the approach here would be to extract from the Wheeled Vehicle class everything that would be common amongst all vehicles and stick that into a module
# This would minimize the amount of rework on the existing classes and lets them function as is.

# Question 3

# Building on the prior vehicles question, we now must also track a basic motorboat. A motorboat has a single propeller and hull, but otherwise behaves similar to a catamaran. Therefore, creators of Motorboat instances don't need to specify number of hulls or propellers. How would you modify the vehicles code to incorporate a new Motorboat class?

# would create a new motorboat class
# I see two sort of intuitive paths here:
#   one - create a new parent class for WaterVehicles
#   two - create a Floatable module that captures some of the commonality between vehicles that float
#   the way they would be coded up would be almost identical, except the former requires making the other two subclasses, and the latter would require that we `include` the module
# going to go ahead and go with the module since that's something I'd like to practice a little more

module Floatable
  attr_accessor :propeller_count, :hull_count
end

class Motorboat < Sea
  include Travelable
  include Floatable
  
end

class Catamaran
  include Travelable
  include Floatable

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end

# going to revise to have parent class instead to be in line with solution

class Seacraft
  include Travelable
  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super(km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
  end

  def range
    super + 10
  end
end  
  
class Motorboat < Seacraft
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

class Catamaran < Seacraft
end