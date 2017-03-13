# As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

# two methods that do the following
# - input:
#   hh:mm
# - output:
#   how many minutes before or after midnight
# - model:
#   method1 - after midnight
#   hh * 60 unless 24 + minutes
# - method2 - before midnight: model1 - 1439

def after_midnight(time)
  time = '00:00' if time == '24:00'
  time[0, 2].to_i * 60 + time[-2, 2].to_i
end

def before_midnight(time)
  after_midnight(time) % -1440
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == -686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0