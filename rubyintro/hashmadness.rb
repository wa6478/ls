

# def keyprinter(hash)
#   hash.each do |k,v|
#     p k
#   end
# end

def keyprinter(hash)  # using each_key instead of each 
  hash.each_key do |k|
    p k
  end
end


# def valueprinter(hash)
#   hash.each do |k,v|
#     p v
#   end
# end

def valueprinter(hash) # using each_value instead of each
  hash.each_value do |v|
    p v
  end
end

def keyvalueprinter(hash)
  hash.each do |k,v|
    p k
    p v
  end
end

cat = {name: "Spice", age: 10}
dog = {:name => "Spike", :age => 5}

keyprinter(cat)
p "---break---"
valueprinter(cat)
p "---break---"
keyvalueprinter(cat)
p "---break---"
keyprinter(dog)
p "---break---"
valueprinter(dog)
p "---break---"
keyvalueprinter(dog)