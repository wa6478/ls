# Colorful Cat

# Using the following code, create a class named Cat that prints a greeting when #greet is invoked. The greeting should include the the name and color of the cat. Use a constant to define the color.

class Cat
  COLOR = 'purple'

  attr_reader :name, :color

  def initialize(name)
    @name = name
    @color = COLOR
  end

  def greet
    puts "My name is #{name}, my color is #{color}"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
# Expected output:

# Hello! My name is Sophie and I'm a purple cat!