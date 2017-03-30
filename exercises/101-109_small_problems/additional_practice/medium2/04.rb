# Matching Parentheses?

# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# Examples:

def balanced?(string)
  open_count = 0
  string.chars.each do |char|
    return false if open_count < 0
    open_count += 1 if char == '('
    open_count -= 1 if char == ')'
  end
  
  open_count == 0
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
# Note that balanced pairs must each start with a (, not a ).