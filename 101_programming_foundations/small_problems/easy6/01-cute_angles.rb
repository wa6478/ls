# Cute angles

# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes, and seconds. You should use a degree symbol (˚) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. There are 60 minutes in a degree, and 60 seconds in a minute.


# Note: your results may differ slightly depending on how you round values, but should generally be within a second or two of the results shown.
# Examples:

=begin
input: float
output: string in the format DD°MM'SS"
model:
- 
One degree is equal to 60 minutes and equal to 3600 seconds:
1° = 60' = 3600"
One minute is equal to 1/60 degrees:
1' = (1/60)° = 0.01666667°
One second is equal to 1/3600 degrees:
1" = (1/3600)° = 2.77778e-4° = 0.000277778°
For angle with d integer degrees m minutes and s seconds:
d° m' s"
The decimal degrees dd is equal to:
dd = d + m/60 + s/3600
Example
Convert 30 degrees 15 minutes and 50 seconds angle to decimal degrees:
30° 15' 50"
The decimal degrees dd is equal to:
dd = d + m/60 + s/3600 = 30° + 15'/60 + 50"/3600 = 30.263888889°

decimal to dms

d = integer(30.263888889°) = 30°
m = integer((dd - d) × 60) = 15'
s = (dd - d - m/60) × 3600 = 50"

=end


def dms(number)
  d = number
  m = ((number - d) * 60)
  s = ((number - d - m) * 3600)

  "%(#{format('%02d',d)}°#{format('%02d',m)}'#{format('%02d',s)}\")"
end


puts dms(30)
puts dms(30) 
puts dms(76.73) 
puts dms(254.6)
puts dms(93.034773)
puts dms(0)
puts dms(360)

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
