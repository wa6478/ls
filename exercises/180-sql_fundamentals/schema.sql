CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8) NOT NULL UNIQUE CHECK (payment_token ~ '^[A-Z]{8}$' )
  );

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10,2) NOT NULL CHECK (price >= 0.00)
  );

CREATE TABLE customers_services (
  customer_id integer NOT NULL REFERENCES customers(id),
  service_id integer NOT NULL REFERENCES services(id),
  PRIMARY KEY (customer_id, service_id)
);
