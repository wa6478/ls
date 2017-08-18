# How do we create an object in Ruby? Give an example of the creation of an object.

# We create objects in Ruby through the process of instantiation. Instantiation is when we call upon a class in Ruby to generate a new object in the "mold" of that class. This object will have access to the methods of that class, including those of modules that have been 'mixed in' (or 'mixins'). Instantion is done via the `.new` method.

# class MyClass
# end

# my_obj = MyClass.new

# What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

# A module is a collection of methods. This is helpful because the modularization of these methods allows that group of methods to be used by multiple classes, allowing for a degree of flexibility. Classes can call these methods by mixing in the module ('mixin'), using the `include` reserved word.

# per the answer:
#   "A module allows us to group reusable code into one place."
#   "Modules are also used as a namespace"

module MyModule
  def my_method
    puts 'hey'
  end
end

class MyClass
  include MyModule
end

my_obj = MyClass.new
my_obj.my_method