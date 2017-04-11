# # module Constantable
# #   # OTHER = 'up the inheritance hierarchy'
# # end

# # # CONSTANT = 'outer'
# # OTHER = 'outer 2'
# # module Animal
# #   CONSTANT = 'middle'
# #   # OTHER = 'middle 2'
# #   def run
# #     'run'
# #   end
# #   class Dog
# #     include Constantable
# #     # CONSTANT = 'inner'
# #     # OTHER = 'inner 2'
# #     # p ::CONSTANT
# #     # p Module.nesting
# #     # p CONSTANT
# #     p OTHER
# #   end
# # end
# # # p Animal::Dog::CONSTANT
# # # p Animal::CONSTANT
# # p Animal::Dog.ancestors
# # p Animal::Dog.new.run

# # class Fish2
# #   # p Fish::FISH
# #   def display
# #     p Fish::FISH
# #   end
# # end

# # class Fish
# #   FISH = 'a fish'
# # end



# # Fish2.new.display
# # # class

# # class Object

# # end

# WHEELS = 5

# module Maintenance
#   def change_tires
#     "Changing #{WHEELS} tires."
#   end
# end

# class Vehicle
#   WHEELS = 4
# end

# class Car < Vehicle
#   include Maintenance
# end

# a_car = Car.new
# p a_car.change_tires
# p Car.ancestors

# # Unlike instance methods or instance variables, constants are not evaluated at runtime, so their lexical scope - or, where they are used in the code - is very important. In this case, the line "Changing #{WHEELS} tires." is in the Maintenance module, which is where Ruby will look for the WHEELS constant. Even though we call the change_tires method from the a_car object, Ruby is not able to find the constant.

# # Constant resolution will look at the lexical scope first, and then look at the inheritance hierarchy. It can get very tricky when there are nested modules, each setting the same constants to different values. Be mindful that constant resolution rules are different from method lookup path or instance variables.
# # p Object.constants.grep(//)






# module MyClasses
#   class String
#     #...
#   end
# end

# p String.new
# p MyClasses::String.new

# module Swimmable
#   def swim
#     'swimming'
#   end
# end

# class Dog < Animal
#   include Swimmable
# end

# class Cat < Animal

# end

# fido = Dog.new
# p fido.swim

# 1 == 1 && 2 > 3

# The second use case for modules we'll look at is using modules as a container for methods, called module methods. This involves using modules to house other methods. This is very useful for methods that seem out of place within your code.

# https://launchschool.com/books/oo_ruby/read/inheritance#moremodules


# class BankAccount
#   include Comparable

#   def initialize(balance)
#     @balance = balance
#   end

#   def <=>(other_account)
#     balance <=> other_account.balance
#   end

#   protected

#   attr_reader :balance
# end

# john = BankAccount.new(100)
# adam = BankAccount.new(20)

# p john <=> adam # => 1
# p [john, adam].sort

class BankAccount
  def initialize(balance)
    @balance = balance
  end

  def >(other_account)
    balance > other_account.balance
  end

  protected

  attr_reader :balance
end

john = BankAccount.new(100)
adam = BankAccount.new(20)

p john <=> adam # => 1
p [john, adam].sort

