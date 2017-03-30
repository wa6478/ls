# Name Swapping

# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

# Examples

# - input: string
#   - firstname lastname
# - output: string
#   - lastname, firstname
  
# - algo
#   - split str, then call #{} with a comma
  
def swap_name(string)
  first, last = string.split
  "#{last}, #{first}"
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'
puts swap_name('Homer Simpson') == 'Simpson, Homer'
puts swap_name('Def Leppard') == 'Leppard, Def'
puts swap_name('Bruce Wayne') == 'Wayne, Bruce'