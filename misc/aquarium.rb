# notion of encapsulation:
# sectioning off code into containers and defining boundaries in your application
# hide implementation and pieces of functionality from the rest of the code base
# allows you to mitigate ripple effects of changes (they are encapsulated to a class or object)
# code with intention
# interaction of many small parts working together as opposed to a giant blob of dependency
# allows for more abstraction and makes the code easier to reason about
# enables larger and more complex problems as you can leverage your building blocks

module Swimmable # modules can be used for: 1) mixing in behaviors into classes 2) namespacing, i.e. grouping together related classes 3) container for out of place method modules
  def swim       # modules cannot be instantiated!                              # namespacing reduces likelihood of colliding with similarly named classes
  end                                                                           # makes them more recognizable
end

class Aquarium # classes define objects!
  attr_reader :animals # using attr_reader to define a getter method

  def initialize  # initialize is a constructor that is automatically called when `new` is called on the class
    @animals = [] # instance variable, tracks state of an object, its attributes -- scoped at the object level.
  end

  def add(animal) # instance method, a behavior of the object
    @animals << animal
  end
end

class Animal
  def feed
  end
end
                     # inheritance via classes and modules is how we achieve polymorphism
class Shark < Animal # class inheritance (single inheritance 'is-a')
  include Swimmable  # module mixin (Ruby's version of multiple inheritance 'has-a')
end

class Dolphin < Animal
  include Swimmable
end

sharky = Shark.new
flipper = Dolphin.new # example of polymorphism, using the same interface (`new`) on different objects to get different results -- data can be represented as different types

p sharky
p flipper

city_aquarium = Aquarium.new

city_aquarium.add(sharky) # example of using a collaborator object (tempting to introduce more collaborators but be aware of additional dependencies created) - classes should collaborate with few other classes
                          # tightly coupled dependencies are easier to understand but less flexible, and loosly coupled dependencies are harder to understand but more flexible
p city_aquarium.animals

p Dolphin.ancestors # Dolphin's method lookup path as it traverses the inheritance hierarchy

####

# layering in a fake operator method override (+ bonus inclusion of Comparable module)
class Aquarium # classes define objects!
  attr_reader :animals # using attr_reader to define a getter method

  def initialize  # initialize is a constructor that is automatically called when `new` is called on the class
    @animals = [] # instance variable, tracks state of an object, its attributes -- scoped at the object level.
  end

  def add(animal) # instance method, a behavior of the object
    @animals << animal
  end
end

class Animal
  CONSTANT = 5 # constants have lexical scope, so where you define them in the code is important for the purpose of scope resolution
  @@total_animals = 0 # class variables are scoped at the class level. All objects of the class and its subclasses all share 1 copy of the class variable.

  def self.total_animals
    @@total_animals
  end

  include Comparable

  def initialize(weight, happiness)
    @weight = weight
    @happiness = happiness
    @@total_animals += 1
  end

  def <=>(other) # same functional approach as overriding `to_s` -- Ruby will stop at the first method in the method lookup chain that matches the name
    @weight <=> other.weight
  end

  def feed
    self.happiness = happiness + 10 # disambiguating the setter method from local variable assignment/initialization
  end

  def how_happy
    @happiness
  end

  protected # from outside the class, acts like a private method, and from inside the class, acts like a public method

  attr_reader :weight # using a protected getter method in order to be able to compare objects of the same class

  private

  attr_accessor :happiness
end

class Shark < Animal
  include Swimmable
end

class Dolphin < Animal
  include Swimmable

  def initialize(weight, happiness)
    super
    @trainable = true
  end
end


flipper2 = Dolphin.new(50, 50)
flipper3 = Dolphin.new(60, 40)

p flipper3 <=> flipper2
# p flipper2.weight
p flipper2.how_happy
flipper2.feed
p flipper2.how_happy
p Animal.total_animals