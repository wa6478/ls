module Swimmable # convention to use -able as a suffix on the verb of the behavior the module is modeling
  def swim
    "I'm swimming!" # modules are great for grouping common behaviors
  end
end

# remember that you can't instantiate (that is create objects from modules), you can only group common methods together and do 'namespacing' which means organizing similar classes under a module

class Fish < Animal
  include Swimmable # here we are mixing in the Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable # mixing in the swimmable module
end

sparky = Dog.new
neemo = Fish.new
paws = Cat.new

puts sparky.swim
puts neemo.swim
puts Dog.ancestors
puts paws.swim