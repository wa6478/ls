require 'byebug'


def old_roman(number)
  old_roman_string = ""

  roman_numerals = [
    [1000, "M"],
    [500, "D"],
    [100, "C"],
    [50, "L"],
    [10, "X"],
    [5, "V"],
    [1, "I"]]
  
  roman_numerals.each do |numeral|
    integer, string = numeral
    old_roman_string << (string * (number / integer))
    number -= (number / integer) * integer
  end
  

  p old_roman_string
end


puts old_roman(5) == "V"
puts old_roman(9) == "VIIII"
puts old_roman(20) == "XX"
puts old_roman(51) == "LI"
puts old_roman(163) == "CLXIII"
puts old_roman(596) == "DLXXXXVI"
puts old_roman(1666) == "MDCLXVI"



def new_roman(number)
  new_roman_string = ""
  
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
  #only 1, 10, and 100 are used as "subtractive" -- therefore V, L, and D don't appear as a prefix like IX does or CD.
  
  roman_numerals.each do |numeral|
    integer, string = numeral
    new_roman_string << (string * (number / integer))
    number -= (number / integer) * integer
  end
  
  new_roman_string
end

puts 0.step(100,1) { |number| puts new_roman(number) + " #{number}" }