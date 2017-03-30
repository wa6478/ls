# Given this class:

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
  
  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

# One problem is that we need to keep track of different breeds of dogs, since they have slightly different behaviors. For example, bulldogs can't swim, but all other dogs can.

# Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

karl = Bulldog.new
puts karl.speak           # => "bark!"
puts karl.swim            # => "can't swim!"

meow = Cat.new
puts meow.run
puts meow.speak

# Draw a class hierarchy diagram of the classes from step #2
      
#           Pets
#        (run, jump)
#         /     \
#       Dogs    Cats
# (speak, fetch,  (speak)
#       swim)   
#       /        
#    Bulldogs
#     (swim)

p Bulldog.ancestors
  
  
