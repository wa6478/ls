# Exercises: Easy 3

# Question 1

# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
  
  def self.hi
    puts "hi"
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
# What happens in each of the following cases:

# case 1:

hello = Hello.new
hello.hi # => "Hello"

# case 2:

hello = Hello.new
hello.bye # => NoMethodError (Hello does not have access to Goodbye's methods just because they share a superclass)

# case 3:

hello = Hello.new
hello.greet # => ArgumentError, (given 0, expected 1) (inherited Greeting's greet method)

# case 4:

hello = Hello.new
hello.greet("Goodbye") # => "Goodbye" (this is obviously via the inherited Greeting's greet method, not the Goodbye class's method)

# case 5:

Hello.hi # => NoMethodError (No class method called `hi` was ever defined)

# Question 2
# If we call Hello.hi we get an error message. How would you fix this?

# A: Add a class method either to Hello or its parent class Greeting
# def self.hi
# but since class methods don't have access to instance methods, we won't be able to use `greet` within the `hi` class method