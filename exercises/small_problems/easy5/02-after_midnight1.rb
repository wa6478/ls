# After Midnight (Part 1)

# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

# Disregard Daylight Savings and Standard Time and other complications.

# input: a positive or negative integer
#  - this represents the number of minutes before or after midnight
# output: a string in hh:mm format
# model:
#  - first have to determine how many hours this represents
#  - then convert that into a time format, that obviously spins around like a clock would
#    - maybe we can ignore anything greater than 24 hours, and just use the remaining difference to determine the exact position in terms of remaining hours and minutes
#      - perhaps determine what 24 hours in minutes is, get the remainder of input / 24 hours-in-minutes and use that to position the clock
#      - will have to account for + - but before that
#      - can use modulo 60 to figure out how many hours to move forward or backward
#      - maybe we can have an array of hours and an array of minutes, and move along that (would work nice because even negative numbers would be able to correctly index, and midnight starts at 0)
#  - once i have my target number, will need to make sure to convert in to hh.mm format (perhaps by adding zeros and grabbing the digits on the right)


# def time_of_day(minutes_to_shift)
#   hours = (0..23).to_a
#   minutes = (0..59).to_a
#   minutes_on_clock = minutes_to_shift % (24 * 60)
#   hours_offset, minutes_offset = minutes_on_clock.divmod(60)
#   hh = ('0' + hours[hours_offset].to_s)[-2, 2]
#   mm = ('0' + minutes[minutes_offset].to_s)[-2, 2]
#   "#{hh}:#{mm}"
# end

# from solution:
# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

# def time_of_day(delta_minutes)
#   delta_minutes =  delta_minutes % MINUTES_PER_DAY
#   p delta_minutes
#   hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
#   p hours
#   p minutes
#   format('%02d:%02d', hours, minutes)
# end

# my modified version after seeing solution, and how it uses the fact that -3 % 1440 == 1437
# still got to the fundamental right place in my solution, just didn't really need the arrays (which kinda makes sense, but I suppose I was thinking of a -3 minute clicking backwards on an array to 57)

# def time_of_day(minutes_to_shift)
#   # hours = (0..23).to_a
#   # minutes = (0..59).to_a
#   minutes_on_clock = minutes_to_shift % (24 * 60)
#   hours_offset, minutes_offset = minutes_on_clock.divmod(60)
#   format('%02d:%02d', hours_offset, minutes_offset)
# end

# signature of Kernel#format: format(format_string [, arguments...] ) → string
# so can have multiple arguments ... still not 100% on how that works, but there seem to be many different ways to use it, so I'm going to just keep this implementation in mind for later use

# further exploration
# rewrite with Date / Time methods

# can create a 00:00 time object by using Time.new(year)
# time is added to and removed from a time object in seconds, so will want a CONSTANT for minutes and hours in terms of seconds

MINUTES_PER_DAY = 24 * 60
MINUTES_PER_WEEK = MINUTES_PER_DAY * 7
SECONDS_PER_MINUTE = 60
SECONDS_PER_HOUR = 60 * SECONDS_PER_MINUTE # had errors here because the way I had my constants set up
SECONDS_PER_DAY = 24 * SECONDS_PER_HOUR # important to pay attention what I'm setting as my constants
SECONDS_PER_WEEK = 7 * SECONDS_PER_DAY
DAYS_OF_WEEK = (0..6).to_a.zip(['sun','mon','tue','wed','thu','fri','sat']).to_h

# from there I can just add / subract the minutes and then call Time#hour and Time#min

def time_of_day(minutes)
  delta = minutes % MINUTES_PER_DAY
  time = Time.new(2017)
  delta_time = time + delta * SECONDS_PER_MINUTE
  hour = delta_time.hour
  minute = delta_time.min
  format('%02d:%02d', hour, minute)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
puts time_of_day(-1440) == "00:00"
puts time_of_day(1440) == "00:00"

#further exploration for weekday
#can use Time#wday method to return a digit representing the day of the week, Sunday == 0

def time_of_day(minutes)
  delta = minutes % MINUTES_PER_WEEK
  time = Time.new(2017,2,12)
  delta_time = time + delta * SECONDS_PER_MINUTE
  hour = delta_time.hour
  minute = delta_time.min
  weekday = delta_time.wday
  "#{DAYS_OF_WEEK[weekday]} #{format('%02d:%02d', hour, minute)}"
end

puts time_of_day(0)
puts time_of_day(-3)
puts time_of_day(35) 
puts time_of_day(-1437)
puts time_of_day(3000)
puts time_of_day(800) 
puts time_of_day(-4231)
puts time_of_day(-1440) 
puts time_of_day(1440) 
