# Alphabetical Numbers

# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# NUMBERS_TO_ALPHA = (0..19).to_a.zip(%w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)).to_h
# ALPHA_TO_NUMBERS = {}
# NUMBERS_TO_ALPHA.map { |k, v| ALPHA_TO_NUMBERS[v] = k }

# def alphabetic_number_sort(array)
#   result = array.map { |number| NUMBERS_TO_ALPHA[number] }
#   result.sort.map { |alphanum| ALPHA_TO_NUMBERS[alphanum] }
# end

# solution is so much cleaner
# 1 - uses an array instead of a hash... seems so obvious. something to keep in mind
# 2 - just sort_by on the array lookup
# although, using sort was the further exploration, so I did that ha

NUMBER_WORDS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end


puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]