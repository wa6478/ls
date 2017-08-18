arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

# new_arr = arr.delete_if { |word| word.start_with?("s") || word.start_with?("w") }
new_arr = arr.delete_if { |word| word.start_with?("s", "w", "i") }
p new_arr