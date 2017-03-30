# Triangle Sides

# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# - triangle validator (true for all trianglees)
#   - validating that: 
#     - sum of the lengths of the two shortest sides must be greater than longest
#     - all sides must be greater than 0

# in of 3 integers representing lengths of the sides of a triangle
# out is a symbol

# thinking a few helper methods just to keep this all organized
# case statements that if certain things are true, they will pass the desire symbol output
# isosceles seems to be hardest to test for, so I'm going to make it my else case

def triangle_valid?(sides) # sorted by length
  sides.all? { |s| s > 0 } && sides[1] + sides[2] > sides[0]
end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort.reverse
  
  case 
  when triangle_valid?(sides) == false
    :invalid
  when sides[0] == sides[1] && sides[1] == sides[2]
    :equilateral
  when sides[0] != sides[1] && sides[1] != sides[2]
    :scalene
  else
    :isosceles
  end
end

# Examples:

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid