
require 'Sequel'

DB = Sequel.connect("postgres://localhost/billing2")

# customer ids in customers_services
customer_ids = DB[:customers_services].select(:customer_id)
p customer_ids

no_service_customers = DB[:customers].exclude(:id => customer_ids)
p no_service_customers

no_service_customers.each { |row| p row.values }

DB.disconnect