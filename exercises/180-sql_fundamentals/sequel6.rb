require 'sequel'

DB = Sequel.connect('postgres://localhost/billing2')

sum = DB[:services].join(:customers_services, :service_id => :id )
                   .select{ sum(:price) }.first[:sum].to_f

puts format("$%0.2f", sum)

p DB[:services].join(:customers_services, service_id: :id)
               .select { sum(price).cast(:money) }

puts DB[:services].join(:customers_services, service_id: :id)
                  .select { sum(price).cast(:money) }
                  .first[:sum]

DB.disconnect