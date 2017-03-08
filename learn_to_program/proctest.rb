def compose(proc1, proc2)
  Proc.new do |variable|
    proc2.call(proc1.call(variable))
  end
end
  
square_it = Proc.new do |variable|
  variable * variable
end

double_it = Proc.new do |variable|
  variable + variable
end

double_then_square = compose double_it, square_it
square_then_double = compose square_it, double_it

puts double_then_square.call(5)
puts square_then_double.call(5)