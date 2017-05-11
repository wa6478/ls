require 'sequel'

DB = Sequel.connect("postgres://localhost/billing2")

customers = DB[:customers]
puts "customers: #{customers.inspect}"

columns = customers.select(Sequel.qualify(:customers, :id), :name, :payment_token)
puts "column: #{columns.inspect}"

distinct = columns.distinct
puts "distinct: #{distinct.inspect}"

joined = distinct.join(:customers_services, :customer_id => :id)
puts "joined: #{joined.inspect}"

puts
joined.each { |row| puts row }

# result = DB[:customers].join(:customers_services, :customer_id => :id)
#                        .select{ [customers[:id], name, payment_token] }
#                        .distinct
#                        .order { customers[:id] }

# result.each { |r| puts [r[:id], r[:name], r[:payment_token]].join(', ') }

DB.disconnect

