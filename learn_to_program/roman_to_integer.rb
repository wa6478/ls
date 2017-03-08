require 'byebug'

def roman_to_integer(romannumber)
  
  roman_numerals = [
  [1000, "M"],
  [900, "CM"],
  [500, "D"],
  [400, "CD"],
  [100, "C"],
  [90, "XC"],
  [50, "L"],
  [40, "XL"],
  [10, "X"],
  [9, "IX"],
  [5, "V"],
  [4, "IV"],
  [1, "I"]]
    
  translated_number = 0
  
  idx = 0
  until idx >= romannumber.length
    newidx = idx + 1
    current_string = ""

    current_string = romannumber[idx] + romannumber[idx + 1] unless romannumber[idx + 1] == nil
  
    roman_numerals.each do |numeralset|
      if numeralset[1] == current_string
        translated_number += numeralset[0]
        newidx += 1
      end
    end
    
    #check to see if the above changed the index to see if we need to check single char
    if newidx - 1 == idx
      current_string = romannumber[idx]
      roman_numerals.each do |numeralset|
        if numeralset[1] == current_string
          translated_number += numeralset[0]
        end
      end
    end
    idx = newidx

  end
  
  translated_number
end

puts roman_to_integer("LXI")
puts roman_to_integer("MCMXCIX")
puts roman_to_integer("XCV")
puts roman_to_integer("LI")