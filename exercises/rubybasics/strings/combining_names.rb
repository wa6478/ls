first_name = 'John'
last_name = 'Doe'

#way 1
full_name = "#{first_name} #{last_name}"
#way 2
full_name = first_name + " " + last_name
#way 3
full_name = ""
full_name << first_name
full_name << " "
full_name << last_name

puts full_name