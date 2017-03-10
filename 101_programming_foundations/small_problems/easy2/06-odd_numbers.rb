# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

# 1...100.times { |number| puts number if number.odd? }

# alternate

1.step(99, 2) { |number| puts number }

1.upto(99) { |number| puts number if number.odd? }