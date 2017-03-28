# good_dog_class.rb

class Animal
  attr_accessor :name
  
  def initialize(n)
    self.name = n  
  end
  
  def speak
    'Hello!'
  end
end

class GoodDog < Animal
  attr_accessor :name
  
  def initialize(nameyname)
    self.name = nameyname
  end

  def speak # Ruby checks the class of the object first before traversing the inheritance hierarchy unless we use super
    # "#{name} say arf!"
    super + " from GoodDog class"
  end
end

class Cat < Animal
end

class BadDog < Animal
  attr_accessor :age
  attr_reader :name
  
  def initialize(name, age)
    super(name)
    self.age = age
  end
end

sparky = GoodDog.new('Sparky')
paws = Cat.new('Kitty')
barky = BadDog.new('Barky', '17')

puts sparky.speak
puts paws.speak
puts barky.name
puts barky.age
p barky
puts barky.speak
puts paws.name