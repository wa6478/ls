# Write a method that counts the number of occurrences of each element in a given array.

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

# def count_occurrences(vehicles)
#   vehicle_count = Hash.new(0)
#   vehicles.each do |vehicle|
#     vehicle_count[vehicle] += 1
#   end
  
#   vehicle_count.each do |k, v|
#     puts "#{k} => #{v}"
#   end
# end

# count_occurrences(vehicles)

# alternate, using Array#uniq and Array#count

def count_occurrences(vehicles)
  vehicle_count = {} # this time no default value for hash since on line 23 we assign rather than increment a value to each key, this works
  vehicles.uniq.each do |vehicle|
    vehicle_count[vehicle] = vehicles.count(vehicle)
  end
  
  vehicle_count.each do |k, v|
    puts "#{k} => #{v}"
  end
end

count_occurrences(vehicles)

# Once counted, print each element alongside the number of occurrences.

# Expected output:

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
