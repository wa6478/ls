a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
     
# a.map! do |words|
#   words.split(" ")
# end

# p a.flatten

a.map!{|s| s.split}.flatten!
p a