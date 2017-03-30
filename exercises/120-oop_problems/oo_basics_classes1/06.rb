class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "I'm a cat named #{name}"
  end
end

kitty = Cat.new('Sophie')
kitty.greet