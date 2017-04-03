def step(start, stop, step)
  while start <= stop
    yield(start)
    start += step
  end
  start
end


step(1, 10, 3) { |value| puts "value = #{value}" }
# value = 1
# value = 4
# value = 7
# value = 10