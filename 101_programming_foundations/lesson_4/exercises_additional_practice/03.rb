# Exercise 3

# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# throw out the really old people (age 100 or older).

p ages.reject { |name, age| age > 99 }
p ages
p ages.select { |name, age| age < 100 }
p ages
p ages.keep_if { |name, age| age < 100 } # like a destructive select
p ages
p ages.delete_if { |name, age| age > 99 } # like a destructive reject