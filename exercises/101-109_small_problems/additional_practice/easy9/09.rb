# Grade book

# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

# Numerical Score Letter	Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'
# Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

# Example:

# - input: 3 integers
#   - all values will be 0 and 100
# - output: string representing grade

# - determine the mean (avg) of the three input scores
# - return the letter grade associated with that score

# - algo:
#   - put input into an array
#   - inject(:+) on array and divide by array.size
#   - case statement with the different grade ranges
#     - returns grade that matches mean

def get_grade(a, b, c)
  grades = a, b, c
  mean = grades.inject(:+) / grades.size
  case mean
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  when 0...60 then 'E'
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"