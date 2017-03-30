# Name Swapping

# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

# Examples

def swap_name(name)
  split_name = name.split
  "#{split_name[-1]}, #{split_name[0]}"
end

def swap_name(name)
  name.split.reverse.join(', ')
end


puts swap_name('Joe Roberts') == 'Roberts, Joe'