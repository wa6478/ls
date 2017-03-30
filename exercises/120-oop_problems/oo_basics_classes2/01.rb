# Generic Greeting (Part 1)

# Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

kitty = Cat.new
kitty.class.generic_greeting
# calling class on kitty returns the class object kitty is an instance of
# calling the class method `generic_greeting` on the class object works
# because it's a method of that class
# `class` is inherited from the `Object` class