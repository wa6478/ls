require 'sequel'

DB = Sequel.connect('postgres://localhost/billing2')

output = DB[:customers].join(:customers_services, customer_id: :id)
                       .join(:services, id: :service_id)

output.select(:name).order(:name).distinct.each do |row|
  customer = row[:name]
  puts customer
  output.order(:name, :description).where(:name => customer).each do |customer_row|
    puts "  #{customer_row[:description]} #{format("$%0.2f",customer_row[:price])}"
  end
end

DB.disconnect