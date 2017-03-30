class Person
  attr_accessor :name, :pet # what's interesting to me is that we don't have to initialize all instance variables, we can always come up with more later on... makes this all a little easier to use!

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Robert")
bud = Bulldog.new             # assume Bulldog class from previous assignment

bob.pet = bud
# This last line is something new and we haven't seen that yet, but it's perfectly valid OO code. We've essentially set bob's @pet instance variable to bud, which is a Bulldog object. This means that when we call bob.pet, it is returning a Bulldog object.