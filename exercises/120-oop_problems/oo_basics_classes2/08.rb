# Public Secret

# Using the following code, create a class named Person with an instance variable named @secret. Use a setter method to add a value to @secret, then use a getter method to print @secret.

class Person
  attr_accessor :secret # the key here is that instance variables don't need to be separately initialized like local variables do. By default they will always initialize to nil.
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret
# Expected output:

# Shh.. this is a secret!

# alternate longer:

class Person
  def secret
    @secret
  end

  def secret=(secret)
    @secret = secret # using this as the parameter is probably not ideal since the name is shared with the getter method, but the local variable will have priority, so the behavior works as expected
  end
end


person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret