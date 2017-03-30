# Given the below usage of the Person class, code the class definition.

class Person
  attr_accessor :name
  
  def initialize(name)
    self.name = name # this works because the local variable name has priority over the class getter method name
    
  end
end


bob = Person.new('bob')
puts bob.name                  # => 'bob'
bob.name = 'Robert'
puts bob.name                  # => 'Robert'

puts '-----'

# Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.

class Person
  attr_accessor :first_name, :last_name
  
  def initialize(name)
    first_last = name.split
    @first_name = first_last[0]
    @last_name = first_last[1] == nil ? '' : first_last[1]
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'


puts '-----'

# Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.

class Person
  attr_accessor :first_name, :last_name
  
  def initialize(name)
    parts = name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end
  
  def name
    "#{@first_name} #{@last_name}".strip
  end
  
  def name=(name)
    parts = name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'

puts '-----'
# some refactoring

class Person
  attr_accessor :first_name, :last_name
  
  def initialize(name)
    parse_name(name)
  end
  
  def name
    "#{@first_name} #{@last_name}".strip
  end
  
  def name=(name)
    parse_name(name)
  end
  
  def to_s
    name
  end
  
  private
  
  def parse_name(name)
    parts = name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'

# Using the class definition from step #3, let's create a few more people -- that is, Person objects.

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

# If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?

puts bob.name == rob.name

# call out here is that we can't compare `bob` with `rob` without calling the `name` instance method on them
# But, aren't we then comparing two instances of the `String` class? Why can we compare them without calling some method on them to make them comparable?
# That answer will come, but it's an interesting observation at the present time

# Continuing with our Person class definition, what does the below print out?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
puts "The person's name is: #{bob.name}"

# this is going to call string interpolation on the object bob. And calling `to_s` on this object (via `puts`) is going to return something like `<Person0x0f23903>` (it's place in memory). If you wanted the name you would have to use string interpolation on the return value of bob.name, which is a string of the object's "name" that is probably what's intended by this
# although I have now modified the class to add an instance method called `to_s` that will just call the `getter` method for `@name`, which is going to allow the behavior of calling puts on bob to be a little more like what you would want