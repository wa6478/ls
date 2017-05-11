require 'Sequel'

DB = Sequel.connect('postgres://localhost/billing2')

customer_info = DB[:customers].select do
  [Sequel.as(split_part(name, ' ', 1), :first_name),
   Sequel.as(split_part(name, ' ', 2), :last_name)]
end

# further exploration: order of clauses generally doesn't matter since Sequel can change the dataset, but join order does.

customer_info.order(:last_name, :first_name)
             .limit(3)
             .left_join(:customers_services, customer_id: :customers__id)
             .distinct
             .where { price >= 15.00 }
             .left_join(:services, services__id: :service_id)
             .each { |row| puts "#{row[:last_name]}, #{row[:first_name]}" }

puts 

customer_info.order(:last_name, :first_name)
             .limit(3)
             .left_join(:services, services__id: :service_id)
             .distinct
             .where { price >= 15.00 }
             .left_join(:customers_services, customer_id: :customers__id)
             .each { |row| puts "#{row[:last_name]}, #{row[:first_name]}" }

# joined = customer_info.join(:customers_services, :customer_id => :id)
#          .join(:services, :id => :service_id)

# filter_above_15 = joined.where { price >= 15.00 }
# p filter_above_15

# distinct = filter_above_15.distinct.limit(3).order(:last_name)

# distinct.each { |row| puts "#{row[:last_name]}, #{row[:first_name]}" }

DB.disconnect