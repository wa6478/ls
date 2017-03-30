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
end

kitty = Cat.new('Sophie')
kitty.greet