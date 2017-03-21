# 101-109 - Small ProblemsMedium 2Matching Parentheses?
# Matching Parentheses?

# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
# Note that balanced pairs must each start with a (, not a ).

# Examples:

def balanced?(string)
  open_counter = 0
  string.chars.each do |char|
    return false if open_counter < 0

    case char
    when '(' then open_counter += 1
    when ')' then open_counter -= 1
    end

  end

  open_counter == 0
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false