require 'sequel'

DB = Sequel.connect("postgres://localhost/sequel-single-table")

def dollars(input)
  format("$%.2f", input)
end

result = DB[:menu_items].select do
  labor_calc = prep_time / 60.0 * 12
  profit_calc = menu_price - ingredient_cost - labor_calc
  [item, menu_price, ingredient_cost, labor_calc.as(labor), profit_calc.as(profit)]
end

result.each do |row|
  # labor = row[:prep_time].to_f / 60 * 12
  # profit = row[:menu_price] - row[:ingredient_cost] - labor
  
  puts "#{row[:item]}"
  puts "menu price: #{dollars(row[:menu_price])}"
  puts "ingredient cost: #{dollars(row[:ingredient_cost])}"
  puts "labor: #{dollars(row[:labor])}"
  puts "profit: #{dollars(row[:profit])}"
  puts 
end