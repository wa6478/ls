p stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'
  puts "go"
when 'yellow'
  puts 'slow down'
else
  puts 'stop'
end