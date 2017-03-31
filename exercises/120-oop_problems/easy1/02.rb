# What's the Output?

# Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s # calling to_s on a String does not create a new object
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name # => 'Fluffy'
puts fluffy # => "My name is FLUFFY." (upcase! is a destructive method)
puts fluffy.name # => 'FLUFFY'
puts name # => 'FLUFFY'

# What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

# to fix this cose, would change `upcase!` to `upcase`
# problem is that in this case, Ruby appears to pass by reference, allowing the instance methods to mutate the caller, which is the same object local variable outside of the class `name` is pointing at

# further exploration

name = 42
fluffy = Pet.new(name)
name += 1 # this is reassignment. Name is now pointing at a new object, Fixnum 43.
puts fluffy.name # => '42'
puts fluffy # => 'My name is 42'
puts fluffy.name # => '42'
puts name # 43

