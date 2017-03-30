class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "I'm a cat named #{name}"
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet

#alternative with attr_accessor

class Cat
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def greet
    puts "I'm a cat named #{name}"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet