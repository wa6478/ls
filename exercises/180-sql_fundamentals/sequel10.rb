require 'sequel'

DB = Sequel.connect('postgres://localhost/billing2')

bulk_email_dataset = DB[:services].where(description: 'Bulk Email')
bulk_email_id = bulk_email_dataset.first[:id]

DB[:customers_services].where(service_id: bulk_email_id).delete
bulk_email_dataset.delete

DB[:customers].where(name: 'Chen Ke-Hua').delete

DB[:customers].select(%i(id name)).each { |row| puts row[:row] }
puts
DB[:customers_services].each { |row| puts row }
puts
DB[:services].select(%i(id description)).each { |row| puts row[:row] }



DB.disconnect