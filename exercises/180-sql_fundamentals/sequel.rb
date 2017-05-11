require 'sequel'

def create_database
  system('dropdb', '--if-exists', 'billing2')
  system('createdb', 'billing2')
end

def create_customers
  DB.create_table(:customers) do
    primary_key :id
    String :name, text: true, null: false
    String :payment_token, null: false, fixed: true, size: 8, unique: true
    check{ payment_token =~ /^[A-Z]{8}$/ }
  end
end

def insert_customer_row(name, payment_token)
  DB[:customers].insert(name: name, payment_token: payment_token)
end

def insert_customers
  insert_customer_row('Pat Johnson', 'AAAAAAAA')
  insert_customer_row('Nancy Monreal', 'AAAAAAAB')
  insert_customer_row('Lynn Blake', 'AAAAAAAC')
  insert_customer_row('Chen Ke-Hua', 'AAAAAAAD')
  insert_customer_row('Scott Lakso', 'AAAAAAAE')
  insert_customer_row('Jim Pornot', 'AAAAAAAF')
end

def create_services
  DB.create_table(:services) do
    primary_key :id
    String :description, null: false, text: true
    BigDecimal :price, size: [10,2], null: false
    check { price >= 0.00 }
  end
end

def insert_service_row(description, price)
  DB[:services].insert(description: description, price: price)
end

def insert_services
  insert_service_row('Unix Hosting', 5.95)
  insert_service_row('DNS', 4.95)
  insert_service_row('Whois Registration', 1.95)
  insert_service_row('High Bandwidth', 15.00)
  insert_service_row('Business Support', 250.00)
  insert_service_row('Dedicated Hosting', 50.00)
  insert_service_row('Bulk Email', 250.00)
  insert_service_row('One-to-one Training', 999.00)
end

def create_customers_services
  DB.create_table(:customers_services) do
    primary_key :id
    foreign_key :customer_id, :customers, on_delete: :cascade
    foreign_key :service_id, :services
  end
end

def insert_customer_service_row(customer_id, service_id)
  DB[:customers_services].insert(customer_id: customer_id, service_id: service_id)
end

def insert_customers_services
  insert_customer_service_row(1, 1)
  insert_customer_service_row(1, 2)
  insert_customer_service_row(1, 3)
  insert_customer_service_row(3, 1)
  insert_customer_service_row(3, 2)
  insert_customer_service_row(3, 3)
  insert_customer_service_row(3, 4)
  insert_customer_service_row(3, 5)
  insert_customer_service_row(4, 1)
  insert_customer_service_row(4, 4)
  insert_customer_service_row(5, 1)
  insert_customer_service_row(5, 2)
  insert_customer_service_row(5, 6)
  insert_customer_service_row(6, 1)
  insert_customer_service_row(6, 6)
  insert_customer_service_row(6, 7)
end

DB = Sequel.connect("postgres://localhost/billing2")

create_database

create_customers
insert_customers

create_services
insert_services

create_customers_services
insert_customers_services

