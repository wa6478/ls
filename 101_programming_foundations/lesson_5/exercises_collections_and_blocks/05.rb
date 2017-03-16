# Exercise 5

# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# figure out the total age of just the male members of the family.

p munsters.keys.map { |name| munsters[name]['age'] }.inject(&:+) # all members
male_ages = munsters.keys.map do |name|
              munsters[name]['age'] if munsters[name]['gender'] == 'male'
            end # male members only

p male_ages.compact.inject(&:+) # need to compact because anywhere the if didn't match it would have returned nil

# alternatively could have an external sum I added to

sum_of_ages = 0

munsters.keys.each do |name|
  if munsters[name]['gender'] == 'male'
    sum_of_ages += munsters[name]['age']
  end
end

p sum_of_ages

# make sure I use the correct variable names............ was adding to sum += instead of sum_of_ages and it kept throwing an error

# could have also iterated through with each_value which might have been a little cleaner

sum = 0

munsters.each_value do |data|
  sum += data['age'] if data['gender'] == 'male'
end

p sum