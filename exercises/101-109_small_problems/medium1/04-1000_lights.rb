# 1000 Lights

# You have a bank of switches before you numbered from 1 to 1000. Each switch is connected to exactly one light that is initially off. You walk down the row of switches, and turn every one of them on. Then, you go back to the beginning and toggle switches 2, 4, 6, and so on. Repeat this for switches 3, 6, 9, and so on, and keep going until you have been through 1000 repetitions of this process.

# Write a program that determines which lights are on at the end.

# Example with 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4.

# With 10 lights, 3 lights are left on: lights 1, 4, and 9.

# want a toggle helper
# an object that holds all my lights (probs array)
# a current sequence
# a sequence helper that I feed a sequence to and it gives me the next one
#   or a way to generate a sequence given my starting number of the sequence
#   sequences can be thought of as, every first, every second, every third, ...
#   would just need to have a counter with an incrementer that steps through
#   step should work nicely

def how_many_lights(num)
  [0] * num
end

def toggle(light)
  light == 1 ? 0 : 1
end

def which_lights_are_on(num, trips)
  lights = [0] * num
  
  flip = 1
  trips.times do
    flip.step(lights.size, flip) do |light_num|
      lights[light_num - 1] = toggle(lights[light_num - 1])
    end
    flip += 1
  end
  
  on = []
  lights.each.with_index { |light, idx| on << idx + 1 if light == 1 }
  puts "Lights on at the end are numbers #{on.join(', ')}"
end

which_lights_are_on(5, 5) # => Lights on at the end are numbers 1, 4
which_lights_are_on(1000, 1000)
