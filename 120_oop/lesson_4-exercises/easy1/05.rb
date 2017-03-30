# Question 5

# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# A: Pizza has an instance variable because we define @name which is the syntax for a instance variable
# Fruit merely reassigns the parameter (a local variable) `name` and assigns it to itself

hot_pizza = Pizza.new('cheese')
orange = Fruit.new('apple')

p hot_pizza.instance_variables
p orange.instance_variables