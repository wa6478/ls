=begin

# write out pseudo-code (both casual and formal) that does the following:

# a method that returns the sum of two integers

START
  PRINT please provide first integer
  SET number1 = GET first integer
  PRINT please provide second integer
  SET number2 = GET second integer

  number1 + number2 (remember to convert string to integer)
END


# a method that takes an array of strings, and returns a string that is all those strings concatenated together

START

#given an array of strings
SET concatenated_string = ""

SET iterator = 0
WHILE iterator < array size
  push string from array at iterator location to concatenated_string
  iterator = iterator + 1


PRINT concatenated_string

END

# a method that takes an array of integers, and returns a new array with every other element

START

#given an array of integers

SET every_other_array = []

SET iterator = 0
WHILE iterator < array size
  check if array at iterator location returns nil, if so break loop
  push item from array at iterator location to every_other_array
  iterator = iterator + 2

PRINT every_other_array

=end