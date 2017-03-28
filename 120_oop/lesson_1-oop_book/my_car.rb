# my_car.rb

class MyCar
  attr_reader :year, :color, :model, :speed, :top_speed
  attr_writer :speed, :color
  
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
  
  def info
    "#{year} #{color} #{model} with a top speed of #{top_speed} mph, moving at #{speed} mph."
  end # this is calling getter methods
end

ford = MyCar.new('2017', 'Green', 'Ford Taurus')
puts ford.info
13.times { ford.accelerate }
puts ford.info
ford.brake
ford.brake
ford.brake
puts ford.info
ford.shut_off
puts ford.info
puts ford.info
ford.color = 'Red'
puts ford.info
ford.spray_paint('Black')
puts ford.info
