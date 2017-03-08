daylight = [true, false].sample

def daynight(light)
  puts "it's day" if light
  puts "it's night" if light == false
end

daynight(daylight)