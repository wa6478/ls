# Grade book

# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

# Numerical Score Letter  Grade
# 90 <= score <= 100  'A'
# 80 <= score < 90  'B'
# 70 <= score < 80  'C'
# 60 <= score < 70  'D'
# 0 <= score < 60 'F'
# Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

# Example:

GRADES = {
  (90..100) => 'A',
  (80...90) => 'B',
  (70...80) => 'C',
  (60...70) => 'D',
  (0...60) => 'F'
}

def get_grade(gr1, gr2, gr3)
  mean = (gr1 + gr2 + gr3) / 3
  GRADES.each do |range, grade|
    return grade if range.include?(mean)
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"