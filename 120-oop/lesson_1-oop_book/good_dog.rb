# good_dog.rb

class GoodDog
  # constructor
  def initialize(name) # takes parameters for states we want to initialize an object with
    @name = name # instance variables live on as long as the object is around
  end            # one of the ways we can tie data to objects
  
  # behavior
  def speak 
    "#{@name}: Arf!" # instance methods have access to instance variables
  end
  
  # getter
  def name
    @name
  end
  
  # setter
  def name=(n) # note the special syntax 
    @name = n
  end
end

sparky = GoodDog.new('Sparky')  # => "This object was initialized!"
puts sparky.speak

fido = GoodDog.new('Fido')
puts fido.speak

puts sparky.name
puts fido.name
sparky.name = 'John' # note the special syntactical sugar because this is calling a setter method
puts sparky.name

# refactoring the getter and setter methods with attr_accessor

class GoodDog
  attr_accessor :name # note the symbol argument
  # this is equivalent to having a getter `name` method and setter `name=(n)` method
  # `attr_writer` and `attr_reader` are the write-only and read-only versions of this
  # multiple arguments can be denoted as such `attr_reader :name, :height, :weight` etc.
  
  # constructor
  def initialize(name) # takes parameters for states we want to initialize an object with
    @name = name # instance variables live on as long as the object is around
  end            # one of the ways we can tie data to objects
  
  # behavior
  def speak 
    "#{name}: Arf!" # now calling the instance method instead of the instance variable
  end # better to call instance getter methods than instance variables -- easier to modify the getter method than a variable later on
end

# updated with a few more methods

class GoodDog
  attr_accessor :name, :height, :weight
  
  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end
  
  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
    # self here is optional, since in this context ruby knows we are refering to the getter method
  end
  
  def something_else
    info # ways to call instance methods (or `self.info` to be more specific)
  end
  
  def change_info(n, h, w) # be careful not to create new variables
    self.name = n # need to use self to disambiguate the setter method from local variable initialization
    self.height = h #another way to think of self is that it refers to the calling object -- in this case, an instance method can only be called by an instance of the class, so the calling object is an instance, hence self is going to refer to the instance
    self.weight = w
  end
  
  def self.what_am_i # Class method uses `.self` at the beginning of method name -- note that in this case, the calling object will be the class itself
    "I'm a GoodDog class!" 
  end # Class methods are good for methods that don't need to deal with states
end

sparky = GoodDog.new('Sparky', '12 in', '10 lbs')
puts sparky.info

sparky.change_info('Spartacus', '24 in', '45 lbs')
puts sparky.info
puts sparky.something_else

puts GoodDog.what_am_i

class GoodDog
  @@number_of_dogs = 0 # this is a class variable! note the two @@
  
  def initialize
    @@number_of_dogs += 1 # look we can access class variables from within an instance method
  end
  
  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs
puts dog1
# constants and to_s

class GoodDog
  DOG_YEARS = 7
  
  attr_accessor :name, :age
  
  def initialize(nameyname, ageyage)
    @name = nameyname
    @age = ageyage * DOG_YEARS
  end
  
  def to_s
    "This dog's name is #{name} and it is #{age} in dog years"
  end
end

sparky = GoodDog.new('Sparky', 5)
puts sparky #to_s is automatically called on our object when we call puts
p sparky # == puts sparky.inspect
puts "#{sparky}" #to_s is also automatically called when we do string interpolation