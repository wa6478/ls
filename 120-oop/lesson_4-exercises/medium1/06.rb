# Question 6

# If we have these two methods:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# A: There is no functional difference in how the above two methods work
# the first is merely not using the setter method created by attr_accessor
# therefore the `@template =` ends up being a bit redundant
# it does however successfully utilize the getter method on line 13

# the second utilizes the getter and setter methods, correctly disambiguating the setter method from local variable initialization
# however, the getter method can be invoked without `self`, so that bit of code may be a bit redundant. May be helpful if there is some local variable called `template` that you want to disambiguate from, but in that case may be better to just rethink what name you want your local variable to use.

# from the solution per the Ruby style guide: "Avoid `self` where not required"