# Question 7

# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

# the @@cats_count class variable increments by 1 for every Cat object we have initialized
# we can then use the class method self.cats_count to return the value of the @@cats_count variable

# to test

Cat.new('tabby')
Cat.new('tabby')
Cat.new('tabby')
puts Cat.cats_count # => 3