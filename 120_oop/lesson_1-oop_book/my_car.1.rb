# my_car.rb

class MyCar
  attr_reader :year, :color, :model, :speed, :top_speed
  attr_writer :speed, :color
  
  ANNUAL_MILEAGE = 20_000
  
  def self.mileage(car)
    age_of_car = Time.now.year - car.year.to_i
    mileage = ANNUAL_MILEAGE * age_of_car
    "This #{car.year} #{car.model} has approximately #{mileage} miles on it."
  end
  
  def self.gas_mileage(gallons, miles)
    "#{miles / gallons} miles per gallon of gas."
  end
  
  def initialize(year, color, model, speed=0, top_speed=120)
    @year = year
    @color = color
    @model = model
    @speed = speed # rather than using a passed in parameter, could also assign here
    @top_speed = top_speed
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
  
  def spray_paint(new_color)
    puts "So you wanna change the color of your car to #{new_color}, huh? I guess it's your car after all..."
    self.color = new_color
  end  
  
  def to_s
    "#{year} #{color} #{model} with a top speed of #{top_speed} mph, moving at #{speed} mph!!!"
  end # this is calling getter methods
end

ford = MyCar.new('1999', 'Green', 'Ford Taurus')
puts ford
13.times { ford.accelerate }
puts ford
ford.brake
ford.brake
ford.brake
puts ford
ford.shut_off
puts ford
puts ford
ford.color = 'Red'
puts ford
ford.spray_paint('Black')
puts ford
puts MyCar.mileage(ford)
puts MyCar.gas_mileage(13, 200)
