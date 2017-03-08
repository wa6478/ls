def profile(block_description,&block)
  start_time = Time.new
  block.call
  duration = Time.new - start_time
  puts "#{block_description}: #{duration} seconds"
end

doubling = Proc.new do 
  number = 1
  25000.times do
    number = number + number
  end
  puts "#{number.to_s.length} digits"
end

million_count = Proc.new do
  number = 1
  1_000_000.times do
    number += 1
  end
end

profile("25000 doublings", &doubling)
profile("Million count", &million_count)

# profile "25000 doublings" do 
#   number = 1
#   25000.times do
#     number = number + number
#   end
#   puts "#{number.to_s.length} digits"
# end
