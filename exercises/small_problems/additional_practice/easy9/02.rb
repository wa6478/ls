# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

# Examples:

# - input: integer
#   - assume valid input
# - output: 2x the number unless doubled number, in which case return the doubled number

# - what is a doubled number?
#   - even number of digits
#   - left side digits match right side digits
#   - ex: 103103, 44, 3333, 7676
#   - NOT: 444, 334433, 107
  
# - how to identify a doubled number?
#   - look at string of the number
#   - string length even?
#   - left half identical to right half?
#   - if TRUE, then doubled number
  
# - algo
#   - number to string
#   - string.length even?
#   - IF TRUE
#     - middle of string = string.length / 2 - 1
#     - string[0..middle] == [middle + 1.. -1]
#     - TRUE: return number
#   - ELSE 2 x number

def twice(num)
  num_str = num.to_s
  middle = num_str.length / 2 - 1
  
  if num_str.length.even?
    if num_str[0..middle] == num_str[middle + 1..-1]
      return num
    end
  end
  
  num * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10

# Note: underscores are used for clarity above. Ruby lets you use underscores when writing long numbers; however, it does not print the underscores when printing long numbers. Don't be alarmed if you don't see the underscores when running your tests.