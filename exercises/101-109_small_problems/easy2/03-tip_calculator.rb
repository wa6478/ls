#this is the exercise with the number formats


# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

puts "what's the bill $"
bill = gets.chomp.to_f
puts "what's the tip %"
tiprate = gets.chomp.to_f

tip = bill * (tiprate / 100)
total = bill + tip

puts "tip is #{sprintf("%.2f", tip.round(2))}" 
puts "total is #{format("%.2f", total.round(2))}" # can use #format instead of #sprintf as well

# thing to note about the number format is that the first argument is parsed as:
# "%[flags][width][precision]type"
# so the argument I used here didn't have a flag or width, but did have a precision and a type
# .2 was my precision
# type f in this case indicates digits after the decimal
# there are ton of different ways to use this formatting thing