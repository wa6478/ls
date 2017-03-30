# Protected Secret

# Using the following code, add an instance method named compare_secret that compares the value of @secret from person1 with the value of @secret from person2.

class Person
  attr_writer :secret

  def compare_secret(other_person)
    # puts "Secret 1: " + secret
    # puts "Secret 2: " + other_person.secret # unlike a private instance method, we can call a protected method on an object other than the calling object as long as we're doing it from within the class.
    # **another way to say this: protected methods allow access between class instances.**
    secret == other_person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)
# Expected output:

# false