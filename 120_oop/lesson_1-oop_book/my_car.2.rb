# my_car.rb

module Overdrivable
  def overdrive
    "You just put your #{model} in overdrive!!"
  end
end

class Vehicle
  attr_reader :year, :color, :model, :speed, :top_speed
  attr_writer :speed, :color
  
  @@vehicles_on_road = 0
  
  def self.on_road
    @@vehicles_on_road
  end
  
  def initialize(year, color, model, speed=0, top_speed=120)
    @year = year
    @color = color
    @model = model
    @speed = speed # rather than using a passed in parameter, could also assign here
    @top_speed = top_speed
    @@vehicles_on_road += 1
  end
  
  def accelerate
    speed < top_speed ? self.speed += 10 : self.speed = top_speed
  end
  
  def brake
    self.speed -= 10
    self.speed = 0 if speed < 0
  end
  
  def shut_off
    self.speed = 0
  end
    
  def old
    "Your #{model} is #{age} years old."
  end
  
  def spray_paint(new_color)
    puts "So you wanna change the color of your vehicle to #{new_color}, huh? I guess it's your vehicle after all..."
    self.color = new_color
  end  
  
  def to_s
    "#{year} #{color} #{model} with a top speed of #{top_speed} mph, moving at #{speed} mph!!!"
  end # this is calling getter methods
  
  private
  
  def age
    Time.now.year - year.to_i
  end
end

class MyTruck < Vehicle
  AXLES = 4
  
  def axles
    "This #{model} has #{AXLES} load bearing axles."
  end
  
end

class MyCar < Vehicle
  include Overdrivable
  PASSENGERS = 5
  
  def capacity
    "This #{model} can carry #{PASSENGERS} passengers."
  end
  
end

taurus = MyCar.new('1999', 'Green', 'Ford Taurus')
puts taurus.capacity
puts taurus.spray_paint('bluey')
puts taurus
avalanche = MyTruck.new('2001', 'Burgundy', 'Nissan Avalanche')
puts avalanche.axles
puts avalanche.spray_paint('gold')
puts avalanche
puts Vehicle.on_road
puts taurus.overdrive


puts avalanche.old
puts taurus.old
puts avalanche.age

puts MyCar.ancestors

