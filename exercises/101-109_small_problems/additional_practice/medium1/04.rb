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

# - row of switches 1..1000
# - all lights connected to switches are initially off
# - round 1: turn all on
# - round 2: flip every other switch starting with 2
# - round 3: flip every third switch starting with 3
# - do this 1000 times
# - determine what lights are on at the end

# - in: number of lights, number of trips
# - out: which lights are on as a string 'The result is X lights are on, lights: #'

# - possible data structures:
#   - array with 1000 0's, that get changed to a 1 if they are flipped
#   - hash of 1-1000, set to 'on' or 'off

# - hash seems simple enough
# - based on the round (round 1 or round 2) that seems to be how many lights I need to skip

# - algo:
#   - start with a hash with keys 1..1000, and either on or off
#   - initialize a round variable and set to integer 1
#   - iterate through number of trips. on each trip:
#     - iterate through the hash of lights
#     - depending on the round, flip every switch where switch % round == 0
#       - set equal to "off" or 0
#   - return the set of keys for which the value is "on" or 1
#   - puts a string that states the number of keys and enumerates them
  
def light_flipper(light_num, trips)
  lights = Hash.new(0)
  (1..light_num).each { |light| lights[light] = false }
  
  round = 1
  
  trips.times do 
    lights.each do |light, state|
      lights[light] = !state if light % round == 0
    end
    round += 1
  end
  
  on = lights.select { |light, state| state }
  
  puts "There are #{on.keys.size} lights on. Lights #{on.keys.join(', ')}."
end

light_flipper(5, 4)
light_flipper(5, 5)
light_flipper(10, 5)
light_flipper(100, 100)