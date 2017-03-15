# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

def which_century(year)
  year.to_s[-1] == "0" ? (year / 100).to_s : (year / 100 + 1).to_s
end

def numberth(number)
  str_number = number.to_s
  case 
  when ["11", "12", "13"].include?(str_number[-2, 2]) then "th"
  when str_number[-1] == "1" then "st"
  when str_number[-1] == "2" then "nd"
  when str_number[-1] == "3" then "rd"
  else "th"
  end
end

# alternatively, could use modulo 10 to figure out the last digit, which would make the case when statement a lot cleaner

def century(year)
  which_century(year) + numberth(which_century(year))
end

# Examples:

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'

=begin
understand
-input
  integer representing a year
-output
  a string showing what "th" century the year falls in

requirements
 - what century a given year falls into given the defintion that new centuries begin in year 01 and end in 00
  -   1 - 100 - 1st century
  - 101 - 200 - 2nd century
  - 201 - 300 - 3rd century
  basically it's year / 100 + 1 unless it's an 00 year, then it's just 100 / 1

- whether it's a "st / nd / rd / th" number
  - 1st, 2nd, 3rd, 4th - 10th
  - 11, 12, 13 th are th even though 1, 2, 3
  - 21, 22, 23 back to st, nd, rd again

  1 st
  2 nd
  3 rd
  0, 4-9 th
  except 11, 12, 13



=end