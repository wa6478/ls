def leapyearprinter(startyear,endyear)
  startyear.upto(endyear) do |year|
    puts year if isleapyear?(year)
  end
end

def isleapyear?(year)
  if year % 400 == 0
    return true
  elsif year % 100 == 0
    return false
  elsif year % 4 == 0
    return true
  else false
  end
end

puts "Please provide a starting year"
startyear = gets.chomp.to_i
puts "Please provide an end year"
endyear = gets.chomp.to_i

leapyearprinter(startyear,endyear)




#leapyears
#years divisible by 4
#not years divisible by 100 unless also divisible by 400

=begin
so go from biggest to smallest gate
divisible by 400? if yes = leap year
if no, divisible by 100? if yes = not a leap year
if no, divisible by 4? if yes = leap year
if no, then no
=end

#I think the key way for me think about this was to distill the mutually exclusive states for structuring the if statement
#For example, if I checked the divide by 4 statement first, I would still have to check the other two conditions
