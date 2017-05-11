require 'Sequel'

DB = Sequel.connect('postgres://localhost/billing2')

p DB[:services].join(:customers_services, :service_id => :id)
               .group(:description)
               .having { count(customer_id) >= 3 }
               .select { [description, count(customer_id)] }
               .order(:description)
               .each { |row| puts "#{row[:description]}, #{row[:count]}"}

DB.disconnect