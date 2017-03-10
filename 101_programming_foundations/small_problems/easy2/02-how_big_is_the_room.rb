# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

# SQ_METERS_TO_SQ_FEET = 10.7639

# puts ">> Please provide length of room in meters"
# length = gets.chomp.to_f

# puts ">> Please provide width of room in meters"
# width = gets.chomp.to_f

# area_meters = length * width
# area_feet = area_meters * SQ_METERS_TO_SQ_FEET

# puts "The area of the room is #{area_meters.round(2)} square meters (#{area_feet.round(2)} square feet)."


puts "\n ---- further exploration ----"

SQ_METERS_TO_SQ_FEET = 10.7639
SQ_METERS_TO_SQ_INCHES = SQ_METERS_TO_SQ_FEET * (12 * 12)
SQ_METERS_TO_CM = SQ_METERS_TO_SQ_INCHES * (2.54 * 2.54)

puts ">> Please provide length of room feet"
length = gets.chomp.to_f

puts ">> Please provide width of room in feet"
width = gets.chomp.to_f

area_feet = length * width
area_meters = (length * width) / SQ_METERS_TO_SQ_FEET
area_inches = area_meters * SQ_METERS_TO_SQ_INCHES
area_cm = area_meters * SQ_METERS_TO_CM

puts "The area of the room is 
  #{area_feet.round(2)} square feet, or
  #{area_inches.round(2)} square inches, or
  #{area_cm.round(2)} square centimeters."
