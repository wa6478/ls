require 'sequel'

DB = Sequel.connect('postgres://localhost/billing2')

services = ['Unix Hosting', 'DNS', 'Whois Registration']
service_ids = DB[:services].select(:id)
                           .where(description: services)
                           .map(:id)

# customer_id = DB[:customers].insert(name: 'John Doe', payment_token: 'EYODHLCN')
service_ids.each do |service_id|
  DB[:customers_services].insert(customer_id: 7, service_id: service_id)
end

DB[:customers].each { |row| puts row }
puts
DB[:customers_services].each { |row| puts row }

DB.disconnect