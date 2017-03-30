# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

puts "What is your age?"
current_age = gets.chomp.to_i
puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i
working_years = retire_age - current_age

current_year = Time.new.year
retirement_year = current_year + working_years


puts "It's #{current_year}. You will retire in #{retirement_year}.
You have only #{working_years} years of work to go!"