# In this exercise, you will write a method named xor that takes two arguments, and returns true if exactly one of its arguments is true, false otherwise.

# Examples:

# def xor?(bool1, bool2)
#   return true if (bool1 == true)  && (bool2 == false) # could use || for these two statements but then it would feel too long horizontally
#   return true if (bool1 == false) && (bool2 == true)
#   false
# end

# more truncated version

def xor?(bool1, bool2)
  (bool1 && !bool2) || (!bool1 && bool2) # (I think that would work because by definition they are mutually exclusive conditions)
end


puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false


=begin # pseudo code
what do true conditions look like?
bool1 is true and bool2 is false
bool1 is false and bool2 is true

what do false conditions look like
bool1 is true and bool2 is true
bool1 is false and bool2 is false
=end
