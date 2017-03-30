# Question 6

# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
# Which one of these is a class method (if any) and how do you know? How would you call a class method?

# `self.manufacturer` is a class method, because the reference to self at the class level is how you define a class method

# you would call a class method by calling it on the class itself, i.e. `Television.manufacturer`