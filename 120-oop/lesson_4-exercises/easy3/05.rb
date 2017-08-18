# Question 5

# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer # => NoMethodError (we haven't defined an instance method named `manufacturer`)
tv.model # => would return whatever the instance method `model` would return

Television.manufacturer # => Would return whatever the class method `manufacturer` would return
Television.model # => NoMethodError (we haven't defined a class method called `model`)